using RepairRequests.Model;
using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
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
    /// Interaction logic for AddRequestsPage.xaml
    /// </summary>
    public partial class AddRequestsPage : Page
    {
        private Requests _currentRequest = new Requests();
        public AddRequestsPage(Requests selectedRequest)
        {
            InitializeComponent();
            if (selectedRequest != null)
            {
                _currentRequest = selectedRequest;
                this.Title = "Изменение заявки";
            }           
            DataContext = _currentRequest;
            cbEquip.ItemsSource = Entities.GetContext().Equipment.ToList();
            cbType.ItemsSource = Entities.GetContext().TypeOfFault.ToList();
            cbEmployee.ItemsSource = Entities.GetContext().Employee.ToList();
            cbStatus.ItemsSource = Entities.GetContext().Status.ToList();
        }

        public static bool testFio(String fio)
        {
            if(fio.Split(' ').Count()!=3)return false;
            return true;
        }
        public static bool testDesc(String description)
        {
            if (String.IsNullOrEmpty(description)) return false;
            return true;
        }
        public static bool testEquip(String equip)
        {
            if (equip == "") return false;
            return true;
        }
        private void btAdd_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder errors = new StringBuilder();
            if (tbFIO.Text == "")
                errors.AppendLine("Укажите фио!");
            if (cbEquip.SelectedValue == null)
                errors.AppendLine("Выберите оборудование!");
            if (cbType.SelectedValue == null)
                errors.AppendLine("Выберите тип неисправности!");
            if (tbDesc.Text == "")
                errors.AppendLine("Добавьте описание проблемы!");
            if (cbEmployee.SelectedValue == null)
                errors.AppendLine("Выберите оветственного!");
            if (cbStatus.SelectedValue == null)
                errors.AppendLine("Выберите статус!");
           
            if (errors.Length > 0)
            {
                MessageBox.Show(errors.ToString(), "Внимание!", MessageBoxButton.OK,MessageBoxImage.Warning);
                return;
            }
            Entities db = new Entities();
            Clients clientObject = new Clients
            {
                fio = tbFIO.Text
            };
            db.Clients.Add(clientObject);

            try
            {
                db.SaveChanges();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString(), "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            _currentRequest.clientId = clientObject.id;
            _currentRequest.dateOfCreation = DateTime.Now;
            if (_currentRequest.id == 0)
                Entities.GetContext().Requests.Add(_currentRequest);           

            try
            {
                Entities.GetContext().SaveChanges();               
                MessageBox.Show("Данные успешно сохранены!", "Внимание!", MessageBoxButton.OK, MessageBoxImage.Information);
                NavigationService.GoBack();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString(), "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }
        }
    }
}
