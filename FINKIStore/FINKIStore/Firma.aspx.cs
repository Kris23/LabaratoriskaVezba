using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FINKIStore
{
    public partial class Firma : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_id"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            User u = DatabaseManagement.getUserByID();
            if (u != null)
            {
                lblFirstName.Text = u.name;
                lblUsername.Text = u.username;
                lblAdress.Text = u.address;
                lblPhone.Text = u.phone;
                lblEmail.Text = u.email;
                //ovde trebat slikata da se stajt...
                image.ImageUrl = "UploadedFiles/images/1.jpg";
            }
            lblPoraka1.Text = "";
            if (!IsPostBack)
                IspolniGrid();
        }
        protected void IspolniGrid()
        {
            int idFirma = (int)(HttpContext.Current.Session["user_id"]);
            SqlConnection konekcija = new SqlConnection();
            konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["mojaKonekcija"].ConnectionString;
            string sqlString = "SELECT * FROM product WHERE idFirma=@idFirma";
            SqlCommand komanda = new SqlCommand(sqlString, konekcija);
            SqlDataAdapter adapter = new SqlDataAdapter(komanda);
            komanda.Parameters.AddWithValue("@idFirma", idFirma);
            DataSet ds = new DataSet();

            try
            {
                konekcija.Open();
                adapter.Fill(ds, "product"); //imeto na tabelata
                gvFirma.DataSource = ds;
                gvFirma.DataBind();
                ViewState["dataset"] = ds;

            }
            catch (Exception err)
            {
                lblPoraka1.Text = err.Message;
            }
            finally
            {
                konekcija.Close();
            }

        }
        protected void gvFirma_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            DataSet ds = (DataSet)ViewState["dataset"];
            gvFirma.EditIndex = -1;
            gvFirma.DataSource = ds;
            gvFirma.DataBind();
        }

        protected void gvFirma_RowEditing(object sender, GridViewEditEventArgs e)
        {
         
            DataSet ds = (DataSet)ViewState["dataset"];
            gvFirma.EditIndex = e.NewEditIndex;
            gvFirma.DataSource = ds;
            gvFirma.DataBind();
        

        }

        protected void gvFirma_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            SqlConnection konekcija = new SqlConnection();
            konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["mojaKonekcija"].ConnectionString;
            string sqlString = "UPDATE product set ime = @ime," +
                " cena = @cena, kolicina=@kolicina, kategorija = @kategorija " +
                " WHERE idProduct = @idProduct";
            SqlCommand komanda = new SqlCommand(sqlString, konekcija);

            TextBox tb = (TextBox)gvFirma.Rows[e.RowIndex].Cells[1].Controls[0];
            komanda.Parameters.AddWithValue("@ime", tb.Text);

            tb = (TextBox)gvFirma.Rows[e.RowIndex].Cells[2].Controls[0];
            komanda.Parameters.AddWithValue("@cena", tb.Text);

            tb = (TextBox)gvFirma.Rows[e.RowIndex].Cells[3].Controls[0];
            komanda.Parameters.AddWithValue("@kolicina", tb.Text);

            tb = (TextBox)gvFirma.Rows[e.RowIndex].Cells[4].Controls[0];
            komanda.Parameters.AddWithValue("@kategorija", tb.Text);

            
            komanda.Parameters.AddWithValue("@idProduct", gvFirma.Rows[e.RowIndex].Cells[0].Text);

            int efekt = 0;
            try {
                konekcija.Open();
                efekt = komanda.ExecuteNonQuery();
            }
            catch (Exception err){
                lblPoraka1.Text = err.Message;
            }
            finally {
                konekcija.Close();
                gvFirma.EditIndex = -1;
            }

            if (efekt != 0)
                IspolniGrid();
        }

        protected void gvFirma_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string autoid = gvFirma.DataKeys[e.RowIndex].Value.ToString();
            SqlConnection konekcija = new SqlConnection();
            konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["mojaKonekcija"].ConnectionString;
            string sqlString = "DELETE FROM product WHERE id_product=@id_product";
            SqlCommand komanda = new SqlCommand(sqlString, konekcija);
            SqlDataAdapter adapter = new SqlDataAdapter(komanda);
            komanda.Parameters.AddWithValue("@id_product", autoid);
            try
            {
                konekcija.Open();
                komanda.ExecuteNonQuery();
            }
            catch (Exception err)
            {
                lblPoraka1.Text = err.Message;
                lblPoraka1.Visible = true;
            }
            finally
            {
                konekcija.Close();
            }
            DataSet ds = DatabaseManagement.cart();
            gvFirma.DataSource = ds;
            gvFirma.DataBind();
            ViewState["dataset"] = ds;
        }

        protected void bthChangePassword_Click(object sender, EventArgs e)
        {
            if (Session["user_id"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            int id = int.Parse(Session["user_id"].ToString());
            Boolean isOldPasswordValid = DatabaseManagement.CheckPassword(id, tbCurrentPassword.Text);
            if (!isOldPasswordValid)
            {
                lblStatus.Text = "Моменталната лозинка не е валидна.";
                lblStatus.ForeColor = Color.Red;
            }
            else
            {
                Boolean isPasswordChanged = DatabaseManagement.ChangePassword(id, tbNewPassword.Text);
                if (isPasswordChanged)
                {
                    lblStatus.Text = "Успешна промена на лозинката.";
                    lblStatus.ForeColor = Color.Green;
                }
                else
                {
                    lblStatus.Text = "Настана грешка при промена на лозинката.";
                    lblStatus.ForeColor = Color.Red;
                }
            }
        }


        protected void btnAddProduct_Click1(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
      
    }
}