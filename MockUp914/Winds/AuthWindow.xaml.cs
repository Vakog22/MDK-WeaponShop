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
using System.Windows.Shapes;
using static MockUp914.DB.DBHelper.DBHelper;

namespace MockUp914.Winds
{
    /// <summary>
    /// Логика взаимодействия для AuthWindow.xaml
    /// </summary>
    public partial class AuthWindow : Window
    {
        public AuthWindow()
        {
            InitializeComponent();
        }

        private void btn_AuthEnter_Click(object sender, RoutedEventArgs e)
        {
            var person = context.Account.Where(i => i.Username == tb_Login.Text && i.Password == pb_Password.Password).FirstOrDefault();
            if (person != null)
            {
                if (person.IsAdmin)
                {
                    MainWindow mainWindow = new MainWindow(1);
                    mainWindow.Show();
                    this.Close();
                }
                else
                {
                    MainWindow mainWindow = new MainWindow(0);
                    mainWindow.Show();
                    this.Close();
                }
            }
            else { MessageBox.Show("Не верно"); }
        }
    }
}
