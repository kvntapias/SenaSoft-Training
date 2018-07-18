<%@ Page Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="AdminEmpleados.aspx.cs" Inherits="RODAMIENTOS_PULIDOS.VISTAS.AdminEmpleados" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="RenderBody" runat="server">
    <form id="form1" runat="server">
        <div class="container">
            <h4>Gestión de Empleados</h4>
            <div class="form-row" id="formulario">
                <div class="form-group col-md-6">
                    <asp:Label  runat="server" Text="Tipo de Documento" for="ddlTipoDoc"></asp:Label>
                    <asp:DropDownList ID="ddlTipoDoc" runat="server" CssClass="form-control">
                        <asp:ListItem Enabled="true" Text="Seleccione" Value="-1"></asp:ListItem>
                        <asp:ListItem Text="CC" Value="CC"></asp:ListItem>
                        <asp:ListItem Text="RUT" Value="RUT"></asp:ListItem>
                        <asp:ListItem Text="NIT" Value="NIT"></asp:ListItem>
                        <asp:ListItem Text="Pasaporte" Value="Pasaporte"></asp:ListItem>
                        <asp:ListItem Text="CE" Value="CE"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:Label CssClass="alert-danger" ID="valTipo" runat="server" Visible="false"></asp:Label>
                </div>
                <div class="form-group col-md-6">
                    <asp:Label ID="labelDoc" runat="server" Text="Numero de Documento" for="txtDoc"></asp:Label>
                    <asp:TextBox CssClass="form-control" ID="txtDoc" runat="server" placeholder="Nombres de empleado"></asp:TextBox>
                    <asp:Label CssClass="alert-danger" ID="valNumero" runat="server" Text="Numero requerido" Visible="false"></asp:Label>
                </div>
                <div class="form-group col-md-6">
                    <asp:Label ID="labelNombres" runat="server" Text="Nombres" for="txtNombres"></asp:Label>
                    <asp:TextBox CssClass="form-control" ID="txtNombres" runat="server" placeholder="Nombres de empleado"></asp:TextBox>
                    <asp:Label CssClass="alert-danger" ID="valNombre" runat="server" Text="Nombre requerido" Visible="false"></asp:Label>
                </div>
                <div class="form-group col-md-6">
                    <asp:Label ID="labelApellidos" runat="server" Text="Apellidos del Empleado" for="txtApe"></asp:Label>
                    <asp:TextBox CssClass="form-control" ID="txtApe" runat="server" placeholder="Apellidos de empleado"></asp:TextBox>
                    <asp:Label CssClass="alert-danger" ID="valApellido" runat="server" Text="Nombre requerido" Visible="false"></asp:Label>
                </div>
                <div class="form-group col-md-6">
                    <asp:Label ID="labelsexo" runat="server" Text="Sexo" for="ddlSexo"></asp:Label>
                    <asp:DropDownList ID="ddlSexo" runat="server" CssClass="form-control">
                        <asp:ListItem Enabled="true" Text="Seleccione" Value="-1"></asp:ListItem>
                        <asp:ListItem Text="Masculino" Value="M"></asp:ListItem>
                        <asp:ListItem Text="Femenino" Value="F"></asp:ListItem>
                        <asp:ListItem Text="Otro" Value="Otro"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:Label CssClass="alert-danger" ID="valSexo" runat="server" Text="Sexo requerido" Visible="false"></asp:Label>
                </div>
                <div class="form-group col-md-6">
                    <asp:Label ID="labelEdad" runat="server" Text="Edad" for="txtEdad"></asp:Label>
                    <asp:TextBox CssClass="form-control" ID="txtEdad" runat="server" placeholder="Usuario"></asp:TextBox>
                    <asp:Label CssClass="alert-danger" ID="Label6" runat="server" Text="Usuario requerido" Visible="false"></asp:Label>
                </div>
                <div class="form-group col-md-6">
                    <asp:Label ID="labelUsuario" runat="server" Text="Usuario" for="txtUsuario"></asp:Label>
                    <asp:TextBox CssClass="form-control" ID="txtUsuario" runat="server" placeholder="Usuario"></asp:TextBox>
                    <asp:Label CssClass="alert-danger" ID="valUsuario" runat="server" Text="Usuario requerido" Visible="false"></asp:Label>
                </div>
                <div class="form-group col-md-6">
                    <asp:Label ID="labelContraseña" runat="server" Text="Contraseña" for="txtContraseña"></asp:Label>
                    <asp:TextBox CssClass="form-control" ID="txtContraseña" runat="server" placeholder="Contraseña"></asp:TextBox>
                    <asp:Label CssClass="alert-danger" ID="valContraseña" runat="server" Text="Contraseña requerida" Visible="false"></asp:Label>
                </div>
                <div class="form-group col-md-6">
                    <asp:Label ID="labelRol" runat="server" Text="Cargo" for="ddlRol"></asp:Label>
                    <div class="dropdown">
                    <asp:DropDownList ID="ddlRol" runat="server" CssClass="form-control">
                    </asp:DropDownList>
                </div>
                </div>
                

                <p>
                    <asp:Button CssClass="btn btn-primary" ID="btnRegistrar" runat="server" Text="Registrar" OnClick="click_Registrar"/>
                    <asp:Button CssClass="btn btn-primary" ID="btnModificar" runat="server" Text="Modificar" Visible="false" />
                    <asp:Button CssClass="btn btn-danger" ID="btnCancelar" runat="server" Text="Cancelar" />
                </p>

                <p>
                    <asp:Label CssClass="alert-success" ID="lblResultado" runat="server"></asp:Label>
                </p>
            </div>
            <br />
            <h2>Listado de Empleados</h2>
             <asp:GridView ID="grvEmpleados" runat="server"
                CssClass="table table-striped table-bordered"
                AutoGenerateColumns="false"
                EmptyDataText="No se encontraron Empleados"
                DataKeyNames="idEmpleado"
                OnRowCommand="grvEmpleados_RowCommand">
                <Columns>
                    <asp:TemplateField HeaderText="Nombres" ItemStyle-Width="30%">
                        <ItemTemplate>
                            <asp:Label ID="lblTipoDocumento" runat="server"
                                Text='<%# Eval("nombres") %>'>
                            </asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Apellidos" ItemStyle-Width="30%">
                        <ItemTemplate>
                            <asp:Label ID="lblApellidos" runat="server"
                                Text='<%# Eval("apellidos") %>'>
                            </asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Documento" ItemStyle-Width="30%">
                        <ItemTemplate>
                            <asp:Label ID="lblnumDocumento" runat="server"
                                Text='<%# Eval("num_documento") %>'>
                            </asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Acciones">
                        <ItemTemplate>
                            <asp:Button ID="btnEditar" runat="server" CssClass="btn btn-info" Text="Editar"
                                CommandName="Editar" CommandArgument='<%# ((GridViewRow) Container).RowIndex %>' />
                            <asp:Button ID="btnEliminar" runat="server" CssClass="btn btn-danger" Text="Eliminar"
                                CommandName="Eliminar" CommandArgument='<%# Eval("idEmpleado") %>' OnClientClick="confirm('Está seguro que desea eliminar?')" />
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>
        </div>
    </form>

</asp:Content>
