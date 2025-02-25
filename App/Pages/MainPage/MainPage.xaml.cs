using Microsoft.Maui.Controls;
using System;
using System.Collections.ObjectModel;

namespace App
{
    public partial class MainPage : ContentPage
    {
        ObservableCollection<string> chatMessages = new ObservableCollection<string>();
        Random random = new Random();

        public MainPage()
        {
            InitializeComponent();
            ChatList.ItemsSource = chatMessages; // Binds ListView to chat messages
        }

   

        private void OnSendMessage(object sender, EventArgs e)
        {
            string userMessage = UserInput.Text?.Trim();
            if (string.IsNullOrWhiteSpace(userMessage))
            {
                Dispatcher.DispatchDelayed(TimeSpan.FromSeconds(1), () =>
                {
                    chatMessages.Add("Come on Man Type Something!" );
                });
            }
            else
            {
                chatMessages.Add("You: " + userMessage);
                UserInput.Text = "";

                // Simulate Marisha AI Response
                Dispatcher.DispatchDelayed(TimeSpan.FromSeconds(1), () =>
                {
                    chatMessages.Add("Marisha AI: " + GetRandomResponse());
                });
            }
        }

        private string GetRandomResponse()
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

            return responses[random.Next(responses.Length)];
        }
    }
}