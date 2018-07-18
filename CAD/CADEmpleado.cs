using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using DTO;

namespace CAD
{
   public class CADEmpleado
    {
        private static string cadenadeconexion = ConfigurationManager.ConnectionStrings["Conexion"].ConnectionString;
        private static SqlConnection con = new SqlConnection(cadenadeconexion);
        private static SqlCommand cmd = new SqlCommand();
        private SqlDataAdapter sda = new SqlDataAdapter(cmd);
        public CADEmpleado()
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
        }

        //Metodo Login de Empleados
        public Empleado autenticarUsuario(Empleado empleado)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(cadenadeconexion))
                {
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandText = "loginEmpleado";
                    cmd.Parameters.AddWithValue("@usuario", empleado.usuario);
                    cmd.Parameters.AddWithValue("@contraseña", empleado.contraseña);
                    cmd.Parameters.AddWithValue("@idRol", empleado.rol);
                    //Datareader recupera los datos de una consulta en un lector
                    //lector es un objeto que permite recorrer cada fila de los datos obtenidos 
                    con.Open();
                    SqlDataReader dtr = cmd.ExecuteReader();
                    //si el lector tiene filas el usuario existe
                    if (dtr.HasRows)
                    {
                        //Recorrer cada fila de resultados
                        while (dtr.Read())
                        {
                            //guardar datos del usuario autenticado en un objeto usuario
                            empleado.nombres = dtr["nombres"].ToString();
                            empleado.rol = int.Parse(dtr["Idrol"].ToString());
                        }
                    }
                    else
                    {
                        empleado.nombres = null;
                        empleado.rol = 0;
                    }
                    con.Close();
                }
            }
            catch (Exception e)
            {
                empleado.nombres = null;
                empleado.rol = 0;
                Console.WriteLine(e);
            }
            return empleado;
        }
        //Mostrar Roles para Login
        public DataTable ListarRoles()
        {
            cmd.Parameters.Clear();
            DataTable dt = new DataTable();
            cmd.CommandText = "ListarRoles";
            con.Open();
            sda.Fill(dt);
            con.Close();
            return dt;
        }
        //Mostrar empleados
        public DataTable ListarEmpleados()
        {
            cmd.Parameters.Clear();
            DataTable dt = new DataTable();
            cmd.CommandText = "read_empleado";
            con.Open();
            sda.Fill(dt);
            con.Close();
            return dt;
        }
        //ActualizarEmpleado
        public int ActualizarEmpleado(Empleado empleado)
        {
            int filasafectadas = 0;
            cmd.CommandText = "update_empleado";
            cmd.Parameters.AddWithValue("@tipo_documento", empleado.tipo_documento);
            cmd.Parameters.AddWithValue("@num_documento", empleado.num_documento);
            cmd.Parameters.AddWithValue("@nombres", empleado.nombres);
            cmd.Parameters.AddWithValue("@apellidos", empleado.apellidos);
            cmd.Parameters.AddWithValue("@sexo", empleado.sexo);
            cmd.Parameters.AddWithValue("@edad", empleado.edad);
            cmd.Parameters.AddWithValue("@usuario", empleado.usuario);
            cmd.Parameters.AddWithValue("@contraseña", empleado.contraseña);
            cmd.Parameters.AddWithValue("@idRol", empleado.rol);
            cmd.Parameters.AddWithValue("@idEmpleado", empleado.id);
            con.Open();
            filasafectadas = cmd.ExecuteNonQuery();
            con.Close();
            return filasafectadas;
        }
        //EliminarEmpleados
        public int EliminarEmpleado(Empleado empleado)
        {
            int filasafectadas = 0;
            cmd.CommandText = "delete_empleado";
            cmd.Parameters.AddWithValue("@idEmpleado", empleado.id);
            con.Open();
            filasafectadas = cmd.ExecuteNonQuery();
            con.Close();
            return filasafectadas;
        }
        //Insertar empleado
        public int RegistrarEmpleado(Empleado empleado)
        {
            cmd.Parameters.Clear();
            int filasafectadas = 0;
            cmd.CommandText = "insert_empleado";
            cmd.Parameters.AddWithValue("@tipo_documento", empleado.tipo_documento);
            cmd.Parameters.AddWithValue("@num_documento", empleado.num_documento);
            cmd.Parameters.AddWithValue("@nombres", empleado.nombres);
            cmd.Parameters.AddWithValue("@apellidos", empleado.apellidos);
            cmd.Parameters.AddWithValue("@sexo", empleado.sexo);
            cmd.Parameters.AddWithValue("@edad", empleado.edad);
            cmd.Parameters.AddWithValue("@usuario", empleado.usuario);
            cmd.Parameters.AddWithValue("@contraseña", empleado.contraseña);
            cmd.Parameters.AddWithValue("@idRol", empleado.rol);
            con.Open();
            filasafectadas = cmd.ExecuteNonQuery();
            con.Close();
            return filasafectadas;
        }
    }
}
