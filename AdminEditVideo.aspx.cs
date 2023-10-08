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

namespace Assignment
{
    public partial class AdminEditVideo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();
            if(!Page.IsPostBack)
            {
                SqlDataAdapter da = new SqlDataAdapter("Select * from videoTable where stageId = '" + DropDownList1 + "'", con);
                DataTable dt = new DataTable();
                DropDownList1.DataBind();
            }

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();

            

            SqlDataAdapter da = new SqlDataAdapter("Select * from videoTable where stageId ='" + DropDownList1.SelectedValue + "'", con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            //first video
            titlebox.Text = dt.Rows[0][1].ToString();
            descriptionbox.Value = dt.Rows[0][2].ToString();
            URLBox.Text = dt.Rows[0][3].ToString();
            stageidbox.Text = dt.Rows[0][4].ToString();

        }
    }
}