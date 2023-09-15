using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace Assignment
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty(codename.Text) || string.IsNullOrEmpty(url.Text))
                {
                    error.Visible = true;
                    error.Text = "Please fill in all the fields before proceed.";
                    return;
                }
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

                con.Open();
                string stageQuery = "INSERT INTO stageTable (codeName, URL) VALUES (@codeName, @url); SELECT SCOPE_IDENTITY()";
                SqlCommand stageCmd = new SqlCommand(stageQuery, con);
                stageCmd.Parameters.AddWithValue("@codeName", codename.Text);
                stageCmd.Parameters.AddWithValue("@url", url.Text);
                int stageId = Convert.ToInt32(stageCmd.ExecuteScalar());
                Session["stageId"] = stageId;

                string assessmentQuery = "INSERT INTO assessmentTable (stageId, assessmentName, questionName, option1, option2, option3, option4) VALUES (@stageId, @assessmentName, @questionName, @option1, @option2, @option3, @option4)";
                SqlCommand assessmentCmd = new SqlCommand(assessmentQuery, con);
                assessmentCmd.Parameters.AddWithValue("@stageId", stageId);
                assessmentCmd.Parameters.AddWithValue("@assessmentName", assessmentField.Text);
                assessmentCmd.Parameters.AddWithValue("@questionName", titlebox.Text);
                assessmentCmd.Parameters.AddWithValue("@option1", txtBox1.Text);
                assessmentCmd.Parameters.AddWithValue("@option2", txtBox2.Text);
                assessmentCmd.Parameters.AddWithValue("@option3", txtBox3.Text);
                assessmentCmd.Parameters.AddWithValue("@option4", txtBox4.Text);
                assessmentCmd.ExecuteNonQuery();
                        
                    
                con.Close();
            }
            catch (Exception)
            {
                error.Visible = true;
                error.Text = "An error occurred while processing your request. Please try again later.";
                Response.Write("Error");
            }
        }

    }
}
