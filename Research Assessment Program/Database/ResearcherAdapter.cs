using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;
using Research_Assessment_Program.Model;

namespace Research_Assessment_Program.Database
{

    class ResearcherAdapter
    {
        /// <summary>
        /// For optimizing the perfomance of the application, seperate the Loading of researchers 
        /// in to three parts.
        /// </summary>
        /// <returns></returns>
        public static List<Researcher> LoadBasicResearcher()
        {
            List<Researcher> researchers = new List<Researcher>();
            MySqlConnection conn = DataConnection.GetConnection();
            MySqlDataReader rdr = null;
            try
            {
                conn.Open();
                MySqlCommand cmd = new MySqlCommand("select id, given_name, family_name, title, level from researcher", conn);
                rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    if (rdr.IsDBNull(4))
                    {

                        researchers.Add(new Student
                        {
                            ID = rdr.GetInt32(0),
                            GivenName = rdr.GetString(1),
                            FamilyName = rdr.GetString(2),
                            Title = rdr.GetString(3),
                            Level = EmploymentLevel.Student
                        });
                    }
                    else
                    {
                        researchers.Add(new Staff
                        {
                            ID = rdr.GetInt32(0),
                            GivenName = rdr.GetString(1),
                            FamilyName = rdr.GetString(2),
                            Title = rdr.GetString(3),
                            Level = (EmploymentLevel)Enum.Parse(typeof(EmploymentLevel), rdr.GetString(4))
                        });

                    }
                }
            }
            catch (Exception ex)
            {
                DataConnection.ReportError("loading researcher", ex);
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
            };
            return researchers;
        }

        public static Researcher LoadFullResearcher(Researcher researcher)
        {
            MySqlConnection conn = DataConnection.GetConnection();
            MySqlDataReader rdr = null;
            try
            {
                conn.Open();
                MySqlCommand cmd = new MySqlCommand("select unit, campus, email, photo, utas_start, current_start, degree, supervisor_id " +
                    "from researcher " + "where id=?id", conn);
                cmd.Parameters.AddWithValue("id", researcher.ID);
                rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    if (researcher.Level == EmploymentLevel.Student)
                    {
                        Student student = (Student)researcher;
                        student.Unit = rdr.GetString(0);
                        student.Campus = rdr.GetString(1);
                        student.Email = rdr.GetString(2);
                        student.Photo = rdr.GetString(3);
                        student.UtasStart = rdr.GetDateTime(4);
                        student.CurrentStart = rdr.GetDateTime(5);
                        student.Degree = rdr.GetString(6);
                        student.SupervisorID = rdr.GetInt32(7);
                    }
                    else
                    {
                        Staff staff = (Staff)researcher;
                        staff.Unit = rdr.GetString(0);
                        staff.Campus = rdr.GetString(1);
                        staff.Email = rdr.GetString(2);
                        staff.Photo = rdr.GetString(3);
                        staff.UtasStart = rdr.GetDateTime(4);
                        staff.CurrentStart = rdr.GetDateTime(5);
                    }
                }
            }
            catch (Exception ex)
            {
                DataConnection.ReportError("loading researcher", ex);
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
            return researcher;
        }
        public static List<Student> LoadSupervises(Researcher r)
        {
            List<Student> ss = new List<Student>();

            if (r.Level != EmploymentLevel.Student)
            {

                MySqlConnection conn = DataConnection.GetConnection();
                MySqlDataReader rdr = null;
                try
                {
                    conn.Open();
                    MySqlCommand cmd = new MySqlCommand("select given_name, family_name, supervisor_id from researcher " +
                        "where supervisor_id=?id", conn);
                    cmd.Parameters.AddWithValue("id", r.ID);
                    rdr = cmd.ExecuteReader();
                    while (rdr.Read())
                    {
                        ss.Add(new Student
                        {
                            GivenName = rdr.GetString(0),
                            FamilyName = rdr.GetString(1),
                            SupervisorID = rdr.GetInt32(2)
                        });

                    }
                }
                catch (Exception ex)
                {
                    DataConnection.ReportError("loading researcher", ex);
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
                return ss;

            }
            else
            {
                ss = null;

                return ss;
            }
        }
    }
}
