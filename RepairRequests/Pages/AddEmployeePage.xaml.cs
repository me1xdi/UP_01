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
    /// Логика взаимодействия для AddEmployeePage.xaml
    /// </summary>
    public partial class AddEmployeePage : Page
    {
        private Comments comment= new Comments();
        public AddEmployeePage(Requests request)
        {
            InitializeComponent();
            comment.dateOfCreation = DateTime.Now;
            comment.Requests = request;
            comment.comment = "Привлечение к работе специалиста";
            DataContext = comment;
            employeeComboBox.ItemsSource = Entities.GetContext().Employee.Where(x=>x.id!=request.Employee.id).ToList();
        }

        private void btSave_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                Entities.GetContext().Comments.Add(comment);
                Entities.GetContext().SaveChanges();
                MessageBox.Show("Данные успешно сохранены!", "Внимание!", MessageBoxButton.OK, MessageBoxImage.Information);
                NavigationService.GoBack();
            }
            catch (Exception t)
            {
                MessageBox.Show(t.Message, "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
    }
}
