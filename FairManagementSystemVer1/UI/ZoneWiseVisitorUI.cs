using FairManagementSystemVer1.BLL;
using FairManagementSystemVer1.DAL.DAO;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace FairManagementSystemVer1.UI
{
    public partial class ZoneWiseVisitorUI : Form
    {
        public ZoneWiseVisitorUI()
        {
            InitializeComponent();
        }
        ZoneManager manager = new ZoneManager();
        

        public void LoadZoneWiseVisitorInListView()
        {
            int message = 0;

            List<Zone> zones = manager.GetZoneWiseVisitors(out message);
            int id = 1;
            zoneWiseList.Items.Clear();
            foreach (Zone zone in zones)
            {
                ListViewItem listViewItem = new ListViewItem(id.ToString());
                listViewItem.SubItems.Add(zone.ZoneType);
                listViewItem.SubItems.Add(zone.zoneWiseTotalVisitor.ToString());


                zoneWiseList.Items.Add(listViewItem);
                id++;

            }
            totalVisitorTextBox.Text = Convert.ToString(message);


        }

        private void ZoneWiseVisitorUI_Load(object sender, EventArgs e)
        {
            LoadZoneWiseVisitorInListView();
        }

       
    }
}
