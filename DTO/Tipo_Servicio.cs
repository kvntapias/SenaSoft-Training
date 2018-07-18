using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class Tipo_Servicio
    {
        public int idTipoServicio { get; set; }
        public string nombre_Servicio { get; set; }
        public float valor_Servicio { get; set; }
        public string tipo_Servicio { get; set; } //Mantenimiento o General
    }
}
