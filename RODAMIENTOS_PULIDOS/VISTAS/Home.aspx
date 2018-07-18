<%@ Page Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="RODAMIENTOS_PULIDOS.VISTAS.Home" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="server">
    <body>
        <form id="form" runat="server">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
                    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                        <li class="nav-item active">
                            <a class="nav-link" href="Home.aspx">Inicio <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item" id="adminempleados" runat="server" visible="false">
                            <a class="nav-link" href="AdminEmpleados.aspx">Administrar Empleados</a>
                        </li>
                        <li class="nav-item" id="adminclientes" runat="server" visible="false">
                            <a class="nav-link" href="#">Administrar Clientes</a>
                        </li>
                        <li class="nav-item" id="adminautomoviles" runat="server" visible="false">
                            <a class="nav-link" href="#">Administrar Automoviles</a>
                        </li>
                        <li class="nav-item" id="adminservicios" runat="server" visible="false">
                            <a class="nav-link" href="#">Administrar Servicios</a>
                        </li>
                    </ul>
                    <asp:Button ID="btnUsuario" runat="server" Text="Default" CssClass="btn btn-outline-success my-2 my-sm-0" />
                    <asp:Button ID="btnLogout" runat="server" Text="Salir"  CssClass="btn btn-danger my-3 my-sm-0" Visible="false" OnClick="salir" />

                </div>
            </nav>
            <div class="jumbotron jumbotron-fluid" id="msg" runat="server" visible="false">
                <div class="container">
                    <h1 class="display-4">Error</h1>
                    <p class="lead">Sesion Caducada</p>
                </div>
            </div>

        </form>
    </body>

</asp:Content>


