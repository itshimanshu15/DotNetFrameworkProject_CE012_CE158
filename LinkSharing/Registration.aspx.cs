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
    public partial class Registration : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["UserConnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if(con.State==ConnectionState.Open)
            {
                con.Close();
            }
            con.Open();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("insert into Newuser values('"+u_name.Text+"','"+u_email.Text+"','"+u_contact.Text+"','"+u_pswd.Text+"')",con);
            cmd.ExecuteNonQuery();

            u_name.Text = "";
            u_email.Text = "";
            u_contact.Text = "";
            u_pswd.Text = "";

            Response.Write("<script>alert('Your Registration is Successful.')</script>");
            
        }

        
    }
}