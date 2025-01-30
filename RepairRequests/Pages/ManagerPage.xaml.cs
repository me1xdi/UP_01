using RepairRequests.Model;
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

namespace RepairRequests.Pages
{
    /// <summary>
    /// Interaction logic for ManagerPage.xaml
    /// </summary>
    public partial class ManagerPage : Page
    {
        public ManagerPage()
        {
            InitializeComponent();
            DataGridRequests.ItemsSource = Entities.GetContext().Requests.ToList();
        }

        private void btChangeDate_Click(object sender, RoutedEventArgs e)
        {
            if (DataGridRequests.SelectedItem is Requests request)
            {
                NavigationService.Navigate(new ChangeDatePage(request));
            }         
        }

        private void btOrderDetail_Click(object sender, RoutedEventArgs e)
        {
            if (DataGridRequests.SelectedItem is Requests request)
            {
                NavigationService.Navigate(new AddDetailPage(request));
            }
        }

        private void btAddEmployee_Click(object sender, RoutedEventArgs e)
        {
            if (DataGridRequests.SelectedItem is Requests request)
            {
                NavigationService.Navigate(new AddEmployeePage(request));
            }
        }

        private void btQR_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new QRPage());
        }
    }
}
