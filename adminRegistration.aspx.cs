using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace Assignment
{
    public partial class adminRegistration : System.Web.UI.Page
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
                string query = "INSERT INTO userTable (userName, email, password, gender, age, userType) VALUES (@userName, @email, @password, @gender, @age, @userType)";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@userName", txtName.Text);
                cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@password", txtPassword.Text);
                cmd.Parameters.AddWithValue("@gender", rbMale.Checked ? "Male" : "Female");
                cmd.Parameters.AddWithValue("@age", Convert.ToInt32(txtAge.Text));
                cmd.Parameters.AddWithValue("@userType", userType.Text);
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
        protected void OnMove(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}