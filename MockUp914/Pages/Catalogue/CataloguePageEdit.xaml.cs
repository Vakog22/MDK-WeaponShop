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
using System.IO;
using Microsoft.Win32;
using MockUp914.DB;

namespace MockUp914.Pages.Catalogue
{
    /// <summary>
    /// Логика взаимодействия для CataloguePageEdit.xaml
    /// </summary>
    public partial class CataloguePageEdit : Page
    {
        private string pathPhoto = null;
        private Product product1 = null;
        public CataloguePageEdit(Product product)
        {
            InitializeComponent();
            cb_type.ItemsSource = context.Type.ToList();
            cb_type.SelectedIndex = 0;
            cb_type.DisplayMemberPath = "Title";
            cb_license.ItemsSource = context.LicenseType.ToList();
            cb_license.SelectedIndex = 0;
            cb_license.DisplayMemberPath = "Title";
            tb_title.Text = product.Title;
            tb_Cost.Text = product.Cost.ToString();
            cb_type.SelectedItem = product.Type;
            cb_license.SelectedItem = product.LicenseType;
            product1 = product;
            if (product.Photo != null)
            {
                MemoryStream stream = new MemoryStream(product.Photo);
                i_Preview.Source = BitmapFrame.Create(stream, BitmapCreateOptions.None, BitmapCacheOption.None);
            }
        }

        private void btn_Save_Click(object sender, RoutedEventArgs e)
        {
            product1.Title = tb_title.Text;
            product1.Cost = Convert.ToDecimal(tb_Cost.Text);
            product1.IdType = (cb_type.SelectedItem as DB.Type).Id;
            product1.IdLicenseType = (cb_license.SelectedItem as DB.LicenseType).Id;
            if (pathPhoto != null)
            {
                product1.Photo = File.ReadAllBytes(pathPhoto);
            }
            context.SaveChanges();
            MainWindow mainWindow = Application.Current.Windows.OfType<MainWindow>().FirstOrDefault();
            CataloguePage cataloguePage = new CataloguePage();
            mainWindow.f_MainFrame.Navigate(cataloguePage);
        }

        private void btn_Cancel_Click(object sender, RoutedEventArgs e)
        {
            MainWindow mainWindow = Application.Current.Windows.OfType<MainWindow>().FirstOrDefault();
            CataloguePage cataloguePage = new CataloguePage();
            mainWindow.f_MainFrame.Navigate(cataloguePage);
        }

        private void btn_addPhoto_Click(object sender, RoutedEventArgs e)
        {
            OpenFileDialog openFileDialog = new OpenFileDialog();
            var fileContent = string.Empty;
            openFileDialog.InitialDirectory = "C:\\";
            openFileDialog.Filter = "Image Files|*.jpg;*.jpeg;*.png";

            openFileDialog.RestoreDirectory = true;
            if (openFileDialog.ShowDialog() == true)
            {
                i_Preview.Source = new BitmapImage(new Uri(openFileDialog.FileName));
                pathPhoto = openFileDialog.FileName;
            }
        }
    }
}
