using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Text.RegularExpressions;

namespace LinkSharing
{
    public partial class Public_Links : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null || Session["isPublic"] == null )
            {
                Response.Redirect("Login.aspx");
            }
            /*
            GridView1.Columns[0].Visible = false;
            //GridView1.Columns[1].Visible = false;
            //GridView1.Columns[2].Visible = false;
            GridView1.Columns[3].Visible = false;
            //GridView1.Columns[4].Visible = false;
            GridView1.Columns[5].Visible = false;
            */
            bindGrid();
        }

        protected void bindGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["UserConnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = "SELECT Urls.Id, Category.Name AS Category, Urls.Name AS Name, Urls.Link, Urls.Description FROM Urls INNER JOIN Category ON Urls.Cid = Category.Id where Urls.name like '%' + @name + '%' and Urls.isPublic=1";
                    cmd.Connection = con;
                    if(txtSearch.Text.Length == 0)
                    {
                        cmd.CommandText = "SELECT Urls.Id, Category.Name AS Category, Urls.Name AS Name, Urls.Link, Urls.Description FROM Urls INNER JOIN Category ON Urls.Cid = Category.Id where Urls.isPublic=1";
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@name", txtSearch.Text.Trim());
                    }
                    DataTable dt = new DataTable();
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        sda.Fill(dt);
                        gvSearch.DataSource = dt;
                        gvSearch.DataBind();
                    }
                }
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            bindGrid();
        }
        protected void logout_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }
    }
}