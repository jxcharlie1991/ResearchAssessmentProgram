using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Research_Assessment_Program.Model
{

    public enum EmploymentLevel { Student, A, B, C, D, E }



    public class Position
    {
        public EmploymentLevel Level { get; set; }
        public string LevelTitle
        {
            get
            {
                return ToTitle(Level);
            }
        }
        public string Start { get; set; }
        public string End { get; set; }
        public static string ToTitle(EmploymentLevel L)
        {
            if (L.ToString() == "student")
            {
                return string.Format("Student");
            }
            else if (L.ToString() == "A")
            {
                return string.Format("Postdoc");
            }
            else if (L.ToString() == "B")
            {
                return string.Format("Lecturer");
            }
            else if (L.ToString() == "C")
            {
                return string.Format("Senior Lecturer");
            }
            else if (L.ToString() == "D")
            {
                return string.Format("Associate Professor");
            }
            else if (L.ToString() == "E")
            {
                return string.Format("Professor");
            }
            else
            {
                return string.Format("Error");
            }
        }


    }
}
