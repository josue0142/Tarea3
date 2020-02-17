using System;
using System.Collections.Generic;

namespace Tarea3.Models
{
    public partial class Career
    {
        public Career()
        {
            Student = new HashSet<Student>();
        }

        public int CareerId { get; set; }
        public string Name { get; set; }

        public virtual ICollection<Student> Student { get; set; }
    }
}
