<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frm_vista_suscripciones.aspx.cs" Inherits="Web_AppSuscripcion.frm_vista_suscripciones" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Mis suscripciones</title>
    <link rel="stylesheet" href="estilos.css" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <center><h1>Mis suscripciones</h1></center>
            <center>
            <div class ="div2">
                <br /><br />
                <asp:TextBox ID="txt_ID" runat="server" Width="200px" CssClass="cajas" placeholder="Ingrese su identificación"></asp:TextBox>
                <asp:Button ID="btn_Consultar" runat="server" Text="Consultar" CssClass="botones" Height="41" Width="136"/>
                <br />
                <asp:DropDownList ID="cbx_paquetes" runat="server" CssClass="combo" Width="354px"></asp:DropDownList>
                <br />
                <asp:Button ID="btn_registrarPaquete" runat="server" Text="Registrar suscripción" CssClass="botones" Height="35" Width="352" />
                <br />
                <hr />
                <br />
                <asp:GridView ID="dtg_suscripciones" runat="server" Width="350"></asp:GridView>
            </div>
            </center>
        </div>
    </form>
</body>
</html>
