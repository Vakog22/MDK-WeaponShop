using MockUp914.DB;
using MockUp914.Pages.Basket;
using MockUp914.Pages.Catalogue;
using MockUp914.Pages.Selection;
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

namespace MockUp914.Pages.Sales
{
    /// <summary>
    /// Логика взаимодействия для SalePage.xaml
    /// </summary>
    public partial class SalePage : Page
    {
        public SalePage()
        {
            InitializeComponent();
            UpdateData();
        }
        private void UpdateData()
        {
            List<Check> EmployeeList = new List<Check>();
            EmployeeList = context.Check.ToList();
            LvSales.ItemsSource = EmployeeList;
        }

        private void btn_AddSale_Click(object sender, RoutedEventArgs e)
        {
            MainWindow mainWindow = Application.Current.Windows.OfType<MainWindow>().FirstOrDefault();
            SelectionPage selectionPage = new SelectionPage();
            mainWindow.f_MainFrame.Navigate(selectionPage);
        }

        private void btn_view_Click(object sender, RoutedEventArgs e)
        {
            Check check = LvSales.SelectedItem as Check;
            DG_Prods.ItemsSource = check.ProductCheck.ToList().Where(i => i.IdCheck == check.Id);
        }
    }
}
