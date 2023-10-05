using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class admin_ViewAllStage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!IsPostBack)
                {
                    DataTable userData = FetchUserDataFromDatabase();
                    userGridView.DataSource = userData;
                    userGridView.DataBind();

                    if (Session["userName"] != null)
                    {
                        Response.Write("Great");
                    }
                    else
                    {
                        Response.Redirect("Login.aspx");
                    }
                }
            }
        }
        private DataTable FetchUserDataFromDatabase()
        {
            string query = "SELECT * FROM stageTable";

            DataTable dataTable = new DataTable();

            using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    SqlDataAdapter adapter = new SqlDataAdapter(command);
                    adapter.Fill(dataTable);
                }
            }
            return dataTable;
        }

        protected void backBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin_Dashboard.aspx");
        }
    }
}