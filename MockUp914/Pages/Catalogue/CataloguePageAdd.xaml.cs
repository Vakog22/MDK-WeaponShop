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
    /// Логика взаимодействия для CataloguePageAdd.xaml
    /// </summary>
    public partial class CataloguePageAdd : Page
    {
        public CataloguePageAdd()
        {
            InitializeComponent();
        }

        private void btn_Cancel_Click(object sender, RoutedEventArgs e)
        {
            MainWindow mainWindow = Application.Current.Windows.OfType<MainWindow>().FirstOrDefault();
            CataloguePage cataloguePage = new CataloguePage();
            mainWindow.f_MainFrame.Navigate(cataloguePage);
        }
    }
}
