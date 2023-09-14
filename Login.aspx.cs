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


        protected void LoginButton_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty(uname.Text) || string.IsNullOrEmpty(upsw.Text))
                {
                    error.Visible = true;
                    error.Text = "Please enter both username and password.";
                    return;
                }

                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM userTable WHERE userName = @userName AND password = @password", con);
                    cmd.Parameters.AddWithValue("@userName", uname.Text);
                    cmd.Parameters.AddWithValue("@password", upsw.Text);

                    int userCount = Convert.ToInt32(cmd.ExecuteScalar());

                    if (userCount > 0)
                    {
                        SqlCommand cmdType = new SqlCommand("select userName, userType from userTable where userName=@userName", con);
                        cmdType.Parameters.AddWithValue("@userName", uname.Text);

                        SqlDataReader dr = cmdType.ExecuteReader();
                        string type = "";
                        string name = "";
                        while (dr.Read())
                        {
                            type = dr["userType"].ToString().Trim();
                            name = dr["userName"].ToString().Trim();
                        }
                        Session["userName"] = name;


                        if (type == "Admin")
                        {
                            Response.Redirect("Admin.aspx");
                        }
                        else if (type == "Member")
                        {
                            Response.Redirect("Stage.aspx");
                        }
                    }
                    else
                    {
                        error.Visible = true;
                        error.Text = "Invalid username or password. Please try again.";
                    }
                }
            }
            catch (Exception ex)
            {
                error.Visible = true;
                error.Text = "An error occurred. Please try again later.";
                Console.WriteLine("Error: " + ex.ToString());
            }
        }

    }
}
