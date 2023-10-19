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
            tb_DateOfBirth.SelectedDate = DateTime.UtcNow;
            tb_FirstName.Text = "test";
            tb_LastName.Text = "test";
            tb_Patronymic.Text = "test";
            tb_Passport.Text = "0000000000";
            tb_Phone.Text = "00000000000";
            tb_Username.Text = "test";
            tb_Password.Text = "test";
        }

        private void btn_Add_Click(object sender, RoutedEventArgs e)
        {
            DB.Worker worker = new DB.Worker();
            worker.FirstName = tb_FirstName.Text;
            worker.LastName = tb_LastName.Text;
            worker.Patronymic = tb_Patronymic.Text;
            worker.Passport = tb_Passport.Text;
            worker.DateOfBirth = tb_DateOfBirth.SelectedDate.Value;
            worker.Phone = tb_Phone.Text;
            worker.Username = tb_Username.Text;
            worker.Password = tb_Password.Text;
            worker.IsAdmin = false;
            try
            {
                context.Worker.Add(worker);
                context.SaveChanges();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                throw;
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
