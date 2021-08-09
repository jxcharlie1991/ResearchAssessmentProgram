using MySql.Data.MySqlClient;
using Research_Assessment_Program.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Research_Assessment_Program.Database
{
    class PositionAdapter
    {
        public static List<Position> LoadPosition(Researcher r)
        {
            List<Position> ps = new List<Position>();
            MySqlConnection conn = DataConnection.GetConnection();
            MySqlDataReader rdr = null;
            try
            {
                conn.Open();
                MySqlCommand cmd = new MySqlCommand("select level, start, end from position where id = ?id", conn);
                cmd.Parameters.AddWithValue("id", r.ID);
                rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    if (rdr.IsDBNull(0))
                    {
                        ps.Add(new Position
                        {
                            Level = EmploymentLevel.Student,
                            Start = rdr.GetDateTime(1).ToShortDateString(),
                            End = rdr.GetDateTime(2).ToShortDateString()
                        });
                    }
                    else if (rdr.IsDBNull(2))
                    {
                        ps.Add(new Position
                        {
                            Level = (EmploymentLevel)Enum.Parse(typeof(EmploymentLevel), rdr.GetString(0)),
                            Start = rdr.GetDateTime(1).ToShortDateString(),
                            End = DateTime.Now.ToShortDateString()
                        });

                    }
                    else
                    {
                        ps.Add(new Position
                        {
                            Level = (EmploymentLevel)Enum.Parse(typeof(EmploymentLevel), rdr.GetString(0)),
                            Start = rdr.GetDateTime(1).ToShortDateString(),
                            End = rdr.GetDateTime(2).ToShortDateString()
                        });
                    }
                
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
            return ps;

        }
    }
}

