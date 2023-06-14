<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frm_Suscripcion.aspx.cs" Inherits="Web_AppSuscripcion.frm_Suscripcion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Módulo de suscripción</title>
    <link rel="stylesheet" href="estilos.css" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <center><h1 class="h1">Registro de suscripciones</h1></center>
            
            <center>
            <div class="div2">
                <br />
                <asp:TextBox ID="txt_Id" runat="server" placeholder="Identificación" CssClass="cajas" Width="300px"></asp:TextBox>
                <br />
                <asp:TextBox ID="txt_Nombres" runat="server" placeholder="Nombres" CssClass="cajas" Width="300px"></asp:TextBox>
                <br />
                <asp:TextBox ID="txt_Apellidos" runat="server" placeholder="Apellidos" CssClass="cajas" Width="300px"></asp:TextBox>
                <br />
                <asp:TextBox ID="txt_Contacto" runat="server" placeholder="Contacto" CssClass="cajas" Width="300px"></asp:TextBox>
                <br />
                <asp:TextBox ID="txt_Correo" runat="server" placeholder="Correo" CssClass="cajas" Width="300px"></asp:TextBox>
                <br />
                <asp:TextBox ID="txt_Direccion" runat="server" placeholder="Dirección" CssClass="cajas" Width="300px"></asp:TextBox>
                <br />
                <asp:DropDownList ID="cbx_Sexo" runat="server" CssClass="combo" Width="310px"></asp:DropDownList>
                <br />
                <asp:Button ID="btn_Registrar" runat="server" Text="Registrar" CssClass="botones" Width="310px" Height="35" OnClick="btn_Registrar_Click" />
                <br />
                <asp:Label ID="lbl_mensaje" runat="server" Text="" CssClass="label"></asp:Label>
                <br />
                <asp:Button ID="btn_suscripciones" runat="server" Text="Mis Suscripciones" CssClass="botones_sus" Width="309px" PostBackUrl="~/frm_vista_suscripciones.aspx"/>
            </div>
            </center>
        </div>
    </form>
</body>
</html>