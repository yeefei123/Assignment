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
    public partial class Stage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                LoadStages();
                if (Session["userName"] != null)
                {
                    showName.Text = Session["userName"].ToString();
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
                    int IntSessionUserID = int.Parse(tempUserID);

                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
        private void LoadStages()
        {
            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                con.Open();
                string query = "SELECT stageId FROM stageTable";
                SqlCommand cmd = new SqlCommand(query, con);

                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    int stageId = Convert.ToInt32(reader["stageId"]);
                    Session["stageId"] = stageId;
                    // Create a new stage button
                    System.Web.UI.HtmlControls.HtmlGenericControl stageButton = new System.Web.UI.HtmlControls.HtmlGenericControl("div");
                    stageButton.Attributes.Add("class", "stage-button");
                    stageButton.Attributes.Add("onclick", $"selectStage({stageId})");
                    stageButton.InnerHtml = $"{stageId}";

                    // Add the stage button to the container
                    stage_selection_container.Controls.Add(stageButton);
                }

                reader.Close();
                con.Close();
            }
            catch (Exception)
            {
                // Handle exceptions
            }
        }

        protected void selectStage(int selectedStageId)
        {
            Response.Redirect($"Game.aspx?selectedStage={selectedStageId}");
            
        }



    }
}