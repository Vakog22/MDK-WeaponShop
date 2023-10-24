using MockUp914.DB;
using MockUp914.DB.DBHelper;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Data.Entity.Migrations.Model;
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

namespace MockUp914.Pages.Clients
{
    /// <summary>
    /// Логика взаимодействия для ClientPage.xaml
    /// </summary>
    public partial class ClientPage : Page
    {
        public ClientPage()
        {
            InitializeComponent();
            UpdateData();
        }
        private void UpdateData()
        {
            List<Client> EmployeeList = new List<Client>();
            EmployeeList = context.Client.ToList();
            LvWorker.ItemsSource = EmployeeList;
        }

        private void tb_Search_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (String.IsNullOrWhiteSpace(tb_Search.Text))
            {
                LvWorker.ItemsSource = context.Worker.ToList();
            }
            else
            {
                LvWorker.ItemsSource = context.Client.ToList().Where(i => i.FirstName.StartsWith(tb_Search.Text) || i.SureName.StartsWith(tb_Search.Text));
            }
        }

        private void btn_Select_Click(object sender, RoutedEventArgs e)
        {
            DB.Check check = new DB.Check();
            check.IdWorker = 1;
            check.IdClient = (LvWorker.SelectedItem as Client).Id;
            check.Date = DateTime.Now;
            if (check != null)
            {
                context.Check.Add(check);
                context.SaveChanges();
            }


            foreach (var item in BasketHelper.Products)
            {
                DB.ProductCheck saleProduct = new DB.ProductCheck();
                saleProduct.IdProduct = item.Id;
                saleProduct.Quantity = item.Quantity;
                saleProduct.IdCheck = context.Check.ToList().LastOrDefault().Id;
                context.ProductCheck.Add(saleProduct);
                context.SaveChanges();
            }
            BasketHelper.Products = new ObservableCollection<DB.Product>();
            MessageBox.Show("Продукты успешно добавлены");
        }
    }
}
