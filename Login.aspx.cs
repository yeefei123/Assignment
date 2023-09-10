using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;
using System.Xml.Linq;

namespace Assignment
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RegisterButton_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                con.Open();
                string query = "INSERT INTO userTable (userName, email, password, gender, age) VALUES (@userName, @email, @password, @gender, @age)";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@userName", txtName.Text);
                cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@password", txtPassword.Text);
                cmd.Parameters.AddWithValue("@gender", rbMale.Checked ? "Male" : "Female");
                cmd.Parameters.AddWithValue("@age", Convert.ToInt32(txtAge.Text));
                cmd.ExecuteNonQuery();
                con.Close();

                ScriptManager.RegisterStartupScript(this, this.GetType(), "showLoginModal", "showAdminModal();", true);
            }
            catch (Exception ex)
            {
                error.Visible = true;
                error.Text = "Invalid username or password.";
                Console.WriteLine("Error: " + ex.ToString());
            }
        }


        protected void LoginButton_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                con.Open();
                string query = "SELECT COUNT(*) FROM userTable WHERE userName = @userName AND password = @password";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@userName", uname.Text);
                cmd.Parameters.AddWithValue("@password", upsw.Text);
                int userCount = Convert.ToInt32(cmd.ExecuteScalar());
                con.Close();

                if (userCount > 0)
                {
                    Response.Redirect("Stage.aspx");
                }
                else
                {
                    error.Visible = true;
                    error.Text = "Invalid username or password.";
                }
            }
            catch (Exception ex)
            {
                error.Visible = true;
                error.Text = "Error: " + ex.ToString();
            }
        }
    }
}
