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
        }

        private void btn_AddProduct_Click(object sender, RoutedEventArgs e)
        {
            MainWindow mainWindow = Application.Current.Windows.OfType<MainWindow>().FirstOrDefault();
            CataloguePageAdd cataloguePageAdd = new CataloguePageAdd();
            mainWindow.f_MainFrame.Navigate(cataloguePageAdd);
        }
    }
}
