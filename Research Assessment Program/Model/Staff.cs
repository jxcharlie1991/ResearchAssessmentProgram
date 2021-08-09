using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Research_Assessment_Program.Model
{
    public class Staff : Researcher
    {

        public List<Student> Supervises { get; set; }

        public int SupervisesCount
        {
            get
            {
                return Supervises.Count();
            }
        }

        public float ThreeYearAverage
        {
            get
            {
                int count = 0;
                foreach (Publication p in Publications)
                {
                    if (DateTime.Now.Year - p.Year < 3)
                    {
                        count++;
                    }
                }
                return (float)Math.Round((double)(count / 3), 1);
            }
        }

        public string Performance
        {
            get
            {
                int count = 0;
                float expected = 0;
                foreach (Publication p in Publications)
                {
                    if (DateTime.Now.Year - p.Year < 3)
                    {
                        count++;
                    }
                }
                switch (Level)
                {
                    case EmploymentLevel.A:
                        expected = 0.5F;
                        break;
                    case EmploymentLevel.B:
                        expected = 1F;
                        break;
                    case EmploymentLevel.C:
                        expected = 2F;
                        break;
                    case EmploymentLevel.D:
                        expected = 3.2F;
                        break;
                    case EmploymentLevel.E:
                        expected = 4F;
                        break;

                }
                return String.Format("{0}%", Math.Round((count / 3 / expected * 100), 1));
            }
        }



    }
}
