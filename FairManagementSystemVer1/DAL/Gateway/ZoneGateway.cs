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
  public class ZoneGateway
    {
      string connectionString = ConfigurationManager.ConnectionStrings["FairConDB"].ConnectionString;

        public string Save(Zone aZone)
        {
            string message = "";

            SqlConnection connection = new SqlConnection(connectionString);
            string query = string.Format("INSERT INTO tbl_ZoneType VALUES('{0}')",aZone.ZoneType);
            SqlCommand command = new SqlCommand(query, connection);

            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();
            message = aZone.ZoneType + " has been saved";
            return message;
        }

        public bool HasZonExists(string zoneType)
        {
            bool isZoneExist=false;
            SqlConnection connection = new SqlConnection(connectionString);
            string query = string.Format("SELECT * FROM tbl_ZoneType WHERE ZoneType='{0}'", zoneType);
            SqlCommand command = new SqlCommand(query, connection);
            connection.Open();
        
            SqlDataReader reader =command.ExecuteReader();

            while(reader.Read())
            {
            isZoneExist=true;
            break;
            }

            reader.Close();
            connection.Close();
            return isZoneExist;
        
        }
        public List<Zone> ZoneListAll()
        {
            List<Zone> zoneList = new List<Zone>();
            
            SqlConnection connection = new SqlConnection(connectionString);

            string query = string.Format("SELECT *  FROM tbl_ZoneType");
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

        public List<Zone> GetZoneWiseVisitors(out int zoneWiseTotal)
        {  
            SqlConnection connection = new SqlConnection(connectionString);
            List<Zone> zones = new List<Zone>();

            string query = string.Format(@"select tbl_ZoneType.ZoneType ,  COUNT(tbl_Visitor.Email)  
                                         from tbl_ZoneType join tbl_VisitorZone on tbl_ZoneType.ID = tbl_VisitorZone.ZID
                                         join tbl_Visitor on tbl_VisitorZone.VID = tbl_Visitor.ID
                                         group by tbl_Zonetype.ZoneType");

            SqlCommand cmd = new SqlCommand(query,connection);
            connection.Open();

            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                Zone zone = new Zone();
                zone.ZoneType = reader["ZoneType"].ToString();
                zone.zoneWiseTotalVisitor = Convert.ToInt16(reader[1]);
            
                zones.Add(zone);

            }
            connection.Close();
            zoneWiseTotal = GetTotalVisitor();
            return zones;
        }


        private int GetTotalVisitor()
        {
            SqlConnection connection = new SqlConnection(connectionString);
            string query = string.Format("select COUNT(VID) from tbl_VisitorZone");
            SqlCommand cmd = new SqlCommand(query,connection);
            connection.Open();

            int totalVisitor = (int)cmd.ExecuteScalar();
            connection.Close();


            return totalVisitor;
        }

        public List<Visitor> GetAllVisitorInSpecificZone(string zoneType)
        {

            SqlConnection connection = new SqlConnection(connectionString);
            List<Visitor> visitors = new List<Visitor>();
            string query = string.Format(@"select tbl_Visitor.Name , tbl_Visitor.Email , tbl_Visitor.ContactNumber 
                                           from tbl_Visitor join tbl_VisitorZone  on tbl_Visitor.ID = tbl_VisitorZone.VID 
                                           join tbl_ZoneType  on tbl_ZoneType.ID = tbl_VisitorZone.ZID
                                           where tbl_ZoneType.Zonetype ='{0}'", zoneType);


            SqlCommand cmd = new SqlCommand(query, connection);
            connection.Open();

            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                Visitor visitor = new Visitor();
                visitor.Name = reader[0].ToString();
                visitor.Email = reader[1].ToString();
                visitor.ContactNumber =reader[2].ToString();
                visitors.Add(visitor);
            }

            connection.Close();

            return visitors;

        }
        

    }
}
