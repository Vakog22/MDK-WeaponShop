using MockUp914.DB;
using MockUp914.Pages.Catalogue;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Contexts;
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
using static MockUp914.DB.DBHelper.DBHelper;

namespace MockUp914.Pages.Users
{
    /// <summary>
    /// Логика взаимодействия для UserPage.xaml
    /// </summary>
    public partial class UserPage : Page
    {
        public UserPage()
        {
            InitializeComponent();
            UpdateData();
        }

        private void btn_AddUser_Click(object sender, RoutedEventArgs e)
        {
            MainWindow mainWindow = Application.Current.Windows.OfType<MainWindow>().FirstOrDefault();
            UserPageAdd userPageAdd = new UserPageAdd();
            mainWindow.f_MainFrame.Navigate(userPageAdd);
        }

        private void btn_Edit_Click(object sender, RoutedEventArgs e)
        {
            UserPageEdit userPageEdit = new UserPageEdit(LvWorker.SelectedItem as Worker);
            MainWindow mainWindow = Application.Current.Windows.OfType<MainWindow>().FirstOrDefault();
            mainWindow.f_MainFrame.Navigate(userPageEdit);
        }

        private void btn_Delete_Click(object sender, RoutedEventArgs e)
        {
            Worker worker = LvWorker.SelectedItem as Worker;
            var Result = MessageBox.Show("Вы уверены",
                "Удалить пользователя", 
                MessageBoxButton.YesNo, 
                MessageBoxImage.Question);
            if (Result == MessageBoxResult.Yes && worker.IsAdmin == false)
            {
                context.Worker.Remove(worker);
                context.SaveChanges();
                UpdateData();
                MessageBox.Show("Пользователь удалён");
            }
            else if (Result == MessageBoxResult.Yes && worker.IsAdmin == true)
            {
                MessageBox.Show("Пользователь - админ, удалить нельзя");
            }
        }
        private void UpdateData()
        {
            List<Worker> EmployeeList = new List<Worker>();
            EmployeeList = context.Worker.ToList();
            LvWorker.ItemsSource = EmployeeList;
        }
        private void tb_Search_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (String.IsNullOrWhiteSpace(tb_Search.Text))
            {
                LvWorker.ItemsSource = context.Worker.ToList();
            }
            else
            {
                LvWorker.ItemsSource = context.Worker.ToList().Where(i => i.FirstName.StartsWith(tb_Search.Text) || i.LastName.StartsWith(tb_Search.Text));
            }
        }
    }
}
