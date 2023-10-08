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
using System.Drawing;
using System.Reflection.Emit;



namespace Assignment
{
    public partial class Admin_video_page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {



            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();
            if (!IsPostBack)
            {



                SqlDataAdapter da = new SqlDataAdapter("Select * from videoTable where stageId = '" + DropDownList1 + "'", con);
                DataTable dt = new DataTable();
                DropDownList1.DataBind();
            }
        }



        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                con.Open();



                SqlCommand cmd = new SqlCommand("Select * from videoTable where stageId = @StageID", con);
                cmd.Parameters.AddWithValue("@StageID", DropDownList1.SelectedValue);



                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);



                int rowCount = dt.Rows.Count;



                if (rowCount >= 4)
                {
                    //make all the iframe and text visible
                    videoTitle1.Visible = videoIframe1.Visible = des1.Visible = true;
                    videoTitle2.Visible = videoIframe2.Visible = des2.Visible = true;
                    videoTitle3.Visible = videoIframe3.Visible = des3.Visible = true;
                    videoTitle4.Visible = videoIframe4.Visible = des4.Visible = true;



                    //retrieve video 
                    videoTitle1.Text = dt.Rows[0][1].ToString();
                    videoIframe1.Attributes["src"] = dt.Rows[0][3].ToString();
                    des1.Text = dt.Rows[0][2].ToString();
                    videoTitle2.Text = dt.Rows[1][1].ToString();
                    videoIframe2.Attributes["src"] = dt.Rows[1][3].ToString();
                    des2.Text = dt.Rows[1][2].ToString();
                    videoTitle3.Text = dt.Rows[2][1].ToString();
                    videoIframe3.Attributes["src"] = dt.Rows[2][3].ToString();
                    des3.Text = dt.Rows[2][2].ToString();
                    videoTitle4.Text = dt.Rows[3][1].ToString();
                    des4.Text = dt.Rows[3][2].ToString();
                    videoIframe4.Attributes["src"] = dt.Rows[3][3].ToString();
                }
                else if (rowCount == 3)
                {
                    videoTitle1.Visible = videoIframe1.Visible = des1.Visible = true;
                    videoTitle2.Visible = videoIframe2.Visible = des2.Visible = true;
                    videoTitle3.Visible = videoIframe3.Visible = des3.Visible = true;
                    //retrieve video
                    videoTitle1.Text = dt.Rows[0][1].ToString();
                    videoIframe1.Attributes["src"] = dt.Rows[0][3].ToString();
                    des1.Text = dt.Rows[0][2].ToString();
                    videoTitle2.Text = dt.Rows[1][1].ToString();
                    videoIframe2.Attributes["src"] = dt.Rows[1][3].ToString();
                    des2.Text = dt.Rows[1][2].ToString();
                    videoTitle3.Text = dt.Rows[2][1].ToString();
                    des3.Text = dt.Rows[2][2].ToString();
                    videoIframe3.Attributes["src"] = dt.Rows[2][3].ToString();



                    //other items make invisible 
                    videoTitle4.Visible = videoIframe4.Visible = des4.Visible = false;
                }
                else if (rowCount == 2)
                {



                    videoTitle1.Visible = videoIframe1.Visible = des1.Visible = true;
                    videoTitle2.Visible = videoIframe2.Visible = des2.Visible = true;
                    //retrieve video 
                    videoTitle1.Text = dt.Rows[0][1].ToString();
                    videoIframe1.Attributes["src"] = dt.Rows[0][3].ToString();
                    des1.Text = dt.Rows[0][2].ToString();
                    videoTitle2.Text = dt.Rows[1][1].ToString();
                    videoIframe2.Attributes["src"] = dt.Rows[1][3].ToString();
                    des2.Text = dt.Rows[1][2].ToString();
                    videoTitle4.Visible = videoIframe4.Visible = des4.Visible = false;
                    videoTitle3.Visible = videoIframe3.Visible = des3.Visible = false;
                }
                else
                {
                    videoTitle1.Visible = videoIframe1.Visible = des1.Visible = true;
                    videoTitle1.Text = dt.Rows[0][1].ToString();
                    videoIframe1.Attributes["src"] = dt.Rows[0][3].ToString();
                    des1.Text = dt.Rows[0][2].ToString();



                    videoTitle4.Visible = videoIframe4.Visible = des4.Visible = false;
                    videoTitle3.Visible = videoIframe3.Visible = des3.Visible = false;
                    videoTitle2.Visible = videoIframe2.Visible = des2.Visible = false;
                }
            }
        }

    }
}

