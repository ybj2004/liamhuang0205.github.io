using System;
using System.Collections.Generic;
using System.Text;


    public class UserSQL:SQLBase
    {
        private string _tableName = "UserInfo";
        public int createTable()
        {
            string sqlStr = "create table " + _tableName + " ( ";
            sqlStr += "Name varchar(50) primary key,";
            sqlStr += "Password varchar(50),";
            sqlStr += "LoginTime smalldatetime,";
            sqlStr += "Note varchar(50) ";
            sqlStr += " )";

            return base.executeNonQuery(sqlStr);
        }
    }

