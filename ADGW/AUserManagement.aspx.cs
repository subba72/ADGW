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
    public partial class UserManagement : System.Web.UI.Page
    {
        //connection to database
        string connection = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void TextBox7_TextChanged(object sender, EventArgs e)
        {
            
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (userIdExist())
            {
                Response.Write("<script>alert('User Id exits, provide unique user id');</script>");
            }
            else
            {
                addUser();
            }
       
        }

        bool userIdExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(connection);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from users where id='"+TxtuserID.Text.Trim()+"'", con);

                SqlDataAdapter adpter = new SqlDataAdapter(cmd);

                DataTable datab = new DataTable();
                adpter.Fill(datab);

                if (datab.Rows.Count > 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
                con.Close();
                Response.Write("<script>alert('Sign Up Successful. Go to User Login to Login');</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
           
        }
        void addUser()
        {
            try
            {
                SqlConnection con = new SqlConnection(connection);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO users" +
                    "(id, name,phone  ,email ,address ,password ,user_type) " +
                    "VALUES(@id, @name,@phone  ,@email ,@address ,@password ,@user_type)", con);

                cmd.Parameters.AddWithValue("@id", TxtuserID.Text.Trim());
                cmd.Parameters.AddWithValue("@name", txtusername.Text.Trim());
                cmd.Parameters.AddWithValue("@phone", txtPhone.Text.Trim());
                cmd.Parameters.AddWithValue("@email", txtemail.Text.Trim());
                cmd.Parameters.AddWithValue("@address", txtaddress.Text.Trim());
                cmd.Parameters.AddWithValue("@password", txtpswd.Text.Trim());
                cmd.Parameters.AddWithValue("@user_type", DrpDwnUserType.SelectedItem.Value);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Sign Up Successful. Go to User Login to Login');</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}