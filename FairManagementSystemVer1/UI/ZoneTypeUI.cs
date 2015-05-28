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
    public partial class ZoneTypeUI : Form
    {
        public ZoneTypeUI()
        {
            InitializeComponent();
            LoadListView();
        }
        ZoneManager manager = new ZoneManager();
        Zone aZone = new Zone();
        

        private void saveButton_Click(object sender, EventArgs e)
        {
            aZone.ZoneType = typenameTextBox.Text;

            if (typenameTextBox.Text != "")
            {
                MessageBox.Show(manager.Save(aZone));
                LoadListView();
                typenameTextBox.Clear();
            }
            else
            {
                MessageBox.Show(@"Please enter the  type ","Error",MessageBoxButtons.OK,MessageBoxIcon.Error);
            }

        }

        public void LoadListView()
        {
            zoneEntryListView.Items.Clear();
            List<Zone> zoneList = manager.GetZoneListAll();
            int id = 1;

            
            foreach(Zone  zone in zoneList)
            {
                ListViewItem items = new ListViewItem(id.ToString());
             

                items.SubItems.Add(zone.ZoneType);

                zoneEntryListView.Items.Add(items);
                id++;

            }

        }
    }
}
