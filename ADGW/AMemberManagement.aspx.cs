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
    public partial class MemberManagement : System.Web.UI.Page
    {
        //connection to database
        string connection = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            userGridView.DataBind(); ///refreshhing gridview

        }
        bool memIdExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(connection);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from customer where cust_id='" + MemIdTxt.Text.Trim() + "'", con);

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
                Response.Write("<script>alert('Member add Successful ');</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }

        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            //Response.Write("<script>alert('testing')</script>");
            if (checkEmptyFields())
            {
                Response.Write("<script>alert('One or more Fields are empty');</script>");
            }
            else
            {
                if (memIdExist())
                {
                    Response.Write("<script>alert('Member Id exits, provide unique Member id');</script>");
                }
                else
                {
                    addMember();
                }
            }

        }
        void addMember()
        {
            try
            {
                SqlConnection con = new SqlConnection(connection);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO customer" +
                    "(cust_id, name,phone  ,email ,address ,customer_type,user_id) " +
                    "VALUES(@id, @name,@phone  ,@email ,@address  ,@mem_type,@user_id)", con);

                cmd.Parameters.AddWithValue("@id", MemIdTxt.Text.Trim());
                cmd.Parameters.AddWithValue("@name", memNameTxt.Text.Trim());
                cmd.Parameters.AddWithValue("@phone", phoneTxt.Text.Trim());
                cmd.Parameters.AddWithValue("@email", emailTxt.Text.Trim());
                cmd.Parameters.AddWithValue("@address", addressTxt.Text.Trim());
               
                cmd.Parameters.AddWithValue("@mem_type", MemTypeDrpdwn.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@user_id", Session["userID"].ToString());

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Member added successfully');</script>");
                filedClear();
                userGridView.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        bool checkEmptyFields()
        {
            if (String.IsNullOrEmpty(MemIdTxt.Text) ||
                String.IsNullOrEmpty(memNameTxt.Text) ||
                String.IsNullOrEmpty(phoneTxt.Text) ||
                String.IsNullOrEmpty(emailTxt.Text) ||
                String.IsNullOrEmpty(addressTxt.Text)  )
            {
                return true;
            }
            return false;
        }

        protected void updateMem_Click(object sender, EventArgs e)
        {
            if (checkEmptyFields())
            {
                Response.Write("<script>alert('One or more Fields are empty');</script>");
            }
            else
            {
                if (memIdExist())
                {
                    updateMember();

                }
                else
                {
                    //addUser();
                    Response.Write("<script>alert('Member Id does not exist, provide unique user id');</script>");
                }
            }

        }
        void updateMember()
        {
            try
            {
                SqlConnection con = new SqlConnection(connection);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE customer " +
                    "SET  name=@name,phone=@phone  ,email=@email ,address=@address ,customer_type=@mem_type, user_id=@user_id WHERE cust_id=@id ", con);

                cmd.Parameters.AddWithValue("@id", MemIdTxt.Text.Trim());
                cmd.Parameters.AddWithValue("@name", memNameTxt.Text.Trim());
                cmd.Parameters.AddWithValue("@phone", phoneTxt.Text.Trim());
                cmd.Parameters.AddWithValue("@email", emailTxt.Text.Trim());
                cmd.Parameters.AddWithValue("@address", addressTxt.Text.Trim());

                cmd.Parameters.AddWithValue("@mem_type", MemTypeDrpdwn.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@user_id", Session["userID"].ToString());


                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Member Update Successful.');</script>");
               filedClear();
                userGridView.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
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
                SqlCommand cmd = new SqlCommand("SELECT * from customer where cust_id='" + MemIdTxt.Text.Trim() + "'", con);

                SqlDataAdapter adpter = new SqlDataAdapter(cmd);

                DataTable datab = new DataTable();
                adpter.Fill(datab);

                if (datab.Rows.Count > 0)
                {

                    memNameTxt.Text = datab.Rows[0][1].ToString();

                    addressTxt.Text = datab.Rows[0][2].ToString();
                    phoneTxt.Text = datab.Rows[0][4].ToString();
                    emailTxt.Text = datab.Rows[0][3].ToString();
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (memIdExist())
            {
                getUpdateData();
               
            }
            else
            {
                Response.Write("<script>alert('Member Id does not exits, provide unique Member id');</script>");
            }
           
        }

        protected void delMem_Click(object sender, EventArgs e)
        {
            if (checkEmptyFields())
            {
                Response.Write("<script>alert('One or more Fields are empty');</script>");
            }
            else
            {
                if (memIdExist())
                {
                    deleteMember();

                }
                else
                {
                    //addUser();
                    Response.Write("<script>alert('User Id does not exist, provide unique user id');</script>");
                }
            }
        }
        void deleteMember()
        {
            try
            {
                SqlConnection con = new SqlConnection(connection);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("DELETE FROM customer WHERE cust_id=@id", con);

                cmd.Parameters.AddWithValue("@id", MemIdTxt.Text.Trim());


                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Member Delete Successful.');</script>");
                filedClear();
                userGridView.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        void filedClear()
        {
            MemIdTxt.Text = "";
            MemIdTxt.Text = "";
            memNameTxt.Text = "";
            emailTxt.Text = "";
            phoneTxt.Text = "";
            addressTxt.Text = "";
            
        }
    }
}