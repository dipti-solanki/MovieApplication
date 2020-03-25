using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;

namespace MovieManagement
{
    public abstract class Connection
    {
        public SqlConnection SqlConnection { get; set; }
        public SqlCommand SqlCommand { get; set; }

        public Connection()
        {
            this.SqlConnection = new SqlConnection(@"Data Source=LAPTOP-2GNVTV4M\SQLEXPRESS;Initial Catalog=MovieDetailDb;Integrated Security=True");
            this.SqlConnection.Open();
        }

        public void ExecuteNonQuery(string command)
        {
            SqlCommand = new SqlCommand(command, SqlConnection);
            SqlCommand.ExecuteNonQuery();
        }

        public SqlDataReader GetReader(string command)
        {
            this.SqlCommand = new SqlCommand(command, SqlConnection);
            return this.SqlCommand.ExecuteReader();
        }

        public void CloseConnection()
        {
            SqlConnection.Close();
        }
    }
}
