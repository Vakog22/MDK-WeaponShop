using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MockUp914.DB.DBHelper
{
    public class DBHelper
    {
        public static DBEntities context { get; set; } = new DBEntities();
    }
}
