using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;


    public class SQLBase
    {
        private string _connectionString = "data source=localhost;User ID=sa;pwd=111111;Initial Catalog=kebiao";
         

        public int executeNonQuery(string sqlStr)
        {
            using (SqlConnection con = new SqlConnection(_connectionString))
            {
                con.Open();
                SqlCommand command = new SqlCommand(sqlStr, con); 
                int affectedRows = command.ExecuteNonQuery();
                con.Close();
                return affectedRows;
            }
        }

        public DataSet executeSelect(string sqlStr)
        {
            using (SqlConnection con = new SqlConnection(_connectionString))
            {
                con.Open();
                SqlCommand command = new SqlCommand(sqlStr, con);
                SqlDataAdapter adapter = new SqlDataAdapter(command); 
                DataSet dataSet = new DataSet();
                adapter.Fill(dataSet); 
                con.Close();
                return dataSet;
            }
        }

        public DataTable columnSelect(string sqlStr)
        {
            using (SqlConnection con = new SqlConnection(_connectionString))
            {
                con.Open();
                SqlCommand command = new SqlCommand(sqlStr, con);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                DataSet dataColumn = new DataSet();
                adapter.Fill(dataColumn); 
                con.Close();
                return dataColumn.Tables[0];
            }
        }
    }

