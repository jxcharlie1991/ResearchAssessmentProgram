using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace Research_Assessment_Program.Database
{
 class DataConnection
    {
        /// <summary>
        /// Declare the fundamental information of the database
        /// </summary>
        /// <returns></returns>
        public static MySqlConnection GetConnection()
        {
            string db = "kit206";
            string user = "kit206";
            string pass = "kit206";
            string server = "alacritas.cis.utas.edu.au";
            MySqlConnection conn = null;
            if (conn == null)
            {
                string connectionString = String.Format("Database={0};Data Source={1};User Id={2};Password={3}", db, server, user, pass);
                conn = new MySqlConnection(connectionString);
            }
            return conn;
        }

        /// <summary>
        /// Declare a message to show the error
        /// </summary>
        /// <param name="msg"></param>
        /// <param name="e"></param>
        public static void ReportError(string msg, Exception e)
        {
            bool reportingErrors = false;
            if (reportingErrors)
            {
                MessageBox.Show("An error occurred while " + msg + ". Try again later.\n\nError Details:\n" + e,
                    "Error", MessageBoxButton.OKCancel, MessageBoxImage.Error);
            }
        }
    }
}
