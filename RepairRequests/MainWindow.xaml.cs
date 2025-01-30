using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Threading;

namespace RepairRequests
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            CbRole.SelectedIndex = 0;         
        }

        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            if (MainFrame.CanGoBack)
                MainFrame.GoBack();
        }

        private void MainFrame_Navigated(object sender, NavigationEventArgs e)
        {
            
            if (!(e.Content is Page page)) return;
            this.Title = page.Title;
            if (page is Pages.RequestsPage | page is Pages.ManagerPage)
            {
                BackButton.Visibility = Visibility.Hidden;
                CbRole.Visibility= Visibility.Visible;
            }
            else
            {
                BackButton.Visibility = Visibility.Visible;
                CbRole.Visibility = Visibility.Hidden;
            }
        }

        private void Window_Closing(object sender, System.ComponentModel.CancelEventArgs e)
        {
            if (MessageBox.Show("Вы действительно хотите выйти?", "Выход из приложения", MessageBoxButton.OKCancel, MessageBoxImage.Question) == MessageBoxResult.Cancel)
            {
                e.Cancel = true;
            }
        }

        private void CbRole_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (CbRole.SelectedIndex == 1)
                MainFrame.Source = new Uri("Pages/ManagerPage.xaml", UriKind.Relative);
            else
                MainFrame.Source = new Uri("Pages/RequestsPage.xaml", UriKind.Relative);
        }
    }
}
