using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

namespace Web_AppSuscripcion
{
    public class cls_RegistrarSuscripcion
    {
        private string str_mensaje;
        cls_Conexion objConexion = new cls_Conexion();
        public void fnt_Registrar(string id, string paquete)
        {
            if (id == "")
            {
                str_mensaje = "Debe ingresar su identificación";
            }
            else
            {
                try
                {
                    SqlCommand con = new SqlCommand("SP_RegistrarSuscripcion", objConexion.connection);
                    con.CommandType = CommandType.StoredProcedure;
                    con.Parameters.AddWithValue("@id_cliente", id);
                    con.Parameters.AddWithValue("@cod_paquete", paquete);
                    objConexion.connection.Open();
                    con.ExecuteNonQuery();
                    objConexion.connection.Close();
                    str_mensaje = "Suscripción registrada con éxito";
                }
                catch (Exception) { str_mensaje = "Este registro ya esta / Error al registrar"; }
            }
        }
        public string getMensaje() { return this.str_mensaje; }
    }
}