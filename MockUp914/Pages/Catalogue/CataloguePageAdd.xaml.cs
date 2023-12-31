﻿using Microsoft.Win32;
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
using System.IO;

namespace MockUp914.Pages.Catalogue
{
    /// <summary>
    /// Логика взаимодействия для CataloguePageAdd.xaml
    /// </summary>
    public partial class CataloguePageAdd : Page
    {
        private string pathPhoto = null;
        public CataloguePageAdd()
        {
            InitializeComponent();
            cb_type.ItemsSource = context.Type.ToList();
            cb_type.SelectedIndex = 0;
            cb_type.DisplayMemberPath = "Title";
            cb_license.ItemsSource = context.LicenseType.ToList();
            cb_license.SelectedIndex = 0;
            cb_license.DisplayMemberPath = "Title";
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

        private void btn_Add_Click(object sender, RoutedEventArgs e)
        {
            DB.Product product = new DB.Product();
            product.Title = tb_title.Text;
            product.Cost = Convert.ToDecimal(tb_Cost.Text);
            product.IdType = (cb_type.SelectedItem as DB.Type).Id;
            product.IdLicenseType = (cb_license.SelectedItem as DB.LicenseType).Id;
            if (pathPhoto != null)
            {
                product.Photo = File.ReadAllBytes(pathPhoto);
            }
            context.Product.Add(product);
            context.SaveChanges();
            MainWindow mainWindow = Application.Current.Windows.OfType<MainWindow>().FirstOrDefault();
            CataloguePage cataloguePage = new CataloguePage();
            mainWindow.f_MainFrame.Navigate(cataloguePage);
        }
    }
}
