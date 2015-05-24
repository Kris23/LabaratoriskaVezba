using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FINKIStore
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string path = HttpContext.Current.Request.Url.LocalPath;
            string[] parts = path.Split('/');
            path = parts[parts.Length - 1];

            switch (path)
            {
                case "Default.aspx":
                    liPocetna.Attributes.Add("class", "active");
                    break;
                case "Oprema.aspx":
                    liOprema.Attributes.Add("class", "active");
                    break;
                case "Uslugi.aspx":
                    liUslugi.Attributes.Add("class", "active");
                    break;
                case "Kontakt.aspx":
                    liKontakt.Attributes.Add("class", "active");
                    break;
                case "Zanas.aspx":
                    liZaNas.Attributes.Add("class", "active");
                    break;
                case "Login.aspx":
                    liNajaviSe.Attributes.Add("class", "active");
                    break;
                /*
            default:
                liAktivnosti.Attributes.Add("class", "active");
                break;
                 */
            }

          if (Session["user_id"] != null)
            {
                lblUser.Text = Session["name"].ToString();
                int user_id = int.Parse(Session["user_id"].ToString());
                //display menu items
                liKorisnik.Visible = true;
                liOdjaviSe.Visible = true;
                liP.Visible = true;
                liNajaviSe.Visible = false;
              /*
                if (!DatabaseManagement.canViewMenuItems(user_id))
                {
                    //liVolonteri.Visible = false;
                    //liClenovi.Visible = false;
                    //liUlogi.Visible = false;
                }

                if (DatabaseManagement.isUserAdmin(user_id))
                {
                    liUlogi.Visible = true;
                }
                else
                {
                    li.Visible = false;
                }
               */
            }
            else
            {
                liKorisnik.Visible = false;
                liOdjaviSe.Visible = false;
                liP.Visible = false;
                liNajaviSe.Visible = true;
            }
           
        }
    }
}