﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FINKIStore
{
    public partial class Login1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnNajaviSe_Click(object sender, EventArgs e)
        {
            User u = DatabaseManagement.authenticateUser(tbUsername.Text, tbPassword.Text);
              if (u != null)
              {
                  Session["user_id"] = u.user_id;
                  Session["name"] = u.getName();
                  Session["user_type"] = u.getUserType();
                  Response.Redirect("Default.aspx");
              }
              else
              {
                  lblError.Text = "Неуспешна најава. Обидете се повторно.";
              }
             
        }

        protected void LoginView1_ViewChanged(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }
    }
}