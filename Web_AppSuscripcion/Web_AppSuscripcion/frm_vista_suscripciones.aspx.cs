using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web_AppSuscripcion
{
    public partial class frm_vista_suscripciones : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack == true) { fnt_Cargarpaquete(); }
        }
        private void fnt_Cargarpaquete()
        {
            cls_CargarPaquetes objPaquetes = new cls_CargarPaquetes();
            objPaquetes.fnt_cargarpaquetes();
            cbx_paquetes.DataSource = objPaquetes.getPaquete();
            cbx_paquetes.DataValueField = "PKCodigo";
            cbx_paquetes.DataTextField = "Descripcion";
            cbx_paquetes.DataBind();
        }
        private void fnt_ConsultarSuscripciones(string id)
        {
            cls_ConsultarSuscrip obj_Suscripciones = new cls_ConsultarSuscrip();
            obj_Suscripciones.fnt_cargarsuscripciones(id);
            dtg_suscripciones.DataSource = obj_Suscripciones.getSuscripciones();
            dtg_suscripciones.DataBind();
            lbl_Mensaje.Text = obj_Suscripciones.getMensaje();
        }
        protected void btn_Consultar_Click(object sender, EventArgs e)
        {
            fnt_ConsultarSuscripciones(txt_ID.Text);
        }

        protected void btn_registrarPaquete_Click(object sender, EventArgs e)
        {
            cls_RegistrarSuscripcion obj_RegistrarSus = new cls_RegistrarSuscripcion();
            obj_RegistrarSus.fnt_Registrar(txt_ID.Text, Convert.ToString(cbx_paquetes.SelectedValue));
            lbl_Mensaje.Text = obj_RegistrarSus.getMensaje();
            fnt_ConsultarSuscripciones(txt_ID.Text);
        }
    }
}