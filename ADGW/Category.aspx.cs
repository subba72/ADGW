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
    public partial class Category : System.Web.UI.Page
    {
        string connection = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            catGridView.DataBind();
        }

        protected void catAddBtn_Click(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(catIdTxt.Text) ||
                String.IsNullOrEmpty(catNameTxt.Text))
            {
                Response.Write("<script>alert('One or more field is empty');</script>");
            }
            else
            {
                if (categoryIdExist())
                {
                    Response.Write("<script>alert('Category Id exits, provide unique Category id');</script>");
                }
                else
                {
                    addCategory();
                }

            }
        }

        bool categoryIdExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(connection);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from category where category_id='" + catIdTxt.Text.Trim() + "'", con);

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
                //Response.Write("<script>alert('Sign Up Successful. Go to User Login to Login');</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }

        }


        void addCategory()
        {
            try
            {
                SqlConnection con = new SqlConnection(connection);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO category (category_id, name) VALUES(@cat_id, @cat_name )", con);

                cmd.Parameters.AddWithValue("@cat_id", catIdTxt.Text.Trim());
                cmd.Parameters.AddWithValue("@cat_name", catNameTxt.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Category added successfully');</script>");
                catIdTxt.Text = "";
                catNameTxt.Text = "";
                catGridView.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }


        protected void loadCategory_Click(object sender, EventArgs e)
        {
            if (catIdExist())
            {
                getCatUpdateData();

            }
            else
            {
                Response.Write("<script>alert('Category Id does not exits, provide unique Category id');</script>");
            }

        }
        void getCatUpdateData()
        {
            try
            {
                SqlConnection con = new SqlConnection(connection);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from category where category_id='" + catIdTxt.Text.Trim() + "'", con);

                SqlDataAdapter adpter = new SqlDataAdapter(cmd);

                DataTable datab = new DataTable();
                adpter.Fill(datab);

                if (datab.Rows.Count > 0)
                {

                    catIdTxt.Text = datab.Rows[0][0].ToString();

                    catNameTxt.Text = datab.Rows[0][1].ToString();
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
        bool catIdExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(connection);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from category where category_id='" + catIdTxt.Text.Trim() + "'", con);

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
                Response.Write("<script>alert('category updated Successful ');</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }

        protected void catDelBtn_Click(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(catIdTxt.Text) ||
                String.IsNullOrEmpty(catNameTxt.Text))
            {
                Response.Write("<script>alert('One or more Fields are empty');</script>");
            }
            else
            {
                if (catIdExist())
                {
                    deleteCategory();

                }
                else
                {
                    //addUser();
                    Response.Write("<script>alert('Category Id does not exist, provide unique catogery id');</script>");
                }
            }
        }
        void deleteCategory()
        {
            try
            {
                SqlConnection con = new SqlConnection(connection);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("DELETE FROM category WHERE category_id=@id", con);

                cmd.Parameters.AddWithValue("@id", catIdTxt.Text.Trim());


                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Item Delete Successful.');</script>");
                catIdTxt.Text = "";
                catNameTxt.Text = "";
                catGridView.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void catUpdateBtn_Click(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(catIdTxt.Text) ||
               String.IsNullOrEmpty(catNameTxt.Text))
            {
                Response.Write("<script>alert('One or more Fields are empty');</script>");
            }
            else
            {
                if (catIdExist())
                {
                    updateCategory();

                }
                else
                {
                    //addUser();
                    Response.Write("<script>alert('Category Id does not exist, provide unique catogery id');</script>");
                }
            }
        }
        void updateCategory()
        {
            try
            {
                SqlConnection con = new SqlConnection(connection);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE category " +

                    "SET  name=@name WHERE category_id=@id ", con);

                cmd.Parameters.AddWithValue("@id", catIdTxt.Text.Trim());
                cmd.Parameters.AddWithValue("@name", catNameTxt.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Category Update Successful.');</script>");
                catIdTxt.Text = "";
                catNameTxt.Text = "";
                catGridView.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }

        }
    }
}