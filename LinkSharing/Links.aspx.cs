using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections.Specialized;
using System.Text;

namespace LinkSharing
{
    public partial class Links : System.Web.UI.Page
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

            GridView1.Columns[0].Visible = false;
           //GridView1.Columns[1].Visible = false;
            GridView1.Columns[2].Visible = false;
            //GridView1.Columns[3].Visible = false;
           //GridView1.Columns[4].Visible = false;
            GridView1.Columns[5].Visible = false;
            GridView1.Columns[6].Visible = false;
            
        }



        protected void MyButtonClick(object sender, EventArgs e)
        {
            //Get the button that raised the event
            Button btn = (Button)sender;
           
            //Get the row that contains this button
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;
            NameValueCollection pair = new NameValueCollection();
            pair.Add("UrlId", btn.CommandArgument.ToString());

            //Response.Write(gvr.Cells[1].Text);

            switch (btn.CommandName)
            {
                case "ThisBtnClick":
                    //Response.Write(btn.CommandArgument.ToString());
                    RedirectWithData(pair, "Update_Link.aspx");
                    break;
                case "ThatBtnClick":
                    Response.Write(btn.CommandArgument.ToString());
                    break;
            }
        }
        public static void RedirectWithData(NameValueCollection data, string url)
        {
            HttpResponse response = HttpContext.Current.Response;
            response.Clear();

            StringBuilder s = new StringBuilder();
            s.Append("<html>");
            s.AppendFormat("<body onload='document.forms[\"form\"].submit()'>");
            s.AppendFormat("<form name='form' action='{0}' method='post'>", url);
            foreach (string key in data)
            {
                s.AppendFormat("<input type='hidden' name='{0}' value='{1}' />", key, data[key]);
            }
            s.Append("</form></body></html>");
            response.Write(s.ToString());
            HttpContext.Current.ApplicationInstance.CompleteRequest();
            //response.End();
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }
    } 
}