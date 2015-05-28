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
using Microsoft.Office.Interop.Excel;

namespace FairManagementSystemVer1.UI
{
    public partial class ZoneSpecificVisitorUI : Form
    {
        public ZoneSpecificVisitorUI()
        {
            InitializeComponent();
        }
         ZoneManager manager = new ZoneManager();


        

         private void LoadAllZonesInComboBox()
         {

             List<Zone> zones = manager.GetZoneListAll();

             foreach (Zone zone in zones)
             {
                 zoneTypeComboBox.Items.Add(zone.ZoneType);
             }


         }


        

       

        private void ZoneSpecificVisitorUI_Load(object sender, EventArgs e)
        {
            LoadAllZonesInComboBox();
        }

        private void showButton_Click(object sender, EventArgs e)
        {
            if (zoneTypeComboBox.SelectedIndex == -1)
            {
                MessageBox.Show(@"Please select a zone type .", "Message", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            else
            {
                List<Visitor> visitors = manager.GetAllVisitorInSpecificZone(zoneTypeComboBox.SelectedItem.ToString());
                int id = 1;
                zoneSpecificVisitorListView.Items.Clear();
                foreach (Visitor visitor in visitors)
                {
                    ListViewItem item = new ListViewItem(id.ToString());

                    item.SubItems.Add(visitor.Name.ToString());
                    item.SubItems.Add(visitor.Email.ToString());
                    item.SubItems.Add(visitor.ContactNumber.ToString());

                    zoneSpecificVisitorListView.Items.Add(item);
                    id++;

                }
                totalTextBox.Text = (id-1).ToString();
            }
        }

        private void exportButton_Click(object sender, EventArgs e)
        {

            Microsoft.Office.Interop.Excel.Application app = new Microsoft.Office.Interop.Excel.Application();
            app.Visible = true;
            Microsoft.Office.Interop.Excel.Workbook wb = app.Workbooks.Add(1);
            Microsoft.Office.Interop.Excel.Worksheet ws = (Microsoft.Office.Interop.Excel.Worksheet)wb.Worksheets[1];
            int i = 1;
            int i2 = 1;
            foreach (ListViewItem lvi in zoneSpecificVisitorListView.Items)
            {
                i = 1;
                foreach (ListViewItem.ListViewSubItem lvs in lvi.SubItems)
                {
                    ws.Cells[i2, i] = lvs.Text;
                    i++;
                }
                i2++;
            }
        }

       

       

       

     }
  }

