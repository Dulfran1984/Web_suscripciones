using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

namespace Web_AppSuscripcion
{
    public class cls_ConsultarSuscripciones
    {
        private DataTable dt;
        cls_Conexion objconexion = new cls_Conexion();
        public void fnt_cargarsuscripciones(string id)
        {
            SqlDataAdapter da = new SqlDataAdapter("SP_CargarSuscripciones", objconexion.connection);
            dt = new DataTable();
            objconexion.connection.Open();
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            da.SelectCommand.Parameters.AddWithValue("@id", id);
            da.Fill(dt);
            objconexion.connection.Close();
        }
        public DataTable getSuscripciones() { return this.dt; }
    }
}