using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using FairManagementSystemVer1.DAL.Gateway;
using FairManagementSystemVer1.DAL.DAO;

namespace FairManagementSystemVer1.BLL
{
     
    class ZoneManager
    {
        ZoneGateway gateway = new ZoneGateway();
        
        public string Save(Zone aZone)
        {
            if(gateway.HasZonExists(aZone.ZoneType))
            {
                return "Zone Type Already Exists";
            }
            else
            {
                return gateway.Save(aZone);
            }
        }

        public List<Zone> GetZoneListAll()
        {
            return gateway.ZoneListAll();
        }


        public List<Zone> GetZoneWiseVisitors(out int totalZoneVisitor)
        {

            int totalVisitor = 0;

            List<Zone> zones = gateway.GetZoneWiseVisitors(out totalVisitor);

            totalZoneVisitor = totalVisitor;
            return zones;
        }

        public List<Visitor> GetAllVisitorInSpecificZone(string zoneType)
        {
            return gateway.GetAllVisitorInSpecificZone(zoneType);
        }
       
    }
}
