using System;
using System.Data;
using System.Data.SqlClient;

namespace Web_AppSuscripcion
{
    public class cls_ConsultarSexo
    {
        private DataTable dt;
        cls_Conexion objconexion = new cls_Conexion();
        public void fnt_cargarSexo()
        {
            SqlDataAdapter da = new SqlDataAdapter("SP_CargarSexo", objconexion.connection);
            dt = new DataTable();
            objconexion.connection.Open();
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            //da.SelectCommand.Parameters.AddWithValue("@ot_cliente", txtot.Text);
            da.Fill(dt);
            objconexion.connection.Close();
        }
        public DataTable getSexo() { return this.dt; }
    }
}