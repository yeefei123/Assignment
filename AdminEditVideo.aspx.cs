using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Reflection.Emit;

namespace Assignment

{

    public partial class AdminEditVideo : System.Web.UI.Page

    {

        protected void Page_Load(object sender, EventArgs e)

        {
            

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

            con.Open();

            if (!Page.IsPostBack)

            {
                SqlDataAdapter da = new SqlDataAdapter("Select * from videoTable where stageId = '" + DropDownList1 + "'", con);
                DataTable dt = new DataTable();
                DropDownList1.DataBind();
                

            }



        }



        

        protected void DropDownList1_SelectedIndexChanged1(object sender, EventArgs e)
        {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter("Select * from videoTable where stageId ='" + DropDownList1.SelectedValue+ "'", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                
                

            if(dt.Rows.Count >=4)
            {
                titlebox.Visible = titlebox2.Visible = titlebox3.Visible = titlebox4.Visible= title1.Visible = title2.Visible = title3.Visible = title4.Visible = true;
                descriptionbox.Visible = descriptionbox2.Visible = descriptionbox3.Visible = descriptionbox4.Visible= des1.Visible = des2.Visible = des3.Visible = des4.Visible = true;
                URLBox.Visible = URLBox2.Visible = URLBox3.Visible = URLBox4.Visible= url1.Visible = url2.Visible = url3.Visible = url4.Visible = true;
                stageidbox.Visible = stageidbox2.Visible = stageidbox3.Visible = stageidbox4.Visible= stageid1.Visible = stageid2.Visible = stageid3.Visible = stageid4.Visible = true;
                Button1.Visible = Button2.Visible = Button3.Visible = Button4.Visible = true;

                //first video

                titlebox.Text = dt.Rows[0][1].ToString();
                descriptionbox.Value = dt.Rows[0][2].ToString();
                URLBox.Text = dt.Rows[0][3].ToString();
                stageidbox.Text = dt.Rows[0][4].ToString();
                TextBox1.Text = dt.Rows[0][0].ToString();



                //second video 
                titlebox2.Text = dt.Rows[1][1].ToString();
                descriptionbox2.Value = dt.Rows[1][2].ToString();
                URLBox2.Text = dt.Rows[1][3].ToString();
                stageidbox2.Text = dt.Rows[1][4].ToString();
                TextBox2.Text = dt.Rows[1][0].ToString();

                //third video 
                titlebox3.Text = dt.Rows[2][1].ToString();
                descriptionbox3.Value = dt.Rows[2][2].ToString();
                URLBox3.Text = dt.Rows[2][3].ToString();
                stageidbox3.Text = dt.Rows[2][4].ToString();
                TextBox3.Text = dt.Rows[2][0].ToString();

                //fourth video 
                titlebox4.Text = dt.Rows[3][1].ToString();
                descriptionbox4.Value = dt.Rows[3][2].ToString();
                URLBox4.Text = dt.Rows[3][3].ToString();
                stageidbox4.Text = dt.Rows[3][4].ToString();
                TextBox4.Text = dt.Rows[3][0].ToString();

            }
            else if (dt.Rows.Count == 3)
            {

                titlebox.Visible = titlebox2.Visible = titlebox3.Visible = title1.Visible = title2.Visible = title3.Visible = true;
                descriptionbox.Visible = descriptionbox2.Visible = descriptionbox3.Visible =  des1.Visible = des2.Visible = des3.Visible = true;
                URLBox.Visible = URLBox2.Visible = URLBox3.Visible = url1.Visible = url2.Visible = url3.Visible =  true;
                stageidbox.Visible = stageidbox2.Visible = stageidbox3.Visible = stageid1.Visible = stageid2.Visible = stageid3.Visible =true;
                titlebox4.Visible = descriptionbox4.Visible = URLBox4.Visible = stageidbox4.Visible = title4.Visible = des4.Visible = 
                    url4.Visible = stageid4.Visible = false;
                Button1.Visible = Button2.Visible = Button3.Visible  = true;


                //first video

                titlebox.Text = dt.Rows[0][1].ToString();
                descriptionbox.Value = dt.Rows[0][2].ToString();
                URLBox.Text = dt.Rows[0][3].ToString();
                stageidbox.Text = dt.Rows[0][4].ToString();
                TextBox1.Text = dt.Rows[0][0].ToString();

                //second video 
                titlebox2.Text = dt.Rows[1][1].ToString();
                descriptionbox2.Value = dt.Rows[1][2].ToString();
                URLBox2.Text = dt.Rows[1][3].ToString();
                stageidbox2.Text = dt.Rows[1][4].ToString();
                TextBox2.Text= dt.Rows[1][0].ToString();

                //third video 
                titlebox3.Text = dt.Rows[2][1].ToString();
                descriptionbox3.Value = dt.Rows[2][2].ToString();
                URLBox3.Text = dt.Rows[2][3].ToString();
                stageidbox3.Text = dt.Rows[2][4].ToString();
                TextBox3.Text = dt.Rows[2][0].ToString();


            }
            else if(dt.Rows.Count == 2)
            {


                titlebox.Visible = titlebox2.Visible =  title1.Visible = title2.Visible =  true;
                descriptionbox.Visible = descriptionbox2.Visible =  des1.Visible = des2.Visible  = true;
                URLBox.Visible = URLBox2.Visible  = url1.Visible = url2.Visible  = true;
                stageidbox.Visible = stageidbox2.Visible = stageid1.Visible = stageid2.Visible = true;
                titlebox4.Visible = descriptionbox4.Visible = URLBox4.Visible = stageidbox4.Visible = title4.Visible = des4.Visible = url4.Visible = stageid4.Visible = false;
                titlebox3.Visible = descriptionbox3.Visible = URLBox3.Visible = stageidbox3.Visible = title3.Visible = des3.Visible = url3.Visible = stageid3.Visible = false;
                Button1.Visible = Button2.Visible = true;


                titlebox.Visible = titlebox2.Visible = true;
                descriptionbox.Visible = descriptionbox2.Visible =  true;
                URLBox.Visible = URLBox2.Visible =  true;
                stageidbox.Visible = stageidbox2.Visible =  true;
                titlebox4.Visible = descriptionbox4.Visible = URLBox4.Visible = stageidbox4.Visible = false;
                titlebox3.Visible = descriptionbox3.Visible = URLBox3.Visible = stageidbox3.Visible = false;


                //first video

                titlebox.Text = dt.Rows[0][1].ToString();
                descriptionbox.Value = dt.Rows[0][2].ToString();
                URLBox.Text = dt.Rows[0][3].ToString();
                stageidbox.Text = dt.Rows[0][4].ToString();
                TextBox1.Text = dt.Rows[0][0].ToString();

                //second video 
                titlebox2.Text = dt.Rows[1][1].ToString();
                descriptionbox2.Value = dt.Rows[1][2].ToString();
                URLBox2.Text = dt.Rows[1][3].ToString();
                stageidbox2.Text = dt.Rows[1][4].ToString();
                TextBox2.Text = dt.Rows[1][0].ToString();
            }
            else
            {
                titlebox.Visible = title1.Visible  = true;
                descriptionbox.Visible =  des1.Visible =  true;
                URLBox.Visible =  url1.Visible  = true;
                stageidbox.Visible =  stageid1.Visible = true;
                titlebox4.Visible = descriptionbox4.Visible = URLBox4.Visible = stageidbox4.Visible = title4.Visible = des4.Visible = url4.Visible = stageid4.Visible = false;
                titlebox3.Visible = descriptionbox3.Visible = URLBox3.Visible = stageidbox3.Visible = title3.Visible = des3.Visible = url3.Visible = stageid3.Visible = false;
                titlebox2.Visible = descriptionbox2.Visible = URLBox2.Visible = stageidbox2.Visible = title2.Visible = des2.Visible = url2.Visible = stageid2.Visible = false;
                Button2.Visible = false;

                titlebox.Text = dt.Rows[0][1].ToString();
                descriptionbox.Value = dt.Rows[0][2].ToString();
                URLBox.Text = dt.Rows[0][3].ToString();
                stageidbox.Text = dt.Rows[0][4].ToString();
                TextBox1.Text = dt.Rows[0][0].ToString();
            }
                

            





        }

        protected void updatebutton_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();

            // Assuming you have a hidden field or some mechanism to store the videoID for each set of boxes
            UpdateVideo(con, titlebox.Text, descriptionbox.Value, URLBox.Text,TextBox1.Text, stageidbox.Text);
            UpdateVideo(con, titlebox2.Text, descriptionbox2.Value, URLBox2.Text, TextBox2.Text, stageidbox2.Text);
            UpdateVideo(con, titlebox3.Text, descriptionbox3.Value, URLBox3.Text, TextBox3.Text, stageidbox3.Text);
            UpdateVideo(con, titlebox4.Text, descriptionbox4.Value, URLBox4.Text, TextBox4.Text, stageidbox4.Text);

            con.Close();
            Response.Redirect("Admin_Video_Page.aspx");

        }

        private void UpdateVideo(SqlConnection con, string title, string description, string url, string videoID, string stageId)
        {
            string updateQuery = "UPDATE videoTable SET title = @title, description = @description, url = @url , stageId = @stageid WHERE vidID = @videoID";

            using (SqlCommand cmd = new SqlCommand(updateQuery, con))
            {
                cmd.Parameters.AddWithValue("@title", title);
                cmd.Parameters.AddWithValue("@description", description);
                cmd.Parameters.AddWithValue("@url", url);
                cmd.Parameters.AddWithValue("@stageid" ,stageId);
                cmd.Parameters.AddWithValue("@videoID", videoID);

                cmd.ExecuteNonQuery();
                
            }
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                string videoID = TextBox1.Text;
                con.Open();
                string deleteQuery = "DELETE FROM videoTable WHERE vidID = @videoID";

                using (SqlCommand cmd = new SqlCommand(deleteQuery, con))
                {
                    cmd.Parameters.AddWithValue("@videoID", videoID);
                    cmd.ExecuteNonQuery();
                    Response.Redirect("Admin_Video_page.aspx");
                }
            }
            
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                string videoID = TextBox2.Text;
                con.Open();
                string deleteQuery = "DELETE FROM videoTable WHERE vidID = @videoID";

                using (SqlCommand cmd = new SqlCommand(deleteQuery, con))
                {
                    cmd.Parameters.AddWithValue("@videoID", videoID);
                    cmd.ExecuteNonQuery();
                    Response.Redirect("Admin_Video_page.aspx");
                }
            }
            
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                string videoID = TextBox3.Text;
                con.Open();
                string deleteQuery = "DELETE FROM videoTable WHERE vidID = @videoID";

                using (SqlCommand cmd = new SqlCommand(deleteQuery, con))
                {
                    cmd.Parameters.AddWithValue("@videoID", videoID);
                    cmd.ExecuteNonQuery();
                    Response.Redirect("Admin_Video_page.aspx");
                }
            }
            
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                string videoID = TextBox4.Text;
                con.Open();
                string deleteQuery = "DELETE FROM videoTable WHERE vidID = @videoID";

                using (SqlCommand cmd = new SqlCommand(deleteQuery, con))
                {
                    cmd.Parameters.AddWithValue("@videoID", videoID);
                    cmd.ExecuteNonQuery();
                    Response.Redirect("Admin_Video_page.aspx");
                }
            }
            
        }
    }
    }

