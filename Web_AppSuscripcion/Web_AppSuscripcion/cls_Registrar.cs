using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

namespace Web_AppSuscripcion
{
    public class cls_Registrar
    {
        private string str_mensaje;
        cls_Conexion objConexion = new cls_Conexion();
        public void fnt_Crear(string id,string n, string ap, string cont, string dir, string corr, int sex)
        {
            if(id == "" || n == "" || ap == "" || cont == "" || dir == "" || corr == "")
            {
                str_mensaje = "Debe ingresar todos los datos";
            }
            else
            {
                try
                {
                    SqlCommand con = new SqlCommand("SP_RegistrarCliente", objConexion.connection);
                    con.CommandType = CommandType.StoredProcedure;
                    con.Parameters.AddWithValue("@id", id);
                    con.Parameters.AddWithValue("@nombres", n);
                    con.Parameters.AddWithValue("@apellidos", ap);
                    con.Parameters.AddWithValue("@contacto", cont);
                    con.Parameters.AddWithValue("@direccion", dir);
                    con.Parameters.AddWithValue("@correo", corr);
                    con.Parameters.AddWithValue("@sexo", sex);
                    objConexion.connection.Open();
                    con.ExecuteNonQuery();
                    objConexion.connection.Close();
                    str_mensaje = "La persona " + n + " " + ap + " ha sido registrada con éxito";
                }
                catch (Exception) { str_mensaje = "Este registro ya esta / Error al registrar"; }
            }
        }
        public string getMensaje() { return this.str_mensaje; }
    }
}