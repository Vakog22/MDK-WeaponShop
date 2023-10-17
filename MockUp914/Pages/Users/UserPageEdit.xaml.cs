using MockUp914.DB;
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
    /// Логика взаимодействия для UserPageEdit.xaml
    /// </summary>
    public partial class UserPageEdit : Page
    {
        Worker worker = null;
        public UserPageEdit(Worker w)
        {
            InitializeComponent();
            tb_FirstName.Text = w.FirstName;
            tb_LastName.Text = w.LastName;
            tb_PassportSerial.Text = w.PassportSerial;
            tb_PassportNum.Text = w.PassportNum;
            tb_DateOfBirth.SelectedDate = w.DateOfBirth;
            tb_Phone.Text = w.Phone;
            tb_Username.Text = w.Account.Username;
            tb_Password.Text = w.Account.Password;
            worker = w;
            worker.Id = w.Id;
        }

        private void btn_Cancel_Click(object sender, RoutedEventArgs e)
        {
            UserPage userPage = new UserPage();
            MainWindow mainWindow = Application.Current.Windows.OfType<MainWindow>().FirstOrDefault();
            mainWindow.f_MainFrame.Navigate(userPage);
        }

        private void btn_Save_Click(object sender, RoutedEventArgs e)
        {
            worker.FirstName = tb_FirstName.Text;
            worker.LastName = tb_LastName.Text;
            worker.PassportSerial = tb_PassportSerial.Text;
            worker.PassportNum = tb_PassportNum.Text;
            worker.DateOfBirth = tb_DateOfBirth.SelectedDate.Value;
            worker.Phone = tb_Phone.Text;
            worker.Account.Username = tb_Username.Text;
            worker.Account.Password = tb_Password.Text;
            context.SaveChanges();
            MainWindow mainWindow = Application.Current.Windows.OfType<MainWindow>().FirstOrDefault();
            UserPage userPage = new UserPage();
            mainWindow.f_MainFrame.Navigate(userPage);
        }
    }
}
