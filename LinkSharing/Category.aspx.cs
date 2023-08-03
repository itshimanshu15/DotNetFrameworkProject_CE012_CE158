using System;
using System.Collections.Generic;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LinkSharing
{
    public partial class Category : System.Web.UI.Page
    {
        public string CofigurantionManager { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            gv_category.Columns[0].Visible = false;
            gv_category.Columns[1].Visible = false;
            if (Session["id"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            if (Session["isPublic"] != null)
            {
                Response.Redirect("Public_Links.aspx");
            }
        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["UserConnection"].ConnectionString;
            try
            {
                string query = "INSERT INTO Category (Name,Uid) VALUES(@Name,@Uid)";
                String category_txt = txt_cname.Text;
                txt_cname.Text = "";
                String uid = Session["id"].ToString();
                //Response.Write(category_txt);
                //Response.Write(uid);
                
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    //Response.Write(uid);
                    
                    cmd.Parameters.AddWithValue("@Name", category_txt);
                    cmd.Parameters.AddWithValue("@Uid", Convert.ToInt64(uid));
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    gv_category.DataBind();
                }
                
            }catch(Exception ex)
            {
                Response.Write("Errors: " + ex.Message);
                Response.Write("Errors: " + ex.StackTrace);
            }

        }

        protected void logout_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }
    }
}