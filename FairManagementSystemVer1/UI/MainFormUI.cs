using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using FairManagementSystemVer1.UI;

namespace FairManagementSystemVer1
{
    public partial class MainFormUI : Form
    {
        public MainFormUI()
        {
            InitializeComponent();
        }

        

        private void exitToolStripMenuItem_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void zoneTypeToolStripMenuItem_Click(object sender, EventArgs e)
        {
            ZoneTypeUI zoneTypeui = new ZoneTypeUI();
            zoneTypeui.Show();
        }

        private void zoneSpecificVisitorDetailsToolStripMenuItem_Click(object sender, EventArgs e)
        {
            ZoneSpecificVisitorUI zoneSpecificVisitorui = new ZoneSpecificVisitorUI();
            zoneSpecificVisitorui.Show();
        }

        private void zoneWiseVisitorDetailsToolStripMenuItem_Click(object sender, EventArgs e)
        {
            ZoneWiseVisitorUI zoneWiseVisitorui = new ZoneWiseVisitorUI();
            zoneWiseVisitorui.Show();

        }

        private void visitorEntryToolStripMenuItem_Click(object sender, EventArgs e)
        {
            VisitorEntryUI visitorEntryUI = new VisitorEntryUI();
            visitorEntryUI.Show();
        }
        
    }
}
