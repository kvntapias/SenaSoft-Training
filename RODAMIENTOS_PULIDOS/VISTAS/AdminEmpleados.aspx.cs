using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CAD;
using DTO;

namespace RODAMIENTOS_PULIDOS.VISTAS
{
    public partial class AdminEmpleados : System.Web.UI.Page
    {
        static int ide;
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (!this.IsPostBack)
            {
                this.LoadEmpleados();
                this.LoadRoles();
                ddlRol.Items.Insert(0, new ListItem("Seleccione", ""));
            }
        }

        protected void LoadRoles()
        {
            DataTable dt = new DataTable();
            CADEmpleado op = new CADEmpleado();
            dt = op.ListarRoles();
            ddlRol.DataSource = dt;
            ddlRol.DataBind();
            ddlRol.DataTextField = "nombre_rol";
            ddlRol.DataValueField = "Idrol";
            ddlRol.DataBind();

        }

        protected void click_Registrar(object sender, EventArgs e) {
            string tipoDoc = ddlTipoDoc.SelectedValue;
            string numdoc = txtDoc.Text;
            string nombres = txtNombres.Text;
            string apellidos = txtApe.Text;
            string sexo = ddlSexo.SelectedValue;
            string edad = txtEdad.Text;
            string usuario = txtUsuario.Text;
            string contra = txtContraseña.Text;
            string rol = ddlRol.SelectedValue;
            CADEmpleado op = new CADEmpleado();
            Empleado emp = new Empleado();
            emp.tipo_documento = tipoDoc;
            emp.num_documento = numdoc;
            emp.nombres = nombres;
            emp.sexo = sexo;
            emp.apellidos = apellidos;
            emp.usuario = usuario;
            emp.contraseña = contra;
            emp.edad = edad;
            emp.rol = Int32.Parse(rol);
            int resultado = op.RegistrarEmpleado(emp);
            lblResultado.Text = (resultado > 0) ? "Empleado registrado" : "Empleado no registrado";
        }

        protected void grvEmpleados_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //Evento botón editar de la fila del Gridview seleccionada
            if (e.CommandName == "Editar")
            {
                int fila = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = grvEmpleados.Rows[fila];
                ide = Convert.ToInt32(grvEmpleados.DataKeys[fila]["ide"]);
                lblResultado.Text = "ID empleado seleccionado: " + ide;
                ddlTipoDoc.Text = ((Label)row.FindControl("lbltipodoc")).Text;
                txtDoc.Text = ((Label)row.FindControl("labelDoc")).Text;
                txtNombres.Text =  ((Label)row.FindControl("labelNombres")).Text;
                txtApe.Text = ((Label)row.FindControl("labelApellidos")).Text;
                btnRegistrar.Visible = false;
                btnModificar.Visible = true;
            }
            if (e.CommandName == "Eliminar")
            {
                //Eliminar empleado
                int id = Convert.ToInt32(e.CommandArgument);
                Empleado delete = new Empleado();
                delete.id = id;
                CADEmpleado op = new CADEmpleado();
                int resultado = op.EliminarEmpleado(delete);
                lblResultado.Text = (resultado > 0) ? "Empleado Eliminado" : "Empleado no Eliminado";
                this.LoadEmpleados();
            }
        }

        protected void LoadEmpleados()
        {
            CADEmpleado data = new CADEmpleado();
            DataTable dt = data.ListarEmpleados();
            grvEmpleados.DataSource = dt;
            grvEmpleados.DataBind();

        }
    }
}