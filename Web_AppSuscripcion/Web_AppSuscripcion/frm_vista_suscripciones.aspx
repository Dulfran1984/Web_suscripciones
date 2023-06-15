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
            <center><h1 class="h1">Mis suscripciones</h1>
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/imagenes/casa.png" PostBackUrl="~/frm_Suscripcion.aspx" />
                </center>
            <br />
            <center>
            <div class ="div2">
                <br />
                <asp:Label ID="lbl_Mensaje" runat="server" Text="" CssClass="label"></asp:Label>
                <br />
                <asp:TextBox ID="txt_ID" runat="server" Width="200px" CssClass="cajas" placeholder="Ingrese su identificación"></asp:TextBox>
                <asp:Button ID="btn_Consultar" runat="server" Text="Consultar" CssClass="bton_consultar" Width="152px" OnClick="btn_Consultar_Click" />
                <br />
                <asp:DropDownList ID="cbx_paquetes" runat="server" CssClass="combo">
                </asp:DropDownList>
                <br />
                <asp:Button ID="btn_registrarPaquete" runat="server" Text="Registrar suscripción" CssClass="botones" Height="34" Width="363" OnClick="btn_registrarPaquete_Click" />
                <br />
                <hr />
                <br />
                <asp:GridView ID="dtg_suscripciones" runat="server" Width="550px" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
                    <AlternatingRowStyle BackColor="White" />
                    <FooterStyle BackColor="#CCCC99" />
                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#F7F7DE" />
                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#FBFBF2" />
                    <SortedAscendingHeaderStyle BackColor="#848384" />
                    <SortedDescendingCellStyle BackColor="#EAEAD3" />
                    <SortedDescendingHeaderStyle BackColor="#575357" />
                </asp:GridView>
            </div>
            </center>
        </div>
    </form>
</body>
</html>