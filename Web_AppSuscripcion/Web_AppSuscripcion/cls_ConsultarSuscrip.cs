using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

namespace Web_AppSuscripcion
{
    public class cls_ConsultarSuscrip
    {
        private DataTable dt;
        private string str_mensaje;
        cls_Conexion objconexion = new cls_Conexion();
        public void fnt_cargarsuscripciones(string id)
        {
            if (id == "")
            {
                str_mensaje = "Debe ingresar el criterio de busqueda";
            }
            else
            {
                SqlDataAdapter da = new SqlDataAdapter("SP_CargarSuscripciones", objconexion.connection);
                dt = new DataTable();
                objconexion.connection.Open();
                da.SelectCommand.CommandType = CommandType.StoredProcedure;
                da.SelectCommand.Parameters.AddWithValue("@id", id);
                da.Fill(dt);
                objconexion.connection.Close();
                if(dt.Rows.Count > 0)
                {
                    str_mensaje = "";
                }
                else { str_mensaje = "No se encontraron datos"; } 
            }
        }
        public DataTable getSuscripciones() { return this.dt; }
        public string getMensaje() { return  this.str_mensaje; }
    }
}