using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ADGW
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        string connection = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(connection);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from users  where id='" + userNameTxt.Text.Trim() + "' AND password='" + pswdTxt.Text.Trim() + "' AND user_type='admin'", con);
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        //SESSION VARIABLES
                        //Response.Write("<script>alert('Welcome');</script>");
                        Response.Write("<script>alert('Login Success!');</script>");
                        Session["username"] = dr.GetValue(1).ToString();
                        Session["userID"] = dr.GetValue(0).ToString();
                        Session["role"] = "admin";

                    }
                    Response.Redirect("Home.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Invalid Credentials');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}