using System;
using System.Collections.Generic;
using System.Linq;
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
    class CADAutomovil
    {
        private static string cadenadeconexion = ConfigurationManager.ConnectionStrings["Conexion"].ConnectionString;
        private static SqlConnection con = new SqlConnection(cadenadeconexion);
        private static SqlCommand cmd = new SqlCommand();
        private SqlDataAdapter sda = new SqlDataAdapter(cmd);
        public CADAutomovil()
        {
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
        }
        //Insertar auto
        public int RegistrarAuto(Automovil auto)
        {
            cmd.Parameters.Clear();
            int filasafectadas = 0;
            cmd.CommandText = "insert_automovil";
            cmd.Parameters.AddWithValue("@placa", auto.placa);
            cmd.Parameters.AddWithValue("@marca", auto.marca);
            cmd.Parameters.AddWithValue("@modelo", auto.modelo);
            cmd.Parameters.AddWithValue("@color", auto.color);
            cmd.Parameters.AddWithValue("@idCliente", auto.cliente);
            con.Open();
            filasafectadas = cmd.ExecuteNonQuery();
            con.Close();
            return filasafectadas;
        }
        public int ActualizarAuto(Automovil auto)
        {
            cmd.Parameters.Clear();
            int filasafectadas = 0;
            cmd.CommandText = "update_automovil";
            cmd.Parameters.AddWithValue("@idAutomovil", auto.idAutomovil);
            cmd.Parameters.AddWithValue("@placa", auto.placa);
            cmd.Parameters.AddWithValue("@marca", auto.marca);
            cmd.Parameters.AddWithValue("@modelo", auto.modelo);
            cmd.Parameters.AddWithValue("@color", auto.color);
            cmd.Parameters.AddWithValue("@idCliente", auto.cliente);
            con.Open();
            filasafectadas = cmd.ExecuteNonQuery();
            con.Close();
            return filasafectadas;
        }

        public int EliminarAuto(Automovil auto)
        {
            cmd.Parameters.Clear();
            int filasafectadas = 0;
            cmd.CommandText = "delete_automovil";
            cmd.Parameters.AddWithValue("@idAutomovil", auto.idAutomovil);
            con.Open();
            filasafectadas = cmd.ExecuteNonQuery();
            con.Close();
            return filasafectadas;
        }

        public DataTable ListarAutos()
        {
            cmd.Parameters.Clear();
            DataTable dt = new DataTable();
            cmd.CommandText = "read_automovil";
            con.Open();
            sda.Fill(dt);
            con.Close();
            return dt;
        }

    }
}
