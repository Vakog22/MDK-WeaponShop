using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MockUp914.DB.DBHelper
{
    public class BasketHelper
    {
        public static ObservableCollection<DB.Product> Products { get; set; } = new ObservableCollection<DB.Product>();
    }
        
}
