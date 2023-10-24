using MockUp914.DB;
using MockUp914.DB.DBHelper;
using MockUp914.Pages.Clients;
using MockUp914.Pages.Users;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
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
        public BasketPage()
        {
            InitializeComponent();
            GetListProduct();
        }
        private void GetListProduct()
        {
            ObservableCollection<DB.Product> products = new ObservableCollection<DB.Product>(BasketHelper.Products);
            LvCartProductList.ItemsSource = products;
        }


        private void BtnRemoveToCart_Click(object sender, RoutedEventArgs e)
        {
            Button button = sender as Button;
            if (button == null)
            {
                return;
            }
            DB.Product selectedProduct = button.DataContext as DB.Product;

            if (selectedProduct != null)
            {
                if (selectedProduct.Quantity == 1 || selectedProduct.Quantity == 0)
                {
                    BasketHelper.Products.Remove(selectedProduct);
                }
                else
                {
                    selectedProduct.Quantity--;
                    int o = BasketHelper.Products.IndexOf(selectedProduct);
                    BasketHelper.Products.Remove(selectedProduct);
                    BasketHelper.Products.Insert(o, selectedProduct);
                }

            }
            GetListProduct();
        }

        private void BtnAddToCart_Click(object sender, RoutedEventArgs e)
        {
            Button button = sender as Button;
            if (button == null)
            {
                return;
            }

            DB.Product selectedProduct = button.DataContext as DB.Product;
            if (selectedProduct != null)
            {
                selectedProduct.Quantity++;
                int o = BasketHelper.Products.IndexOf(selectedProduct);
                BasketHelper.Products.Remove(selectedProduct);
                BasketHelper.Products.Insert(o, selectedProduct);
            }
            GetListProduct();
        }

        private void BtnAddProduct_Click(object sender, RoutedEventArgs e)
        {
            ObservableCollection<DB.Product> products = new ObservableCollection<DB.Product>(BasketHelper.Products);
            if (products.Count() == 0)
            {
                MessageBox.Show("Корзина пуста");
            }
            else
            {
                MainWindow mainWindow = Application.Current.Windows.OfType<MainWindow>().FirstOrDefault();
                ClientPage cp = new ClientPage();
                mainWindow.f_MainFrame.Navigate(cp);
            }
        }
    }
}
