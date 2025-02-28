using Microsoft.Maui.Controls;
using System;
using System.Collections.ObjectModel;
using System.Net.Http;
using System.Threading.Tasks;
using System.Text.Json;
using System.Text;

namespace App
{
    public partial class MainPage : ContentPage
    {
        ObservableCollection<string> chatMessages = new ObservableCollection<string>();
        Random random = new Random();
        bool isFirstResponse = true;
        private readonly HttpClient httpClient = new HttpClient();
        private readonly string apiKey = "PLACE GEMINI API KEY HERE DONT SHARE WITH ANY ONE "; 
        private readonly string apiUrl = "https://generativelanguage.googleapis.com/v1/models/gemini-2.0-flash:generateContent";

        public MainPage()
        {
            InitializeComponent();
            ChatList.ItemsSource = chatMessages; // Binds ListView to chat messages
        }

        private async void OnSendMessage(object sender, EventArgs e)
        {
            string userMessage = UserInput.Text?.Trim();
            if (string.IsNullOrWhiteSpace(userMessage))
            {
                Dispatcher.DispatchDelayed(TimeSpan.FromSeconds(1), () =>
                {
                    chatMessages.Add("Come on Man Type Something!");
                });
            }
            else
            {
                chatMessages.Add("You: " + userMessage);
                UserInput.Text = "";

                string response = await GetRandomResponse(userMessage);

                Dispatcher.Dispatch(() =>
                {
                    chatMessages.Add("Marisha AI: " + response);
                });
            }
        }

        private async Task<string> GetRandomResponse(string userMessage)
        {
            string[] responses =
            {
                "I'm here to solve all your life problems! (Just kidding 😆)",
                "Error 404: Brain Not Found 🧠",
                "You're wasting your time, but so am I 🤖",
                "I wish I was ChatGPT, but here we are...",
                "Marisha AI is processing... Just kidding, I'm lazy!",
                "YOU WASTED TWO MINUTES OF YOUR LIFE! 😂"
            };

            if (isFirstResponse)
            {
                isFirstResponse = false;
                return await GetActualResponse(userMessage);
            }

            return random.Next(3) < 2
                ? await GetActualResponse(userMessage)
                : responses[random.Next(responses.Length)];
        }

        private async Task<string> GetActualResponse(string userMessage)
        {
            try
            {
                string requestUrl = $"{apiUrl}?key={apiKey}";

                var requestBody = new
                {
                    contents = new[]
                    {
                        new
                        {
                            role = "user",
                            parts = new[]
                            {
                                new { text = userMessage }
                            }
                        }
                    }
                };

                string jsonBody = JsonSerializer.Serialize(requestBody);
                var request = new HttpRequestMessage(HttpMethod.Post, requestUrl);
                request.Content = new StringContent(jsonBody, Encoding.UTF8, "application/json");

                var response = await httpClient.SendAsync(request);

                if (!response.IsSuccessStatusCode)
                {
                    string errorResponse = await response.Content.ReadAsStringAsync();
                    return $"❌ MARISHA AI ERROR! \n{errorResponse}";
                }

                var responseBody = await response.Content.ReadAsStringAsync();
                using var jsonDoc = JsonDocument.Parse(responseBody);

                
                if (jsonDoc.RootElement.TryGetProperty("candidates", out JsonElement candidates) &&
                    candidates.GetArrayLength() > 0 &&
                    candidates[0].TryGetProperty("content", out JsonElement content) &&
                    content.TryGetProperty("parts", out JsonElement parts) &&
                    parts.GetArrayLength() > 0 &&
                    parts[0].TryGetProperty("text", out JsonElement textElement))
                {
                    return textElement.GetString() ?? "🤖 Marisha AI: No response received!";
                }

                return "🤖 Marisha AI: No valid response!";
            }
            catch (Exception ex)
            {
                return $"What a Drag! You caused an Error: {ex.Message}";
            }
        }
    }
}
