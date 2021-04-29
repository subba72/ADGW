using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ADGW
{
    public partial class main : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["role"]==null)
                {
                    loginBtn.Visible = true;
                    logoutBtn.Visible = false;
                    welcomeBtn.Visible = false;
                    membmgmtBtm.Visible = false;
                    inventoryBtn.Visible = false;
                    usrMgmtbtn.Visible = false; //only for admin
                    membmgmtBtm.Visible = false; //for employee and admin= false when no body is login  
                }
                else if (Session["role"].Equals("employee"))
                {
                    loginBtn.Visible = false;
                    logoutBtn.Visible = true;
                    welcomeBtn.Visible = true;
                    welcomeBtn.Text = "Welcome, "+Session["username"].ToString();
                    usrMgmtbtn.Visible = false; //only for admin
                    membmgmtBtm.Visible = true;
                    adminLoginBtn.Visible = false;
                    loginBtn.Visible = false;
                }
                else if (Session["role"].Equals("admin"))
                {
                    loginBtn.Visible = false;
                    logoutBtn.Visible = true;
                    welcomeBtn.Visible = true;
                    welcomeBtn.Text = "Welcome, " + Session["username"].ToString();
                    usrMgmtbtn.Visible = true; //only for admin
                    membmgmtBtm.Visible = true;
                    loginBtn.Visible = false;
                    adminLoginBtn.Visible = false;
                }

            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("items.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("AMemberManagement.aspx");
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect("AUserManagement.aspx");
        }

        protected void LinkButton7_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserLogin.aspx");
        }

        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            Response.Redirect("SignUp.aspx");
        }

        protected void logoutBtn_Click(object sender, EventArgs e)
        {
            Session["username"] = "";
            Session["userID"] = "";
            Session["role"] = null;

            loginBtn.Visible = true;
            logoutBtn.Visible = false;
            welcomeBtn.Visible = false;
            membmgmtBtm.Visible = false;
            inventoryBtn.Visible = false;
            usrMgmtbtn.Visible = false; //only for admin
            membmgmtBtm.Visible = false; //for employee and admin= false when no body is login  
            Response.Redirect("UserLogin.aspx");
        }

        protected void welcomeBtn_Click(object sender, EventArgs e)
        {

        }

        protected void adminLoginBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminLogin.aspx");
        }
    }
}