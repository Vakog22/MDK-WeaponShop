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
using static MockUp914.DB.DBHelper.DBHelper;

namespace MockUp914.Pages.Users
{
    /// <summary>
    /// Логика взаимодействия для UserPageAdd.xaml
    /// </summary>
    public partial class UserPageAdd : Page
    {
        public UserPageAdd()
        {
            InitializeComponent();
        }

        private void btn_Add_Click(object sender, RoutedEventArgs e)
        {
            DB.Worker worker = new DB.Worker();
            worker.FirstName = tb_FirstName.Text;
            worker.LastName = tb_LastName.Text;
            worker.PassportSerial = tb_PassportSerial.Text;
            worker.PassportNum = tb_PassportNum.Text;
            worker.DateOfBirth = tb_DateOfBirth.SelectedDate.Value;
            worker.Phone = tb_Phone.Text;
            //worker.Account.Username = tb_Username.Text;
            //worker.Account.Password = tb_Password.Text;
            try
            {
                //worker.Account.Id = 2;
                context.Worker.Add(worker);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            MainWindow mainWindow = Application.Current.Windows.OfType<MainWindow>().FirstOrDefault();
            UserPage userPage = new UserPage();
            mainWindow.f_MainFrame.Navigate(userPage);
        }

        private void btn_Cancel_Click(object sender, RoutedEventArgs e)
        {
            MainWindow mainWindow = Application.Current.Windows.OfType<MainWindow>().FirstOrDefault();
            UserPage userPage = new UserPage();
            mainWindow.f_MainFrame.Navigate(userPage);
        }
    }
}
