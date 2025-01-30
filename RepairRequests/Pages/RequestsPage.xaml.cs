using RepairRequests.Model;
using System.Data.Entity;
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
    /// Interaction logic for RequestsPage.xaml
    /// </summary>
    public partial class RequestsPage : Page
    {
        
        public RequestsPage()
        {
            InitializeComponent();
            DataGridRequests.ItemsSource = Entities.GetContext().Requests.ToList();
            
        }

        private void ButtonEdit_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new AddRequestsPage((sender as Button).DataContext as Requests));
        }

        private void DataGridRequests_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            if (Visibility == Visibility.Visible)
            {
                Entities.GetContext().ChangeTracker.Entries().ToList().ForEach(x => x.Reload());
                DataGridRequests.ItemsSource = Entities.GetContext().Requests.Include(r => r.Clients).ToList();              
                lbCount.Content = $"Количество выполненных заявок: {Entities.GetContext().Requests.Count(r => r.statusId == 3)}";
            }
        }

        private void btAdd_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new AddRequestsPage(null));
        }

        private void btDel_Click(object sender, RoutedEventArgs e)
        {
            var usersForRemoving = DataGridRequests.SelectedItems.Cast<Requests>().ToList();

            if (MessageBox.Show($"Вы точно хотите удалить записи в количестве {usersForRemoving.Count()} элементов?", "Внимание!",
                            MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                try
                {
                    Entities.GetContext().Requests.RemoveRange(usersForRemoving);
                    Entities.GetContext().SaveChanges();
                    lbCount.Content = $"Количество выполненных заявок: {Entities.GetContext().Requests.Count(r => r.statusId == 3)}";
                    DataGridRequests.ItemsSource = Entities.GetContext().Requests.ToList();
                    MessageBox.Show("Данные успешно удалены!", "Внимание!", MessageBoxButton.OK, MessageBoxImage.Information);   
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString(), "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }         
        }
    }
}
