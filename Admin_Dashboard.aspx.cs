using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
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
            
            
                if (Session["userName"] != null)
                {
                    admin_uname.Text = "Welcome! " + Session["userName"].ToString();
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
            
        

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty(codename.Text))
                {
                    error.Visible = true;
                    error.Text = "Please fill in all the fields before proceed.";
                    return;
                }
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

                con.Open();
                string stageQuery = "INSERT INTO stageTable (codeName) VALUES (@codeName); SELECT SCOPE_IDENTITY()";
                SqlCommand stageCmd = new SqlCommand(stageQuery, con);
                stageCmd.Parameters.AddWithValue("@codeName", codename.Text);
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

                string url = urltextbox.Text;

                if (string.IsNullOrEmpty(videotitle.Text))
                {
                    Label4.Visible = true;
                    Label4.Text = "Please fill in the blanks!";
                }
                else
                {
                    if (url.Contains("youtube.com"))
                    {
                        string ytFormattedUrl = GetYouTubeID(url);

                        if (!CheckDuplicate(ytFormattedUrl))
                        {
                            string video = "insert into videoTable (title,description,url,stageId) values (@videotitle, @description, @url,@stageId)";
                            SqlCommand cmd1 = new SqlCommand(video, con);
                            {
                                cmd1.Parameters.AddWithValue("@stageId", stageId);
                                cmd1.Parameters.AddWithValue("@url", ytFormattedUrl);
                                cmd1.Parameters.AddWithValue("@videotitle", videotitle.Text);
                                cmd1.Parameters.AddWithValue("@description", description.Value);
                                cmd1.ExecuteNonQuery();
                                Label4.Visible = true;
                                Label4.Text = "Added!";
                            }

                        }
                        else
                        {
                            Label4.Visible = true;
                            Label4.Text = "This video already exists in our database!";
                        }
                    }
                    else
                    {
                        Label4.Visible = true;
                        Label4.Text = "This URL is invalid!";

                    }
                    con.Close();
                }
            }
            catch (Exception)
            {
                error.Visible = true;
                error.Text = "An error occurred while processing your request. Please try again later.";
                Response.Write("Error");
            }
        }


        //Add Video 
        private string GetYouTubeID(string youTubeUrl)
        {
            //RegEx to Find YouTube ID
            Match regexMatch = Regex.Match(youTubeUrl, "^[^v]+v=(.{11}).*",
                               RegexOptions.IgnoreCase);
            if (regexMatch.Success)
            {
                return "https://www.youtube.com/v/" + regexMatch.Groups[1].Value +
                       "&hl=en&fs=1";
            }
            return youTubeUrl;
        }


        public bool CheckDuplicate(string youTubeUrl)
        {
            bool exists = false;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
            SqlCommand cmd = new SqlCommand(String.Format("select * from videoTable where url='{0}'", youTubeUrl), con);

            using (con)
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                dr.Read();
                exists = (dr.HasRows) ? true : false;
            }

            return exists;
        }

        protected void logoutBtn_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Request.Cookies.Clear();

            Response.Redirect("login.aspx");
        }
    }
}


      

