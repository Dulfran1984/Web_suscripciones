using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Web_AppSuscripcion
{
    public class cls_Conexion
    {
        public SqlConnection connection = new SqlConnection("Data Source=YOYITO\\SQLEXPRESS01;Initial Catalog=dbs_suscripcion;Integrated Security=True");
    }
}