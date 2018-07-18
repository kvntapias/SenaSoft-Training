using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RODAMIENTOS_PULIDOS.VISTAS
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usuario"] == null || Session["Rol"] == null)
            {
                adminclientes.Visible = adminempleados.Visible = adminservicios.Visible = false;
                btnUsuario.Visible = btnLogout.Visible = false;
                msg.Visible = true;
            }
            else
            {
                string nombre = Session["Usuario"].ToString();
                int rol = int.Parse(Session["Rol"].ToString());
                btnUsuario.Text = nombre;
                btnLogout.Visible = true;
                switch (rol)
                {
                    case 1:
                        adminempleados.Visible = true;
                        break;
                    case 2:
                        adminempleados.Visible = true;
                        break;
                    case 3:
                        adminclientes.Visible = true;
                        adminautomoviles.Visible = true;
                        break;
    
                    default:
                        break;
                }
            }
        }

        protected void salir(object sender, EventArgs e)
        {
            Session["Usuario"] = null;
            Session["Rol"] = null;
            Response.Redirect("Login.aspx");
        }

    }
}