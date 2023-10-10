using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class assessment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["userName"] != null)
                {
                    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                    con.Open();
                    string username = Session["userName"].ToString();
                    string query = "SELECT userID FROM userTable WHERE userName = username";
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataReader dr = cmd.ExecuteReader();

                    string tempUserID = "";

                    while (dr.Read())
                    {
                        tempUserID = dr["userID"].ToString().Trim();
                    }
                    Session["userID"] = tempUserID;
                    Response.Write("This is the user ID: " + Session["userID"]);
                    Response.Write("  |  ");
                    Response.Write("This is the username: " + username);
                    Response.Write("  |  ");
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }

                if (Session["stageId"] != null && int.TryParse(Session["stageId"].ToString(), out int stageId))
                {
                    getTitle(stageId);

                    Response.Write("This is the stage ID for this assessment: " + Session["stageId"]);
                }
                else
                {
                    
                }
            }
        }

        protected void getTitle(int stageId)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                con.Open();
                string query = "SELECT * FROM assessmentTable WHERE stageId = @stageId";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@stageId", stageId);
                    SqlDataReader reader = cmd.ExecuteReader();
                    for(int i = 0; i < 5; i++) {
                        if (reader.Read())
                        {
                            if (reader["questionNum"].ToString() == "Question 1")
                            {
                                display.Text = "Assessment Name: " + reader["assessmentName"].ToString() + "<br />" +
                                               "Question Name: " + reader["questionName"].ToString();
                                quesNum.Text = reader["questionNum"].ToString();
                                RadioButton1.Text = (string)reader["option1"];
                                RadioButton2.Text = (string)reader["option2"];
                                RadioButton3.Text = (string)reader["option3"];
                                RadioButton4.Text = (string)reader["option4"];
                                
                            }

                            if (reader["questionNum"].ToString() == "Question 2")
                            {
                                quesNum0.Text = reader["questionNum"].ToString();
                                RadioButton5.Text = (string)reader["option1"];
                                RadioButton6.Text = (string)reader["option2"];
                                RadioButton7.Text = (string)reader["option3"];
                                RadioButton8.Text = (string)reader["option4"];
                            }

                            if (reader["questionNum"].ToString() == "Question 3")
                            {
                                quesNum1.Text = reader["questionNum"].ToString();
                                RadioButton9.Text = (string)reader["option1"];
                                RadioButton10.Text = (string)reader["option2"];
                                RadioButton11.Text = (string)reader["option3"];
                                RadioButton12.Text = (string)reader["option4"];
                            }

                            if (reader["questionNum"].ToString() == "Question 4")
                            {
                                quesNum2.Text = reader["questionNum"].ToString();
                                RadioButton13.Text = (string)reader["option1"];
                                RadioButton14.Text = (string)reader["option2"];
                                RadioButton15.Text = (string)reader["option3"];
                                RadioButton16.Text = (string)reader["option4"];
                            }
                        }
                    }
                    reader.Close();
                    con.Close();
                }
            }
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            
        }

        protected void allCorrect_Click(object sender, EventArgs e)
        {

        }
    }
}