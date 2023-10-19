using MockUp914.DB;
using MockUp914.DB.DBHelper;
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

namespace MockUp914.Pages.Basket
{
    /// <summary>
    /// Логика взаимодействия для BasketPage.xaml
    /// </summary>
    public partial class BasketPage : Page
    {
        Check check;
        public BasketPage()
        {
            InitializeComponent();
            LvProduct.ItemsSource = context.Product.ToList();
            check = new Check();
            check.Id = 3;
            check.Date = DateTime.Now;
            check.IdWorker = 1;
            check.IdClient = 0;
        }

        private void btn_Minus_Click(object sender, RoutedEventArgs e)
        {

        }

        private void btn_Plus_Click(object sender, RoutedEventArgs e)
        {
            ProductCheck productCheck = new ProductCheck();
            productCheck.IdCheck = check.Id;
            productCheck.Id = 3;
            Button button = (Button)sender;
            if (button == null) 
            {
                return;
            }
            var SelectedProduct = button.DataContext as DB.Product;
        }
    }
}
