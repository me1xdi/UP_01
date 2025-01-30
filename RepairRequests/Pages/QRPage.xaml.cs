using QRCoder;
using QRCoder.Xaml;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;
namespace RepairRequests.Pages
{
    /// <summary>
    /// Логика взаимодействия для QRPage.xaml
    /// </summary>
    public partial class QRPage : Page
    {
        public QRPage()
        {
            InitializeComponent();
        }

        private void Grid_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            //для корректной работы нужно установить nuget библиотеку QRCoder и QRCoder Xaml
            this.Title = "Оставьте отзыв";
            QRCodeGenerator qrGenerator = new QRCodeGenerator();
            QRCodeData qrCodeData = qrGenerator.CreateQrCode(@"https://docs.google.com/forms/d/e/1FAIpQLSdFcZV2Z7_c0oDVnWBi8D7lqe9ZBJbfQolz4Go7OeAdkXgOeQ/viewform?usp=dialog", QRCodeGenerator.ECCLevel.Q);
            XamlQRCode qrCode = new XamlQRCode(qrCodeData);
            DrawingImage qrCodeAsXaml = qrCode.GetGraphic(20);
            qrImage.Source= qrCodeAsXaml;
        }
    }
}
