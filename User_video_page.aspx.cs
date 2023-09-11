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
    public partial class User_video_page : System.Web.UI.Page
    {



        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadVideos();
            }
        }



        public List<Video> GetVideosFromDatabase()
        {
            List<Video> videos = new List<Video>();



            try
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                con.Open();
                string query = "SELECT codeName, URL FROM stageTable";
                SqlCommand cmd = new SqlCommand(query, con);



                SqlDataReader reader = cmd.ExecuteReader();




                while (reader.Read())
                {
                    Video video = new Video
                    {
                        codeName = reader["codeName"].ToString(),
                        URL = reader["URL"].ToString(),
                    };
                    videos.Add(video);
                }



                reader.Close();
                con.Close();
            }
            catch (Exception ex)
            {
                // Handle exceptions
            }



            return videos;
        }



        private void LoadVideos()
        {
            List<Video> videos = GetVideosFromDatabase();



            foreach (Video video in videos)
            {
                string codeName = video.codeName;
                string url = video.URL;
                string script = $"loadYouTubeVideo('{codeName}', '{url}');"; // Change this line
                ScriptManager.RegisterStartupScript(this, GetType(), "addVideoScript", script, true);
            }
        }





        public string GetYouTubeVideoId(string url)
        {
            var uri = new Uri(url);
            var query = uri.Query;



            if (query.Contains("v="))
            {
                var videoIdIndex = query.IndexOf("v=") + 2;
                var videoId = query.Substring(videoIdIndex);
                return videoId;
            }



            return null;
        }



        public class Video
        {
            public string codeName { get; set; }
            public string URL { get; set; }
        }
    }
}