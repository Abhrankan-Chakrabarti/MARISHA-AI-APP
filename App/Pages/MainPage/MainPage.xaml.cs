using Microsoft.Maui.Controls;
using Microsoft.Maui.Storage;
using System;
using System.Collections.ObjectModel;
using System.Collections.Generic;
using System.IO;
using System.Net.Http;
using System.Text.Json;
using System.Text;
using System.Threading.Tasks;

namespace App
{
    public partial class MainPage : ContentPage
    {
        public class ChatMessage
        {
            public string Text { get; set; } = "";
            public string ImageUrl { get; set; } = "";
            public bool IsText => !string.IsNullOrEmpty(Text);
            public bool IsImage => !string.IsNullOrEmpty(ImageUrl);
        }

        ObservableCollection<ChatMessage> chatMessages = new ObservableCollection<ChatMessage>();
        private readonly HttpClient httpClient = new HttpClient();

        private readonly string mistralApiUrl = "https://api.mistral-7b.com/v1/chat/completions";
        private readonly string claudeApiUrl = "https://api.anthropic.com/v1/messages";
        private readonly string geminiApiUrl = "https://generativelanguage.googleapis.com/v1/models/gemini-2.0-flash:generateContent?key=AIzaSyCY630oJvwNHgE_fmN-ab9UKyI4A5oXi_c";
        private bool Isresponding = false;

        static Dictionary<string, int> CategoryMap = new Dictionary<string, int>()
        {
            {"Information Seeking", 1},
            {"Image Generation", 2},
            {"Report Writing", 3}
        };

        static Dictionary<int, Func<string, Task<string>>> routeHandler;

        public MainPage()
        {
            InitializeComponent();
            ChatList.ItemsSource = chatMessages;

            routeHandler = new Dictionary<int, Func<string, Task<string>>>()
            {
                {1, HandleInfoQuery},
                {2, HandleImgQuery},
                {3, HandleCreativeQuery}
            };
        }

        public async void UpdateLoadingIndicator()
        {
            if (Isresponding)
            {
                Spinner.IsVisible = true;
                Spinner.IsRunning = true;
                await Spinner.TranslateTo(23, 0, 400, Easing.SinOut);
            }
            else
            {
                await Spinner.TranslateTo(0, 0, 400, Easing.SinIn);
                Spinner.IsVisible = false;
                Spinner.IsRunning = false;
                Spinner.TranslationX = 0;
            }
        }

        private async void OnSendMessage(object sender, EventArgs e)
        {
            string userMessage = (UserInput.Text ?? string.Empty).Trim();
            if (string.IsNullOrWhiteSpace(userMessage))
            {
                chatMessages.Add(new ChatMessage { Text = "Come on, type something!" });
                return;
            }

            chatMessages.Add(new ChatMessage { Text = "You: " + userMessage });
            UserInput.Text = "";
            string category = await GetResponseCategory(userMessage);

            if (CategoryMap.TryGetValue(category, out int categoryId) && routeHandler.TryGetValue(categoryId, out var handler))
            {
                string response = await handler(userMessage);
                if (categoryId == 2)
                {
                    if (!string.IsNullOrEmpty(response))
                    {
                        if (Uri.IsWellFormedUriString(response, UriKind.Absolute))
                            chatMessages.Add(new ChatMessage { ImageUrl = response });
                        else
                            chatMessages.Add(new ChatMessage { Text = "SHAIDOW AI (Fallback): " + response });
                    }
                }
                else
                {
                    chatMessages.Add(new ChatMessage { Text = "SHAIDOW AI: " + response });
                }
            }
            else
            {
                string geminiResponse = await HandleFallbackQuery(userMessage);
                chatMessages.Add(new ChatMessage { Text = "SHAIDOW AI: " + geminiResponse });
            }
        }

        private async Task<string> GetResponseCategory(string userMessage)
        {
            try
            {
                var requestBody = new
                {
                    model = "mistral-small",
                    messages = new[]
                    {
                        new { role = "user", content = $"Categorize this query: {userMessage}" }
                    }
                };

                string jsonBody = JsonSerializer.Serialize(requestBody);
                var request = new HttpRequestMessage(HttpMethod.Post, mistralApiUrl)
                {
                    Content = new StringContent(jsonBody, Encoding.UTF8, "application/json")
                };
                request.Headers.Add("Authorization", "Bearer wjy20ymt9gFt4EMgvD4ymjxpeMun1cVD");

                var response = await httpClient.SendAsync(request);
                if (!response.IsSuccessStatusCode)
                {
                    Console.WriteLine($"Mistral categorization error : {response.StatusCode}, Details : {await response.Content.ReadAsStringAsync()}");
                    return "Unknown";
                }

                var responseBody = await response.Content.ReadAsStringAsync();
                using var jsonDoc = JsonDocument.Parse(responseBody);
                string rawCategory = jsonDoc.RootElement
                    .GetProperty("choices")[0]
                    .GetProperty("message")
                    .GetProperty("content")
                    .GetString()?.Trim() ?? "Unknown";

                return CategoryMap.ContainsKey(rawCategory) ? rawCategory : "Unknown";
            }
            catch (Exception)
            {
                return "Unknown";
            }
        }

        private async Task<string> HandleFallbackQuery(string query)
        {
            Isresponding = true;
            UpdateLoadingIndicator();
            try
            {
                var requestBody = new
                {
                    contents = new[]
                    {
                        new
                        {
                            parts = new[]
                            {
                                new { text = query },
                                new { text = "You are SHAIDOW, an AI assistant developed by Ricky..." }
                            }
                        }
                    }
                };

                string jsonBody = JsonSerializer.Serialize(requestBody);
                var request = new HttpRequestMessage(HttpMethod.Post, geminiApiUrl)
                {
                    Content = new StringContent(jsonBody, Encoding.UTF8, "application/json")
                };

                var response = await httpClient.SendAsync(request);
                if (!response.IsSuccessStatusCode)
                    return $"Gemini API Error: {response.StatusCode}";

                var responseBody = await response.Content.ReadAsStringAsync();
                using var jsonDoc = JsonDocument.Parse(responseBody);

                if (jsonDoc.RootElement.TryGetProperty("candidates", out var candidates) &&
                    candidates.GetArrayLength() > 0 &&
                    candidates[0].TryGetProperty("content", out var content) &&
                    content.TryGetProperty("parts", out var parts) &&
                    parts.GetArrayLength() > 0 &&
                    parts[0].TryGetProperty("text", out var text))
                {
                    return text.GetString() ?? "Gemini gave empty response.";
                }

                return "Gemini returned an unexpected format.";
            }
            catch (Exception ex)
            {
                return $"Error: {ex.Message}";
            }
            finally
            {
                Isresponding = false;
                UpdateLoadingIndicator();
            }
        }

        private async Task<string> HandleInfoQuery(string query)
        {
            Isresponding = true;
            UpdateLoadingIndicator();
            try
            {
                var requestBody = new
                {
                    model = "mistral-small",
                    messages = new[]
                    {
                        new { role = "system", content = "You are SHAIDOW, an AI assistant developed by Ricky..." },
                        new { role = "user", content = query }
                    }
                };

                string jsonBody = JsonSerializer.Serialize(requestBody);
                var request = new HttpRequestMessage(HttpMethod.Post, mistralApiUrl)
                {
                    Content = new StringContent(jsonBody, Encoding.UTF8, "application/json")
                };
                request.Headers.Add("Authorization", "Bearer wjy20ymt9gFt4EMgvD4ymjxpeMun1cVD");

                var response = await httpClient.SendAsync(request);
                if (!response.IsSuccessStatusCode)
                {
                    Console.WriteLine($"Mistral query error : {response.StatusCode}, Details : {await response.Content.ReadAsStringAsync()}");
                    return await HandleFallbackQuery(query);
                }

                var responseBody = await response.Content.ReadAsStringAsync();
                using var jsonDoc = JsonDocument.Parse(responseBody);
                string answer = jsonDoc.RootElement
                    .GetProperty("choices")[0]
                    .GetProperty("message")
                    .GetProperty("content")
                    .GetString()?.Trim();

                return string.IsNullOrWhiteSpace(answer) ? await HandleFallbackQuery(query) : answer;
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error in HandleInfoQuery: {ex.Message}");
                return await HandleFallbackQuery(query);
            }
            finally
            {
                Isresponding = false;
                UpdateLoadingIndicator();
            }
        }

        private async Task<string> HandleImgQuery(string query)
        {
            Isresponding = true;
            UpdateLoadingIndicator();
            try
            {
                using var client = new HttpClient();
                client.DefaultRequestHeaders.Add("api-key", "b2d062a1-97a0-4d77-9db9-f63bcb9cbe3c");

                var content = new FormUrlEncodedContent(new Dictionary<string, string>
                {
                    { "text", query }
                });

                var response = await client.PostAsync("https://api.deepai.org/api/text2img", content);
                var responseString = await response.Content.ReadAsStringAsync();

                if (!response.IsSuccessStatusCode)
                {
                    return $"Image Generation Error: {response.StatusCode}";
                }

                var json = JsonDocument.Parse(responseString);
                if (json.RootElement.TryGetProperty("output_url", out var imageUrlElement))
                {
                    return imageUrlElement.GetString();
                }

                return "Image generation failed: output_url missing.";
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error in HandleImgQuery: {ex.Message}");
                return await HandleFallbackQuery(query);
            }
            finally
            {
                Isresponding = false;
                UpdateLoadingIndicator();
            }
        }

        private async Task<string> HandleCreativeQuery(string query)
        {
            Isresponding = true;
            UpdateLoadingIndicator();
            try
            {
                // Add your Claude or other logic here later
                return await Task.FromResult("[Creative response goes here]");
            }
            finally
            {
                Isresponding = false;
                UpdateLoadingIndicator();
            }
        }
    }
}
