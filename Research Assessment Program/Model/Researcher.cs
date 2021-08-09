using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Research_Assessment_Program.Model
{

    public class Researcher
    {

        public List<Publication> Publications { get; set; }
        public List<Position> position { get; set; }
        public Publication specifiedPublication { get; set; }
        public List<Cumulative> Cumulative { get; set; }

        public int ID { get; set; }
        public string Name { get { return String.Format("{0}, {1}", FamilyName, GivenName); } set { } }
        public string GivenName { get; set; }
        public string FamilyName { get; set; }
        public string Title { get; set; }
        public string Campus { get; set; }
        public string Unit { get; set; }
        public string Email { get; set; }
        public string Photo { get; set; }
        public EmploymentLevel Level { get; set; }
        public string LevelTitle
        {
            get
            {
                return Position.ToTitle(Level);
            }
        }

        public DateTime UtasStart { set; get; }
        public DateTime CurrentStart { get; set; }

        public float Tenure
        {
            get
            {
                float tenure;
                tenure = (float)(DateTime.Now.Date - UtasStart.Date).TotalDays / 365;
                tenure = (float)Math.Round(tenure, 1);
                return tenure;
            }
        }


        public int PublicationsCount
        {
            get { return Publications == null ? 0 : Publications.Count(); }
        }



    }
}
