using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace FINKIStore
{
    public class DatabaseManagement
    {
        private static SqlConnection getConnection()
        {
            SqlConnection konekcija = new SqlConnection();
            konekcija.ConnectionString = ConfigurationManager.ConnectionStrings["mojaKonekcija"].ConnectionString;
            return konekcija;
        }

        public static User authenticateUser(string username, string password)
        {
            SqlConnection konekcija = getConnection();
            string sqlString = "SELECT * FROM dbo.[user] WHERE username=@username AND password=@password";
            SqlCommand komanda = new SqlCommand(sqlString, konekcija);
            komanda.Parameters.AddWithValue("@username", username);
            komanda.Parameters.AddWithValue("@password", password);

            try
            {
                konekcija.Open();
                SqlDataReader citac = komanda.ExecuteReader();
                if (citac.Read())
                {

                    User u = new User();
                    u.user_id = int.Parse(citac["idUser"].ToString());
                    u.name = citac["ime"].ToString();
                    u.type = int.Parse(citac["type"].ToString());
                    return u;
                }
                else
                    return null;
            }
            catch (Exception err)
            {
                Console.Write(err.ToString());
            }
            finally
            {
                konekcija.Close();
            }
            return null;
        }

        public static Boolean InsertUser(string username, string password, string ime, int type, string address, string phone, string email)
        {
            Boolean result = false;
            SqlConnection konekcija = getConnection();
            string sqlString = "";
            sqlString = "INSERT INTO dbo.[user] (username, password, ime, type, adresa, telefon, email)" +
                "VALUES (@username, @password, @ime, @type, @adresa, @telefon, @email)";
            
            SqlCommand komanda = new SqlCommand(sqlString, konekcija);      

            komanda.Parameters.AddWithValue("@username", username);
            komanda.Parameters.AddWithValue("@password", password);
            komanda.Parameters.AddWithValue("@ime", ime);
            komanda.Parameters.AddWithValue("@type", type);
            komanda.Parameters.AddWithValue("@adresa", address);
            komanda.Parameters.AddWithValue("@telefon", phone);
            komanda.Parameters.AddWithValue("@email", email);
          
            try
            {
                konekcija.Open();
                komanda.ExecuteNonQuery();
                result = true;
                
            }
            catch (Exception err)
            {
                Console.Write(err.ToString());
            }
            finally
            {
                konekcija.Close();
            }
            return result;
        }

        public static Boolean CheckPassword(int id, string password)
        {
            SqlConnection konekcija = getConnection();
            string sqlString = "SELECT * FROM dbo.[user] WHERE idUser=@user_id AND password=@password";
            SqlCommand komanda = new SqlCommand(sqlString, konekcija);
            komanda.Parameters.AddWithValue("@user_id", id);
            komanda.Parameters.AddWithValue("@password", password);

            try
            {
                konekcija.Open();
                SqlDataReader citac = komanda.ExecuteReader();
                if (citac.Read())
                {
                    return true;
                }
                else
                    return false;
            }
            catch (Exception err)
            {
                Console.Write(err.ToString());
            }
            finally
            {
                konekcija.Close();
            }
            return false;
        }

        public static Boolean ChangePassword(int id, string password)
        {
            SqlConnection konekcija = getConnection();
            string sqlString = "UPDATE dbo.[user] SET password=@password WHERE idUser=@user_id";
            SqlCommand komanda = new SqlCommand(sqlString, konekcija);
            komanda.Parameters.AddWithValue("@user_id", id);
            komanda.Parameters.AddWithValue("@password", password);

            try
            {
                konekcija.Open();
                int count = komanda.ExecuteNonQuery();
                return count == 1;
            }
            catch (Exception err)
            {
                Console.Write(err.ToString());
            }
            finally
            {
                konekcija.Close();
            }
            return false;
        }
    }
}