using Research_Assessment_Program.Controller;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Research_Assessment_Program.Model
{
    public class Student : Researcher
    {

        public int SupervisorID { get; set; }
        public string Supervisor
        {
            get
            {
                string name = "";
                foreach (Researcher r in ResearcherController.viewableresearcher)
                {
                    if (SupervisorID == r.ID)
                        name = r.Name;
                }
                return name;
            }
        }

        public string Degree { get; set; }







    }
}
