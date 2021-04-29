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
            userData.DataBind();
        }

        protected void TextBox7_TextChanged(object sender, EventArgs e)
        {
            
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (checkEmptyFields())
            {
                Response.Write("<script>alert('One or more Fields are empty');</script>");
            }
            else
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
        void getUpdateData()
        {
            try
            {
                SqlConnection con = new SqlConnection(connection);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from users where id='" + TxtuserID.Text.Trim() + "'", con);

                SqlDataAdapter adpter = new SqlDataAdapter(cmd);

                DataTable datab = new DataTable();
                adpter.Fill(datab);

                if (datab.Rows.Count > 0)
                {
                     
                    txtusername.Text = datab.Rows[0][1].ToString();
                     
                    txtPhone.Text = datab.Rows[0][2].ToString();
                    txtaddress.Text = datab.Rows[0][4].ToString();
                    txtemail.Text = datab.Rows[0][3].ToString();
                }
                else
                {
                    Response.Write("<script>alert('Invilad ID);</script>");
                }
                con.Close();
                
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
             
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
                Response.Write("<script>alert('User added successfully');</script>");
                filedClear();
                userData.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            getUpdateData();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            if (checkEmptyFields())
            {
                Response.Write("<script>alert('One or more Fields are empty');</script>");
            }
            else
            {
                if (userIdExist())
                {
                    updateUser();

                }
                else
                {
                    //addUser();
                    Response.Write("<script>alert('User Id does not exist, provide unique user id');</script>");
                }
            }
            

        }
        void updateUser()
        {
            try
            {
                SqlConnection con = new SqlConnection(connection);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE users " +
                    "SET  name=@name,phone=@phone  ,email=@email ,address=@address ,password=@password ,user_type=@user_type WHERE id=@id ", con);

                cmd.Parameters.AddWithValue("@id", TxtuserID.Text.Trim());
                cmd.Parameters.AddWithValue("@name", txtusername.Text.Trim());
                cmd.Parameters.AddWithValue("@phone", txtPhone.Text.Trim());
                cmd.Parameters.AddWithValue("@email", txtemail.Text.Trim());
                cmd.Parameters.AddWithValue("@address", txtaddress.Text.Trim());
                cmd.Parameters.AddWithValue("@password", txtpswd.Text.Trim());
                cmd.Parameters.AddWithValue("@user_type", DrpDwnUserType.SelectedItem.Value);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('User Update Successful.');</script>");
                filedClear();
                userData.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void delBtn_Click(object sender, EventArgs e)
        {
            if (checkEmptyFields())
            {
                Response.Write("<script>alert('One or more Fields are empty');</script>");
            }
            else
            {
                if (userIdExist())
                {
                    deleteUser();

                }
                else
                {
                    //addUser();
                    Response.Write("<script>alert('User Id does not exist, provide unique user id');</script>");
                }
            }
            
        }
        void deleteUser()
        {
            try
            {
                SqlConnection con = new SqlConnection(connection);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("DELETE FROM users WHERE id=@id", con);

                cmd.Parameters.AddWithValue("@id", TxtuserID.Text.Trim());
 

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('User Delete Successful.');</script>");
                filedClear();
                userData.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        void filedClear()
        {
            TxtuserID.Text = "";
            txtusername.Text = "";
            txtpswd.Text = "";
            txtPhone.Text = "";
            txtaddress.Text = "";
            txtemail.Text = "";
        }
        bool checkEmptyFields()
        {
            if (String.IsNullOrEmpty(TxtuserID.Text) ||
                String.IsNullOrEmpty(txtusername.Text) ||
                String.IsNullOrEmpty(txtpswd.Text) ||
                String.IsNullOrEmpty(txtPhone.Text) ||
                String.IsNullOrEmpty(txtaddress.Text) ||
                String.IsNullOrEmpty(txtemail.Text))
            {
                return true;
            }
            return false;
        }
    }
}