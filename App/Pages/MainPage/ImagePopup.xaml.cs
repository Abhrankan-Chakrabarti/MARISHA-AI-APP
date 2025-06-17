
using MauiPopup.Views;
using Plugin.Maui.Popup.Views;

namespace App.Popup;

public partial class ImagePopup : BasePopupPage
{
    public ImagePopup()
    {
        InitializeComponent();
    }

    private void OnCloseButtonClicked(object sender, EventArgs e)
    {
        Close();
    }

}