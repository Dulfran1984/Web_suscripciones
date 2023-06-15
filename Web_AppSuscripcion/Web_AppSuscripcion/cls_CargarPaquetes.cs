using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

namespace Web_AppSuscripcion
{
    public class cls_CargarPaquetes
    {
        private DataTable dt;
        cls_Conexion objconexion = new cls_Conexion();
        public void fnt_cargarpaquetes()
        {
            SqlDataAdapter da = new SqlDataAdapter("SP_CargarPaquetes", objconexion.connection);
            dt = new DataTable();
            objconexion.connection.Open();
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            //da.SelectCommand.Parameters.AddWithValue("@ot_cliente", txtot.Text);
            da.Fill(dt);
            objconexion.connection.Close();
        }
        public DataTable getPaquete() { return this.dt; }
    }
}