//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MockUp914.DB
{
    using System;
    using System.Collections.Generic;
    
    public partial class ClientLicense
    {
        public int IdClient { get; set; }
        public int IdType { get; set; }
        public string LicenseNum { get; set; }
        public System.DateTime LicenseDate { get; set; }
    
        public virtual Client Client { get; set; }
        public virtual LicenseType LicenseType { get; set; }
    }
}
