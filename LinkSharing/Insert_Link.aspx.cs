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
    public partial class Insert_Link : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null || Session["isPublic"] != null )
            {
                Response.Redirect("Login.aspx");
            }

            if (!Page.IsPostBack)
            {
                string constr = ConfigurationManager.ConnectionStrings["UserConnection"].ConnectionString;
                SqlConnection con = new SqlConnection(constr);
                con.Open();

                SqlCommand com = new SqlCommand("select * from category", con);
                // table name   
                SqlDataAdapter da = new SqlDataAdapter(com);
                DataSet ds = new DataSet();
                da.Fill(ds);  // fill dataset  
                DDList_category.DataTextField = ds.Tables[0].Columns["Name"].ToString(); // text field name of table dispalyed in dropdown       
                DDList_category.DataValueField = ds.Tables[0].Columns["Id"].ToString();
                // to retrive specific  textfield name   
                DDList_category.DataSource = ds.Tables[0];      //assigning datasource to the dropdownlist  
                DDList_category.DataBind();  //binding dropdownlist
                DDList_category.Items.Insert(0, new ListItem("Select", "NA"));
            }
            

        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["UserConnection"].ConnectionString;
            try
            {
                string query = "INSERT INTO Urls (Uid,Cid,Link,Name,Description,IsPublic) VALUES(@Uid,@Cid,@Link,@Name,@Description,@IsPublic)";
                String lname = txt_lname.Text;
                String link = txt_link.Text;
                String description = txt_description.Text;
                Boolean isPublic = ckbox_ispublic.Checked;
                String uid = Session["id"].ToString();
                int cid = -1;
                if(DDList_category.SelectedValue != "NA")
                {
                    cid = Convert.ToInt32(DDList_category.SelectedValue);
                }

                /*
                Response.Write(uid);
                Response.Write(lname);
                Response.Write(link);
                Response.Write(description);
                Response.Write(isPublic);
                Response.Write(cid);
                */

                using (SqlCommand cmd = new SqlCommand(query))
                {
                    if(cid == -1)
                    {
                        cmd.Parameters.AddWithValue("@cid", DBNull.Value);
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@cid", cid);
                    }
                    cmd.Parameters.AddWithValue("@Uid", Convert.ToInt64(uid));
                    cmd.Parameters.AddWithValue("@Link", link);
                    cmd.Parameters.AddWithValue("@Name", lname);
                    cmd.Parameters.AddWithValue("@Description", description);
                    cmd.Parameters.AddWithValue("@IsPublic", isPublic);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    //Response.Write("Link is inserted successfully.");
                    Response.Redirect("Links.aspx");
               
                }

            }
            catch (Exception ex)
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