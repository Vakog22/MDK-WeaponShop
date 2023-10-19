using MockUp914.Pages;
using MockUp914.Pages.Catalogue;
using MockUp914.Pages.Sales;
using MockUp914.Pages.Users;
using MockUp914.Winds;
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
using MockUp914.Pages.Selection;

namespace MockUp914
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow(int type)
        {
            InitializeComponent();
            CataloguePage cataloguePage = new CataloguePage();
            f_MainFrame.Navigate(cataloguePage);
            if (type == 0)
            {
                btn_Users.Visibility = Visibility.Hidden;
                btn_Catalogue.Visibility = Visibility.Hidden;
            }
        }

        private void btn_Exit_Click(object sender, RoutedEventArgs e)
        {
            AuthWindow authWindow = new AuthWindow();
            authWindow.Show(); 
            this.Close();
        }

        private void btn_Catalogue_Click(object sender, RoutedEventArgs e)
        {
            CataloguePage cataloguePage = new CataloguePage();
            f_MainFrame.Navigate(cataloguePage);
        }

        private void btn_Sales_Click(object sender, RoutedEventArgs e)
        {
            SalePage salePage = new SalePage();
            f_MainFrame.Navigate(salePage);
        }

        private void btn_Users_Click(object sender, RoutedEventArgs e)
        {
            UserPage userPage = new UserPage();
            f_MainFrame.Navigate(userPage);
        }
    }
}
