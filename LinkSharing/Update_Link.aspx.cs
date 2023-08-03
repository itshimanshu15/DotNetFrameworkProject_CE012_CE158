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
    public partial class Update_Link : System.Web.UI.Page
    {
        int uid;
        int cid = -1;
        int id;
        String name;
        String url;
        String description;
        Boolean isPublic;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["id"] == null || Session["isPublic"] != null )
            {
                Response.Redirect("Login.aspx");
            }
            uid = Convert.ToInt32(Session["id"].ToString());


            if (!Page.IsPostBack)
            {
                id =  Convert.ToInt32(Request.Form.Get("UrlId"));
                hf_urlid.Value = id.ToString();

                //Response.Write(id);
                string constr = ConfigurationManager.ConnectionStrings["UserConnection"].ConnectionString;
                SqlConnection con = new SqlConnection(constr);
                con.Open();

                SqlCommand com = new SqlCommand($"select * from urls where Id = {Convert.ToInt32(id)}", con);
                // table name   
                SqlDataAdapter da = new SqlDataAdapter(com);
                DataSet ds = new DataSet();
                da.Fill(ds);  // fill dataset  

                 cid = Convert.ToInt32(ds.Tables[0].Rows[0]["cid"]);
                 id = Convert.ToInt32(ds.Tables[0].Rows[0]["id"]);
                //Response.Write(id);
                name = Convert.ToString(ds.Tables[0].Rows[0]["name"]);
                 url = Convert.ToString(ds.Tables[0].Rows[0]["link"]);
                 description = Convert.ToString(ds.Tables[0].Rows[0]["description"]);
                 isPublic = Convert.ToBoolean(ds.Tables[0].Rows[0]["IsPublic"]);

                txt_lname.Text = name;
                txt_link.Text = url;
                txt_description.Text = description;
                ckbox_ispublic.Checked = isPublic;

                com = new SqlCommand("select * from category", con);
                // table name   
                da = new SqlDataAdapter(com);
                ds = new DataSet();
                da.Fill(ds);  // fill dataset  
                DDList_category.DataTextField = ds.Tables[0].Columns["Name"].ToString(); // text field name of table dispalyed in dropdown       
                DDList_category.DataValueField = ds.Tables[0].Columns["Id"].ToString();
                // to retrive specific  textfield name   
                DDList_category.DataSource = ds.Tables[0];      //assigning datasource to the dropdownlist  
                DDList_category.DataBind();  //binding dropdownlist
                DDList_category.Items.Insert(0, new ListItem("Select", "NA"));
                DDList_category.SelectedValue = cid.ToString();
            }
        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["UserConnection"].ConnectionString;
            try
            {
                string query = "update Urls set name=@Name,Link=@Link,Description=@Description,IsPublic=@IsPublic,Cid=@Cid where Id=@Id";
                
                 name = txt_lname.Text;
                 url = txt_link.Text;
                 description = txt_description.Text;
                 isPublic = ckbox_ispublic.Checked;
                 id = Convert.ToInt32(hf_urlid.Value);
                 
                if (DDList_category.SelectedValue != "NA")
                {
                    cid = Convert.ToInt32(DDList_category.SelectedValue);
                }

                /*
                Response.Write(uid);
                Response.Write(name);
                Response.Write(url);
                Response.Write(description);
                Response.Write(isPublic);
                Response.Write(cid);
                Response.Write(id);
                */
                
                
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    if (cid == -1)
                    {
                        cmd.Parameters.AddWithValue("@Cid", DBNull.Value);
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@Cid", cid);
                    }
                    cmd.Parameters.AddWithValue("@Uid", Convert.ToInt64(uid));
                    cmd.Parameters.AddWithValue("@Id", id);
                    cmd.Parameters.AddWithValue("@Link", url);
                    cmd.Parameters.AddWithValue("@Name", name);
                    if(description == "")
                    {
                    cmd.Parameters.AddWithValue("@Description", DBNull.Value);
                    }
                    else
                    {
                    cmd.Parameters.AddWithValue("@Description", description);
                    }
                    cmd.Parameters.AddWithValue("@IsPublic", isPublic);
                    
                    cmd.Connection = con;
                    con.Open();
                    int result = cmd.ExecuteNonQuery();
                    con.Close();
                    /*
                    Response.Write("Link is updated successfully.");
                    Response.Write(result.ToString());

                    foreach (SqlParameter p in cmd.Parameters)
                    {
                        query = query.Replace(p.ParameterName, p.Value.ToString());
                    }
                    Response.Write(query);
                    */
                    Response.Redirect("Links.aspx");
                }
                
            }
            catch (Exception ex)
            {
                Response.Write("Errors: " + ex.Message);
                Response.Write("Errors: " + ex.StackTrace);
            }
        }

        protected void btn_delete_Click(object sender, EventArgs e)
        {

            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["UserConnection"].ConnectionString;
            try
            {
                string query = "Delete from [Urls] where [Id]=@Id";
                id = Convert.ToInt32(hf_urlid.Value);

                using (SqlCommand cmd = new SqlCommand(query))
                {
                    
                    //cmd.Parameters.AddWithValue("@Uid", Convert.ToInt64(uid));
                    cmd.Parameters.AddWithValue("@Id", id);
                    

                    cmd.Connection = con;
                    con.Open();
                    int result = cmd.ExecuteNonQuery();
                    con.Close();
                    /*
                    Response.Write("Link is deleted successfully.");
                    foreach (SqlParameter p in cmd.Parameters)
                    {
                        query = query.Replace(p.ParameterName, p.Value.ToString());
                    }
                    Response.Write(query);
                    */
                    Response.Redirect("Links.aspx");
                }

            }
            catch (Exception ex)
            {
                Response.Write("Errors: " + ex.Message);
                Response.Write("Errors: " + ex.StackTrace);
            }
        }
    }
}