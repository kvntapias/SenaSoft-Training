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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {

                //Garantiza que los datos muestren al cargarse la página
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

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Empleado emp = new Empleado();
            string user = txtUsuario.Text;
            string pass = txtContraseña.Text;
            string rol = ddlRol.SelectedValue;
            emp.usuario = user;
            emp.contraseña = pass;
            emp.rol = Int32.Parse(rol);
            CADEmpleado op = new CADEmpleado();
            emp = op.autenticarUsuario(emp);
            if (emp.rol != 0)
            {
                //Variables de sesion
                Session["Usuario"] = emp.nombres;
                Session["Rol"] = emp.rol;
                Response.Redirect("Home.aspx");
            }
            else
            {
                lblResultado.Visible = true;
            }
        }
    }
}