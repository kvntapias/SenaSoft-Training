using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class Empleado
    {
        public int id { get; set; }
        public string tipo_documento { get; set; }
        public string num_documento { get; set; }
        public string nombres { get; set; }
        public string apellidos { get; set; }
        public string sexo { get; set; }
        public string edad { get; set; }
        public string usuario { get; set; }
        public string contraseña { get; set; }
        public int rol { get; set; }
    }
}
