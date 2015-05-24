using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

    public class KebiaoSQL:SQLBase
    {
        private const string _tableName = "Kechen";
        private const string _tableName1 = "KechenLeibie";
        public int getNextPK()
        {
            string sql = "select max(id) from kechen";
            DataSet result = base.executeSelect(sql);
            string maxId = result.Tables[0].Rows[0][0].ToString();
            if (String.IsNullOrEmpty(maxId))
            {
                return 1;
            }
            else
            {
                return Convert.ToInt32(maxId) + 1;
            }
            
        }

        public int createKechen(string name, string kechendate, string TimeStart, string TimeEnd, int remaining, int number, string place, string teacher, int jiage)
        {
            int id = getNextPK();
            string sql = ("insert into " + _tableName + " values (" + id + ",'" + name + "','" + kechendate + "','" + TimeStart + "','" + TimeEnd + "'," + remaining + "," + number + ",'" + place + "','" + teacher + "," + jiage + "')");
            return base.executeNonQuery(sql);
        }

        public int deleteKechen(int id)
        {
            string sql = ("delete from " + _tableName + " where id = " + id);
            return base.executeNonQuery(sql);
        }

        public int changeKechen(int id, string name, string kechendate, string TimeStart, string TimeEnd, int remaining, int number, string place, string teacher, int jiage)
        {
            string sql = ("updata " + _tableName + "set 课程名 = " + " values ('" + name + "'）" + ",日期 = " + " values ('" + kechendate + "')" + ",开始时间 = " + " values ('" + TimeStart + "')" + ",结束时间 = " + " values ('" + TimeEnd + "')" + ",剩余人数 = " + " values (" + remaining + ")" + ",总人数 = " + " values (" + number + ")" + ",上课地点 = " + " values ('" + place + "')" + ",授课老师 = " + " values ('" + teacher + "')" + ",课程价格 = " + " values (" + jiage + ")" + "where id = " + " values (" + id + ")");
            return base.executeNonQuery(sql);
        }

        public DataSet getKechen(int rows)
        {
            string sql;
            if (rows == 0)
            {
                sql = "select * from " + _tableName;
            }
            else
            {
                sql = "select top "+ rows +" * from " + _tableName;
            }

            return base.executeSelect(sql);
        }

        public DataTable getKechenName(int rows, string Column)
        {
            string sql;
            if (rows == 0 )
            {
                sql = "select DISTINCT " + Column + " from " + _tableName;
            }
            else
            {
                sql = "select DISTINCT top " + rows + " " + Column + " from " + _tableName;
            }

            return base.columnSelect(sql);
        }

        /*public void createKechen(string p1, DateTime dateTime, string p2, int remaining)
        {
            throw new NotImplementedException();
        }*/
         
    }
        
