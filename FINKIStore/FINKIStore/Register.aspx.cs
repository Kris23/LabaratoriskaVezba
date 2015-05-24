using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FINKIStore
{
    public partial class Register1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddUser_Click(object sender, EventArgs e)
        {
            Validate();

            string username = tbUsername.Text;
            string password = tbPassword.Text;
            int type = int.Parse(RadioButtonList1.SelectedItem.Value);
            
           
            //proveri ga dodavanjeto !!!!!!!
            Boolean isAdded = DatabaseManagement.InsertUser(username, password, tbName.Text, type, tbAddress.Text, tbPhone.Text, tbEmail.Text);

            if (isAdded)
            {
                User u = DatabaseManagement.authenticateUser(username, password);
                if (u != null)
                {
                    Session["user_id"] = u.user_id;
                    Session["name"] = u.getName();
                    Session["user_type"] = u.getUserType();
                }
                Response.Redirect("Default.aspx?succ=1");
            }
            else
            {
                lblError.Visible = true;
            }
        }
    }
}