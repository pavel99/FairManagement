using FairManagementSystemVer1.DAL.DAO;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FairManagementSystemVer1.DAL.Gateway
{
    public class VisitorGateway
    {
        string connectionString = ConfigurationManager.ConnectionStrings["FairConDB"].ConnectionString;

        public List<Zone> LoadCheckedListBox()
        {

            List<Zone> zoneList = new List<Zone>();
            SqlConnection connection = new SqlConnection(connectionString);

            string query = string.Format("SELECT *  FROM tbl_ZoneType ");
            SqlCommand cmd = new SqlCommand(query, connection);
            connection.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                Zone aZone = new Zone();
                aZone.ID = Convert.ToInt32(reader["ID"]);
                aZone.ZoneType = reader["ZoneType"].ToString();
                zoneList.Add(aZone);
            }
            reader.Close();
            connection.Close();
            return zoneList;
        }

        public int  GetZoneIDByName(string name)
        {

            SqlConnection connection = new SqlConnection(connectionString);


            string query = "SELECT ID FROM tbl_ZoneType WHERE ZoneType='" + name + "'";


            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();
           int Id =Convert.ToInt32( command.ExecuteScalar());

            connection.Close();
            return Id;
        }

        public int SaveVisitor(Visitor aVisitor)
        {
            
            SqlConnection connection = new SqlConnection(connectionString);
            string query = string.Format("INSERT INTO  tbl_Visitor OUTPUT INSERTED.ID VALUES('{0}','{1}','{2}')",aVisitor.Name,aVisitor.Email,aVisitor.ContactNumber);
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();
           int rowsInserted = (int) command.ExecuteScalar();
            connection.Close();

            return rowsInserted; ;
        }

        public int SaveVisitorZone(int zoneId, int visitorId)
        {
            int rowsAffected = 0;
            string query = string.Format("INSERT INTO  tbl_VisitorZone VALUES('{0}','{1}')", zoneId, visitorId);
            using (SqlConnection connection = new SqlConnection(connectionString)) 
            {
                SqlCommand cmd = new SqlCommand(query,connection);
                connection.Open();
                rowsAffected =cmd.ExecuteNonQuery();

            }

            return rowsAffected;

          
            
        
        }

        //public int GetLastGeneratedId() 
        //{
        //    int lastId = 0;
        //    using (SqlConnection con = new SqlConnection(connectionString)) 
        //    {
        //        SqlCommand cmd = new SqlCommand("Select SCOPE_IDENTITY()'",con);
        //        con.Open();
        //        lastId = Convert.ToInt32(cmd.ExecuteScalar());

        //    }

        //    return lastId;
        
        //}



        public bool HasEmailExists(string email)
        {
            bool isEmailExist = false;
            SqlConnection connection = new SqlConnection(connectionString);
            string query = string.Format("SELECT Email FROM tbl_Visitor WHERE Email='{0}'", email);
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();

            SqlDataReader reader = command.ExecuteReader();

            while (reader.Read())
            {
                isEmailExist = true;
                break;
            }

            reader.Close();
            connection.Close();
            return isEmailExist;

        }


    }
}