using MySql.Data.MySqlClient;
using Research_Assessment_Program.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Research_Assessment_Program.Database
{
    class PublicationAdapter
    {


        public static List<Publication> LoadBasicPublication(Researcher r)
        {
            List<Publication> publications = new List<Publication>();
            MySqlConnection conn = DataConnection.GetConnection();
            MySqlDataReader rdr = null;
            try
            {
                conn.Open();
                MySqlCommand cmd = new MySqlCommand("select doi, title, authors, year " +
                    "from publication " +
                    "where doi in (select doi from researcher_publication where researcher_id= ?id) order by year desc, title", conn);
                //"where publication.doi=researcher_publication.doi and researcher_publication.id=?id", conn);
                cmd.Parameters.AddWithValue("id", r.ID);
                rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    publications.Add(new Publication
                    {
                        DOI = rdr.GetString(0),
                        Title = rdr.GetString(1),
                        Author = rdr.GetString(2),
                        Year = rdr.GetInt32(3),
                    });
                }

            }
            finally
            {
                if (rdr != null)
                {
                    rdr.Close();
                }
                if (conn != null)
                {
                    conn.Close();
                }
            }
            return publications;
        }
        public static Publication LoadCompletePublication(Publication publication)
        {
            MySqlConnection conn = DataConnection.GetConnection();
            MySqlDataReader rdr = null;
            try
            {
                conn.Open();
                MySqlCommand cmd = new MySqlCommand("select type, cite_as, available " +
                    "from publication " + "where doi=?doi", conn);
                cmd.Parameters.AddWithValue("doi", publication.DOI);
                rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    publication.Type = (OutputType)Enum.Parse(typeof(OutputType), rdr.GetString(0));
                    publication.CiteAs = rdr.GetString(1);
                    publication.Available = rdr.GetDateTime(2);
                }
            }
            finally
            {
                if (rdr != null)
                {
                    rdr.Close();
                }
                if (conn != null)
                {
                    conn.Close();
                }
            }
            return publication;
        }
    }
}
