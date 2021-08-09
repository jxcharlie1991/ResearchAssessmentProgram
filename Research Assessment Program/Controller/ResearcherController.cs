using Research_Assessment_Program.Database;
using Research_Assessment_Program.Model;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Research_Assessment_Program.Controller
{

    class ResearcherController
    {
        public Researcher completeR = new Researcher();
        public ObservableCollection<Researcher> viewableresearcher =new ObservableCollection<Researcher>();
        public List<Researcher> researchers = new List<Researcher> ();


        public ObservableCollection<Researcher> LoadRList()
        {
           researchers = ResearcherAdapter.LoadBasicResearcher();
            viewableresearcher = new ObservableCollection<Researcher>(researchers);


            return viewableresearcher;
        }
        public static List<Researcher> LevelFilter(List<Researcher> rs, string l)
        {
            List<Researcher> ors = new List<Researcher>();

            if (l == "All researchers")
            {
                ors = rs;
            }
            else
            {

                foreach (Researcher r in rs)
                {
                    if (r.Level.ToString() == l)
                        ors.Add(r);
                }
            }
            // ObservableCollection<Researcher> v = new ObservableCollection<Researcher>(ors);
            return ors;

        }

        public static List<Researcher> NameFilter(List<Researcher> rs, string n)
        {
            List<Researcher> ors = new List<Researcher>();
            foreach (Researcher r in rs)
            {
                if (r.FamilyName.ToLower().Contains(n.ToLower()) || r.GivenName.ToLower().Contains(n.ToLower()))
                    ors.Add(r);
            }
            return ors;

        }
        public static List<Cumulative> LoadCumulative(Researcher r)
        {
            List<Cumulative> cumulative = new List<Cumulative>();
            List<int> year = new List<int>();
            int numb = 0;
            foreach (Publication p in r.Publications)
            {
                year.Add(p.Year);
            }
            year = BubbleSort(year);
            HashSet<int> hashedYear = new HashSet<int>(year);

            foreach (int y in hashedYear)
            {
                numb = 0;
                foreach (Publication p2 in r.Publications)

                    if (y == p2.Year)
                    {
                        numb++;

                    }
                cumulative.Add(new Cumulative { Year = y, Number = numb });
            }

            return cumulative;
        }

        public static List<int> BubbleSort(List<int> listNumber)
        {
            int temp;
            for (int i = 0; i < listNumber.Count - 1; i++)
            {

                for (int j = 0; j < listNumber.Count - i - 1; j++)
                {
                    if (listNumber[j] > listNumber[j + 1])
                    {
                        temp = listNumber[j];
                        listNumber[j] = listNumber[j + 1];
                        listNumber[j + 1] = temp;
                    }
                }
            }
            return listNumber;
        }


        public static List<Publication> YearOrder(List<Publication> ps)
        {
            Publication temp;
            if (ps[0].Year >= ps[ps.Count - 1].Year)
            {
                for (int i = 0; i < ps.Count - 1; i++)
                {
                    for (int j = 0; j < ps.Count - i - 1; j++)
                    {
                        if (ps[j].Year > ps[j + 1].Year)
                        {
                            temp = ps[j];
                            ps[j] = ps[j + 1];
                            ps[j + 1] = temp;
                        }
                    }
                }
            }
            else
            {
                for (int i = 0; i < ps.Count - 1; i++)
                {
                    for (int j = 0; j < ps.Count - i - 1; j++)
                    {
                        if (ps[j].Year < ps[j + 1].Year)
                        {
                            temp = ps[j];
                            ps[j] = ps[j + 1];
                            ps[j + 1] = temp;
                        }
                    }
                }
            }
            return ps;

        }

        public static List<Publication> YearFilter(int former, int later, List<Publication> ps)
        {
            List<Publication> filtered = new List<Publication>();

            foreach (Publication p in ps)
            {
                if (p.Year >= former && p.Year <= later)
                {
                    filtered.Add(p);
                }
            }
            return filtered;
        }
    }

}

