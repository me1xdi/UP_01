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
    /// Логика взаимодействия для ChangeDatePage.xaml
    /// </summary>
    public partial class ChangeDatePage : Page
    {
        private Requests requests;
        public ChangeDatePage(Requests request)
        {
            InitializeComponent();
            this.requests = request;
            DataContext = this.requests;
        }
        private void btSave_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                Entities.GetContext().SaveChanges();
                MessageBox.Show("Данные успешно сохранены!", "Внимание!", MessageBoxButton.OK, MessageBoxImage.Information);
                NavigationService.GoBack();
            }
            catch (Exception o)
            {
                MessageBox.Show(o.Message, "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
    }
}
