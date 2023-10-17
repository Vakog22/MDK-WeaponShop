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
            List<Worker> EmployeeList = new List<Worker>();
            EmployeeList = context.Worker.ToList();
            LvWorker.ItemsSource = EmployeeList;
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
            if (worker.Account.IsAdmin == true) { MessageBox.Show("АЗАЗА"); }
            else 
            {
                MessageBoxResult result = MessageBox.Show("Удалить пользователя", "ACHTUNG!",
                                     MessageBoxButton.YesNo,
                                     MessageBoxImage.Question);
                if (result == MessageBoxResult.No)
                {
                    
                }
                else if (result == MessageBoxResult.Yes)
                {
                    context.Worker.Remove(worker);
                    context.SaveChanges();
                    List<Worker> EmployeeList = new List<Worker>();
                    EmployeeList = context.Worker.ToList();
                    LvWorker.ItemsSource = EmployeeList;
                }
            }
            
        }
    }
}
