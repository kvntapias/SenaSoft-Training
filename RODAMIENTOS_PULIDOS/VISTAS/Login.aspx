<%@ Page Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="RODAMIENTOS_PULIDOS.VISTAS.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="server">
    <div class="container">
        <div class="row">
            <div class="col">
                <form id="frm" class="form-login" runat="server">
                    <h2>Iniciar sesion</h2>
                    <div class="form-group" title="Correo Electronico">
                        <asp:TextBox ID="txtUsuario" runat="server" CssClass="form-control" placeholder="Ingrese su Usuario"></asp:TextBox>
                    </div>
                    <div class="form-group" title="Contraseña">
                        <asp:TextBox ID="txtContraseña" TextMode="Password" runat="server" CssClass="form-control" placeholder="Ingrese su Contraseña"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblTipo" runat="server" Text="Rol" for="ddlRol"></asp:Label>
                        <div class="dropdown">
                            <asp:DropDownList ID="ddlRol" runat="server" CssClass="form-control">
                            </asp:DropDownList>
                        </div>
                        <asp:Label CssClass="alert-danger" ID="lblValidarTipo" runat="server" Text="Seleccione el Tipo de Producto" Visible="false"></asp:Label>
                    </div>
                    <div class="clearfix"></div>
                    <asp:Button ID="btnLogin" runat="server" Text="Acceder" CssClass="btn btn-outline-primary btn-block" OnClick="btnLogin_Click"/>
                    
                    <asp:Label ID="lblResultado" runat="server" Text="Correo y/o contraseña Incorrecto" ForeColor="Red"
                        Visible="false"></asp:Label>
                    <hr />
                    <%--<h7>¿Olvido su contraseña?</h7>
                        <p>Reestablecer <a href="#">Aqui</a></p>--%>
                    <div class="clearfix"></div>
                </form>
            </div>
        </div>
    </div>
</asp:Content>