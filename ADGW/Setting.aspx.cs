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
    public partial class Setting : System.Web.UI.Page
    {
        string connection = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void catAddBtn_Click(object sender, EventArgs e)
        {

        }

        protected void changePswdBtn_Click(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(txtChangePswd.Text) ||
               String.IsNullOrEmpty(txtConfirmPassword.Text))
            {
                Response.Write("<script>alert('One or more field is empty');</script>");
            }
            else
            {
                if (confirmPassword())
                {
                    changePassword();
                }
                else
                {
                  
                    Response.Write("<script>alert('Password doesnot match');</script>");
                }

            }
        }
        bool confirmPassword()
        {
            if(String.Equals(txtChangePswd.Text.Trim(), txtConfirmPassword.Text.Trim()))
            {
                return true;
            }
            return false;
        }
        void changePassword()
        {
            try
            {
                SqlConnection con = new SqlConnection(connection);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE users " +
                    "SET  password=@password WHERE id=@Session_id ", con);

                cmd.Parameters.AddWithValue("@Session_id", Session["userID"].ToString());
                cmd.Parameters.AddWithValue("@password", txtChangePswd.Text.Trim()); 


                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Password changed Successfully');</script>");
               // filedClear();
            
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            
        }
    }
}