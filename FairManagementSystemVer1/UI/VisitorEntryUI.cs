using FairManagementSystemVer1.BLL;
using FairManagementSystemVer1.DAL.DAO;
using FairManagementSystemVer1.DAL.Gateway;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace FairManagementSystemVer1
{
    public partial class VisitorEntryUI : Form
    {

        int lastGeneratedId = 0;
        public VisitorEntryUI()
        {
            InitializeComponent();
            LoadCheckedListBox();
        }

        VisitorManager vManager = new VisitorManager();
        VisitorGateway vGateway = new VisitorGateway();
        Visitor aVisitor = new Visitor();
        private void saveButton_Click(object sender, EventArgs e)
        {
            if (nameTextBox.Text == "" || emailTextBox.Text == "" || contactNumberTextBox.Text == "")
            {
                MessageBox.Show(@"pls fill up the text box !","Error",MessageBoxButtons.OK,MessageBoxIcon.Error);
            }
            else
            {
                aVisitor.Name = nameTextBox.Text;
                aVisitor.Email = emailTextBox.Text;
                aVisitor.ContactNumber = contactNumberTextBox.Text;

                if (vGateway.HasEmailExists(aVisitor.Email))
                {
                    MessageBox.Show("A Visitor already Exist with this Email ! ", @"Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                else
                {

                    lastGeneratedId = (vManager.SaveVisitor(aVisitor));
                    if (lastGeneratedId > 0)
                    {
                        MessageBox.Show("Visitor Added Successfully", @"Information", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        GetTextTextBoxesClear();
                    }
                    else
                    {
                        MessageBox.Show("Not Added !!",@"Error",MessageBoxButtons.OK,MessageBoxIcon.Error);
                    }
                }
                
            }

           List<string> items = new List<string> { };

            foreach (var checkedItem in zoneCheckedListBox.CheckedItems)
            {
              items.Add(zoneCheckedListBox.GetItemText(checkedItem));
            }
            foreach(var item in items)
            {
              int zoneID= vManager.GetZoneIDByName(item);
               vManager.SaveVisitorZone(zoneID, lastGeneratedId);

            }
        
        }


        //public void LoadCheckedListBox()
        //{
        //    flowLayoutPanel1.Controls.Clear();
        //    List<Zone> zoneList = vManager.LoadCheckedListBox();
        //    int count = 1;
        //    foreach (Zone zone in zoneList)
        //    {

        //        CheckBox ch = new CheckBox();
        //        ch.Text = zone.ZoneType;
        //        ch.Name = "myCheckBox" + count;
                
        //         ch.AutoSize = true;
        //        count++;
        //        flowLayoutPanel1.Controls.Add(ch);
        //    }

        //}


        public void LoadCheckedListBox()
        {
            List<Zone> zoneList = vManager.LoadCheckedListBox();

            foreach (Zone zone in zoneList)
            {
                zoneCheckedListBox.Items.Add(zone.ZoneType);
                
                
               
                
            }

        }
        public void GetTextTextBoxesClear()
        {
            nameTextBox.Clear();
            emailTextBox.Clear();
            contactNumberTextBox.Clear();
        }
     
    }
}

