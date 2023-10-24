using MockUp914.DB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.RightsManagement;
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

namespace MockUp914.Pages.Catalogue
{
    /// <summary>
    /// Логика взаимодействия для CataloguePage.xaml
    /// </summary>
    public partial class CataloguePage : Page
    {
        public CataloguePage()
        {
            InitializeComponent();
            LvProduct.ItemsSource = context.Product.ToList();
        }

        private void btn_AddProduct_Click(object sender, RoutedEventArgs e)
        {
            MainWindow mainWindow = Application.Current.Windows.OfType<MainWindow>().FirstOrDefault();
            CataloguePageAdd cataloguePageAdd = new CataloguePageAdd();
            mainWindow.f_MainFrame.Navigate(cataloguePageAdd);
        }

        private void btn_Edit_Click(object sender, RoutedEventArgs e)
        {
            MainWindow mainWindow = Application.Current.Windows.OfType<MainWindow>().FirstOrDefault();
            CataloguePageEdit cataloguePageEdit = new CataloguePageEdit(LvProduct.SelectedItem as DB.Product);
            mainWindow.f_MainFrame.Navigate(cataloguePageEdit);
        }

        private void btn_Delete_Click(object sender, RoutedEventArgs e)
        {
            Product product = LvProduct.SelectedItem as Product;
            var Result = MessageBox.Show("Вы уверены",
                "Удалить товар",
                MessageBoxButton.YesNo,
                MessageBoxImage.Question);
            if (Result == MessageBoxResult.Yes)
            {
                context.Product.Remove(product);
                context.SaveChanges();
                LvProduct.ItemsSource = context.Product.ToList();
                MessageBox.Show("Товар удалён");
            }
        }

        private void tb_Search_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (String.IsNullOrWhiteSpace(tb_Search.Text))
            {
                LvProduct.ItemsSource = context.Product.ToList();
            }
            else 
            {
                LvProduct.ItemsSource = context.Product.ToList().Where(i => i.Title.StartsWith(tb_Search.Text));
            }
        }
    }
}
