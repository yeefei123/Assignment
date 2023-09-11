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

                    // Create a new stage button
                    System.Web.UI.HtmlControls.HtmlGenericControl stageButton = new System.Web.UI.HtmlControls.HtmlGenericControl("div");
                    stageButton.Attributes.Add("class", "stage-button");
                    stageButton.Attributes.Add("onclick", $"selectStage({stageId})");
                    stageButton.InnerHtml = $"{stageId}";

                }

                reader.Close();
                con.Close();
            }
            catch (Exception ex)
            {
                // Handle exceptions
            }
        }

        protected void selectStage(int selectedStageId)
        {
            Response.Redirect($"User_video_page.aspx?selectedStage={selectedStageId}");
        }


    }
}