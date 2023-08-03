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
    
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] != null)
            {
                Response.Redirect("index.aspx");
            }
            if (Session["isPublic"] != null)
            {
                Response.Redirect("Public_Links.aspx");
            }
        }
       
        protected void Button_login_Click(object sender, EventArgs e)
        {
            string mainconn = ConfigurationManager.ConnectionStrings["UserConnection"].ConnectionString;
            SqlConnection sqlconn = new SqlConnection(mainconn);
            SqlCommand sqlcomm = new SqlCommand("select * from Newuser where email=@email and password=@password",sqlconn);
            if (Lu_pswd.Text == "")
            {
                sqlcomm = new SqlCommand("select * from Newuser where email=@email", sqlconn);
            }
            else
            {
                sqlcomm.Parameters.AddWithValue("password", Lu_pswd.Text);
            }
            sqlcomm.Parameters.AddWithValue("email", Lu_email.Text);
            SqlDataAdapter sda = new SqlDataAdapter(sqlcomm);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            

            sqlconn.Open();
            sqlcomm.ExecuteNonQuery();
            sqlconn.Close();
            if (dt.Rows.Count > 0)
            {
                DataRow dr = dt.Rows[0];
                int uid = dr.Field<int>("Uid");

                //Session["id"] = Lu_email.Text;
                Session["id"] = uid;
                if (Lu_pswd.Text.Length == 0)
                {
                    Session["isPublic"] = true;
                    Response.Redirect("Public_Links.aspx");
                }
                else if(Lu_email.Text == "admin@gmail.com" && Lu_pswd.Text == "admin123")
                {
                    Response.Redirect("Admin.aspx");
                }
                else
                {
                    Response.Redirect("Index.aspx");
                }
                Session.RemoveAll();
            }
            
            else
            {
                Response.Write("<script>alert('Wrong Username & Password !')</script>");
            }


        }

    }
}