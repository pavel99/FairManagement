using FairManagementSystemVer1.DAL.DAO;
using FairManagementSystemVer1.DAL.Gateway;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FairManagementSystemVer1.BLL
{
 public   class VisitorManager
    {
     VisitorGateway vGateway = new VisitorGateway();
     public List<Zone> LoadCheckedListBox()
     {
         return vGateway.LoadCheckedListBox();
     }

     public int SaveVisitorZone(int zoneId, int visitorId) 
     {
         return vGateway.SaveVisitorZone(zoneId , visitorId);
     }

     //public int GetLastGeneratedId() 
     //{
     //    return vGateway.GetLastGeneratedId();
     //}

     public int GetZoneIDByName(string name)
     {
         return vGateway.GetZoneIDByName(name);
     }

     public int SaveVisitor(Visitor aVisitor)
     {
        
         
           return vGateway.SaveVisitor(aVisitor);
        
         
     }
       
   }
}
