using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Research_Assessment_Program.Model
{
    public enum OutputType { Conference, Journal, Other }
    public class Publication
    {
        public int Id { get; set; }
        public string DOI { get; set; }
        public string Title { get; set; }
        public string Author { get; set; }
        public int Year { get; set; }
        public OutputType Type { get; set; }
        public string CiteAs { get; set; }
        public DateTime Available { get; set; }
        public string Age
        {
            get
            {
                int age;
                age = DateTime.Now.Year - Year;
                return String.Format(age + " years old");
            }
        }


    }
}
