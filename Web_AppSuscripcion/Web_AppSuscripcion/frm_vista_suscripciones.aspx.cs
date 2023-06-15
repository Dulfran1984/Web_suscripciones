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
            cls_ConsultarSuscripciones obj_Suscripciones = new cls_ConsultarSuscripciones();
            obj_Suscripciones.fnt_cargarsuscripciones(id);
            dtg_suscripciones.DataSource = obj_Suscripciones.getSuscripciones();
            dtg_suscripciones.DataBind();
        }
        protected void btn_Consultar_Click(object sender, EventArgs e)
        {
            fnt_ConsultarSuscripciones(txt_ID.Text);
        }
    }
}