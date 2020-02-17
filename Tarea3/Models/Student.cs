using System;
using System.Collections.Generic;

namespace Tarea3.Models
{
    public partial class Student
    {
        public int StudentId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Status { get; set; }
        public int CareerFk { get; set; }

        public virtual Career CareerFkNavigation { get; set; }
    }
}
