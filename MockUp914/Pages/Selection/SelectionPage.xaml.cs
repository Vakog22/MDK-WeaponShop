using MockUp914.DB;
using MockUp914.DB.DBHelper;
using MockUp914.Pages.Basket;
using MockUp914.Pages.Catalogue;
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

namespace MockUp914.Pages.Selection
{
    /// <summary>
    /// Логика взаимодействия для SelectionPage.xaml
    /// </summary>
    public partial class SelectionPage : Page
    {
        public SelectionPage()
        {
            InitializeComponent();
            GetProduct();
        }
        private void GetProduct()
        {
            ObservableCollection<Product> ProdList = new ObservableCollection<Product>(context.Product.ToList());

            LVEmp.ItemsSource = ProdList;

        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            BasketPage basketPage = new BasketPage();
            MainWindow mainWindow = Application.Current.Windows.OfType<MainWindow>().FirstOrDefault();
            mainWindow.f_MainFrame.Navigate(basketPage);
        }

        private void BtnPlus_Click(object sender, RoutedEventArgs e)
        {
            bool seek = true;
            Button button = sender as Button;
            if (button == null)
            {
                return;
            }
            DB.Product selectedProduct = button.DataContext as DB.Product;
            if (selectedProduct != null)
            {
                for (int i = 0; i < BasketHelper.Products.Count; i++)
                {
                    if (BasketHelper.Products[i] == selectedProduct)
                    {
                        BasketHelper.Products[i].Quantity++;
                        seek = false;
                    }
                }
                if (seek)
                {
                    selectedProduct.Quantity = +1;
                    BasketHelper.Products.Add(selectedProduct);
                }
            }
            GetProduct();
        }

        private void BtnMinus_Click(object sender, RoutedEventArgs e)
        {
            Button button = sender as Button;
            if (button == null)
            {
                return;
            }
            DB.Product selectedProduct = button.DataContext as DB.Product;
            if (selectedProduct != null)
            {
                for (int i = 0; i < BasketHelper.Products.Count; i++)
                {
                    if (BasketHelper.Products[i] == selectedProduct)
                    {
                        BasketHelper.Products[i].Quantity--;
                    }
                }
                if (selectedProduct.Quantity == 0)
                {
                    BasketHelper.Products.Remove(selectedProduct);
                }
            }
            GetProduct();
        }

        private void BtnDelete_Click(object sender, RoutedEventArgs e)
        {
            Button button = sender as Button;
            if (button == null)
            {
                return;
            }
            DB.Product selectedProduct = button.DataContext as DB.Product;
            if (selectedProduct != null)
            {
                for (int i = 0; i < BasketHelper.Products.Count; i++)
                {
                    if (BasketHelper.Products[i] == selectedProduct)
                    {
                        BasketHelper.Products[i].Quantity = 0;
                    }
                }
                BasketHelper.Products.Remove(selectedProduct);
            }
            GetProduct();
        }

    }
}
