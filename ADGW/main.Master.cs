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
                    supplierBtn.Visible = false;
                    categoryBtn.Visible = false;
                    salesBtn.Visible = false;
                    settingBtn.Visible = false;
                    stockBtn.Visible = false;
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
                    supplierBtn.Visible = true;
                    categoryBtn.Visible = true;
                    salesBtn.Visible = true;
                    settingBtn.Visible = true;
                    stockBtn.Visible = true;
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
                    supplierBtn.Visible = true;
                    categoryBtn.Visible = true;
                    salesBtn.Visible = true;
                    settingBtn.Visible = false;
                    stockBtn.Visible = true;
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
            supplierBtn.Visible = false;
            categoryBtn.Visible = false;
            welcomeBtn.Visible = false;
            membmgmtBtm.Visible = false;
            inventoryBtn.Visible = false;
            usrMgmtbtn.Visible = false; //only for admin
            membmgmtBtm.Visible = false; //for employee and admin= false when no body is login  
            salesBtn.Visible = false;
            settingBtn.Visible = false;
            stockBtn.Visible = false;
            Response.Redirect("UserLogin.aspx");
        }

        protected void welcomeBtn_Click(object sender, EventArgs e)
        {

        }

        protected void adminLoginBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminLogin.aspx");
        }

        protected void supplier_Click(object sender, EventArgs e)
        {
            Response.Redirect("Supplier.aspx");
        }

        protected void categoryBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Category.aspx");
        }

        protected void salesBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Sales.aspx");
        }

        protected void settingBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Setting.aspx");
        }

        protected void stockBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Stock.aspx");
        }
    }
}