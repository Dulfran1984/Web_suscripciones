using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web_AppSuscripcion
{
    public partial class frm_Suscripcion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack == true) { fnt_CargarSexo(); }
        }
        private void fnt_CargarSexo()
        {
            cls_ConsultarSexo objSexo = new cls_ConsultarSexo();
            objSexo.fnt_cargarSexo();
            cbx_Sexo.DataSource = objSexo.getSexo();
            cbx_Sexo.DataValueField = "PKCodigo";
            cbx_Sexo.DataTextField = "Nombre";
            cbx_Sexo.DataBind();
        }
        protected void btn_Registrar_Click(object sender, EventArgs e)
        {
            cls_Registrar obj_registrar = new cls_Registrar();
            obj_registrar.fnt_Crear(txt_Id.Text, txt_Nombres.Text, txt_Apellidos.Text, txt_Contacto.Text,
                txt_Direccion.Text, txt_Correo.Text, cbx_Sexo.SelectedIndex + 1);
            lbl_mensaje.Text = obj_registrar.getMensaje();
        }
    }
}