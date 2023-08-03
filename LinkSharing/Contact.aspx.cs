using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LinkSharing
{
    public partial class Contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //if (Session["id"] == null)
            //{
            //    Response.Redirect("Login.aspx");
            //}
            //if (Session["isPublic"] != null)
            //{
            //    Response.Redirect("Public_Links.aspx");
            //}
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Session.Abandon();
            Response.Redirect("Login.aspx");

        }
    }
}