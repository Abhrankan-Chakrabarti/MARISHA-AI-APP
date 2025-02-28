using Microsoft.Maui.Controls;
using System;
using System.Collections.ObjectModel;
using System.Net.Http;
using System.Threading.Tasks;


namespace App
{
    public partial class MainPage : ContentPage
    {
        ObservableCollection<string> chatMessages = new ObservableCollection<string>();
        Random random = new Random();
        bool isFirstResponse = true;
        private readonly HttpClient httpClient = new HttpClient();
        private readonly string apiurl = "https://api.openai.com/v1/chat/completions";


        public MainPage()
        {
            InitializeComponent();
            ChatList.ItemsSource = chatMessages; // Binds ListView to chat messages
        }



        private async void OnSendMessage(object sender, EventArgs e)
{
    string userMessage = UserInput.Text?.Trim(); // It is handled
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

            if (isFirstResponse == true)
                {
                    return await GetActualResponse(userMessage);
                }

            return random.Next(3) < 2
            ?await GetActualResponse(userMessage)
            : responses[random.Next(responses.Length)];

             
        }

        private async Task<string> GetActualResponse(string userMessage)
            {
                    try
                        {
                            var request = new HttpRequestMessage(HttpMethod.Post,apiurl);
                            request.Headers.Add("Authorization","Bearer ApIKey");

                            var requestBody = new
                            {
                                model = "gpt-4o",
                                messages = new[]
                                {
                                    new{role = " user", content = "userMessage"},
                                     new { role = "system", content = "You are Marisha AI, a helpful and sarcastic AI assistant." }
                                }
                            };

                            string jsonBody = System.Text.Json.JsonSerializer.Serialize(requestBody);
                            request.Content = new StringContent(jsonBody,System.Text.Encoding.UTF8,"application/json");

                            var response = await httpClient.SendAsync(request);
                            response.EnsureSuccessStatusCode();

                            var responseBody = await response.Content.ReadAsStringAsync();
                            using var jsonDoc = System.Text.Json.JsonDocument.Parse(responseBody);

                            var aiResponse = jsonDoc.RootElement
                            .GetProperty("choices")[0]
                            .GetProperty("message")
                            .GetProperty("content")
                            .GetString(); 

                            return string.IsNullOrWhiteSpace(aiResponse) ? "Tell me properly or I will go to sleep" : aiResponse;
                        }
                    catch(Exception)
                        {
                            return "Bruh I aint doing that , what a drag";
                        }
            }
    }
}