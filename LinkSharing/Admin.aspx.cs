using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace LinkSharing
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            if (Session["isPublic"] != null)
            {
                Response.Redirect("Public_Links.aspx");
            }


            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["UserConnection"].ConnectionString;
            try
            {
                using (con)
                {
                    string command = "select * from Newuser";
                    SqlCommand cmd = new SqlCommand(command, con);
                    con.Open();
                    SqlDataReader rdr = cmd.ExecuteReader();
                    GridView1.DataSource = rdr;
                    GridView1.DataBind();
                    rdr.Close();


                    string str = "select * from Category";
                    SqlDataAdapter adp = new SqlDataAdapter(str, con);
                    DataSet set1 = new DataSet();
                    adp.Fill(set1);
                    GridView2.DataSource = set1.Tables[0];
                    GridView2.DataBind();

                    string str1 = "select * from Urls";
                    SqlDataAdapter adp1 = new SqlDataAdapter(str1, con);
                    DataSet set2 = new DataSet();
                    adp1.Fill(set2);
                    GridView3.DataSource = set2.Tables[0];
                    GridView3.DataBind();

                }
            }
            catch (Exception ex)
            {
                Response.Write("Errors: " + ex.Message);
            }
            GridView1.Columns[4].Visible = false;
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }
    }
}