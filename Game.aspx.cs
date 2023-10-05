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
    public partial class Game : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                int stageId;
                if (int.TryParse(Request.QueryString["stage"], out stageId))
                {
                    getRandomWord(stageId);
                     codeLiteral.Attributes["style"] = "position: absolute; top: 400px;"; 
                }
                else
                {
                    Response.Redirect("Stage.aspx");
                }

            }
        }

        protected void getRandomWord(int stageId)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {
                    con.Open();
                    string query = "SELECT codeName FROM stageTable WHERE stageId = @stageId";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@stageId", stageId);

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            string codeName = reader["codeName"].ToString();
                            codeLiteral.InnerText = codeName; // Set the text of the codeLiteral control
                            hiddenCodeName.Value = codeName;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex.Message);
                
            }
        }




    }
}