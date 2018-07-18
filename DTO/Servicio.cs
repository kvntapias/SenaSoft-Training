using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class Servicio
    {
        public int idservicio { get; set; }
        public int idempleado { get; set; }
        public int idautomovil { get; set; }
        public int idtiposervicio { get; set; }
        public string tiposervicio { get; set; } //Reserva o Directo
        public int confirmado { get; set; }
        public string estado_pago { get; set; }
    }
}
