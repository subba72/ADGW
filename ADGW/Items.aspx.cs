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
    public partial class Items : System.Web.UI.Page
    {
        string connection = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            itemGrid.DataBind();
            
        }


        protected void itemLoad_Click(object sender, EventArgs e)
        {
            if (itemIdExist())
            {
                getItemUpdateData();

            }
            else
            {
                Response.Write("<script>alert('Item Id does not exits, provide unique Item id');</script>");
            }
        }
        void getItemUpdateData()
        {
            try
            {
                SqlConnection con = new SqlConnection(connection);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from items where id='" + txtitemID.Text.Trim() + "'", con);

                SqlDataAdapter adpter = new SqlDataAdapter(cmd);

                DataTable datab = new DataTable();
                adpter.Fill(datab);

                if (datab.Rows.Count > 0)
                {

                    txtitemID.Text = datab.Rows[0][0].ToString();

                    txtItemName.Text = datab.Rows[0][1].ToString();

                    txtItemQuantity.Text = datab.Rows[0][2].ToString();
                    txtPrice.Text = datab.Rows[0][4].ToString();
                    txtDescr.Text = datab.Rows[0][3].ToString();
                    txtMdate.Text = datab.Rows[0][6].ToString();
                    txtEDate.Text = datab.Rows[0][7].ToString();
                    TxtPDate.Text = datab.Rows[0][5].ToString();
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
        void filedClear()
        {
            txtitemID.Text = "";
            txtItemName.Text = "";
            TxtPDate.Text = "";
            txtDescr.Text = "";
            txtEDate.Text = "";
            txtMdate.Text = "";
            txtItemQuantity.Text = "";
            txtPrice.Text = "";
        }

        protected void addBtn_Click(object sender, EventArgs e)
        {
            if (checkEmptyFields())
            {
                Response.Write("<script>alert('One or more Fields are empty');</script>");
            }
            else
            {
                if (itemIdExist())
                {
                    Response.Write("<script>alert('Item Id exits, provide unique user id');</script>");
                }
                else
                {
                    addItem();
                }
            }
        }
        void addItem()
        {
            try
            {
                SqlConnection con = new SqlConnection(connection);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO items" +
                    "(id, item_name,item_quantity  ,description ,price ,purchase_date ,manu_date,exp_date,category) " +
                    "VALUES(@id, @name,@quantity  ,@description ,@price ,@purchase_date ,@manu_date,@exp_date,@category)", con);

                cmd.Parameters.AddWithValue("@id", txtitemID.Text.Trim());
                cmd.Parameters.AddWithValue("@name", txtItemName.Text.Trim());
                cmd.Parameters.AddWithValue("@quantity", txtItemQuantity.Text.Trim());
                cmd.Parameters.AddWithValue("@description", txtDescr.Text.Trim());
                cmd.Parameters.AddWithValue("@price", txtPrice.Text.Trim());
                cmd.Parameters.AddWithValue("@purchase_date", TxtPDate.Text.Trim());
                cmd.Parameters.AddWithValue("@manu_date", txtMdate.Text.Trim());
                cmd.Parameters.AddWithValue("@exp_date", txtEDate.Text.Trim());
                cmd.Parameters.AddWithValue("@category", drpdownCat.SelectedItem.Value);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Items added successfully');</script>");
                //filedClear();
                itemGrid.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        protected void Button3_Click(object sender, EventArgs e)
        {
            if (checkEmptyFields())
            {
                Response.Write("<script>alert('One or more Fields are empty');</script>");
            }
            else
            {
                if (itemIdExist())
                {
                    updateItem();

                }
                else
                {
                    //addUser();
                    Response.Write("<script>alert('Item Id does not exist, provide Item user id');</script>");
                }
            }

        }
        void updateItem()
        {
            try
            {
                SqlConnection con = new SqlConnection(connection);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE items " +

                    "SET  item_name=@name,item_quantity=@item_quantity  ,description=@description ,price=@price ,purchase_date=@purchase_date, manu_date=@manu_date, exp_date=@exp_date, category=@category WHERE id=@id ", con);

                cmd.Parameters.AddWithValue("@id", txtitemID.Text.Trim());
                cmd.Parameters.AddWithValue("@name", txtItemName.Text.Trim());
                cmd.Parameters.AddWithValue("@item_quantity", txtItemQuantity.Text.Trim());
                cmd.Parameters.AddWithValue("@description", txtDescr.Text.Trim());
                cmd.Parameters.AddWithValue("@price", txtPrice.Text.Trim());
                cmd.Parameters.AddWithValue("@purchase_date", TxtPDate.Text.Trim());
                cmd.Parameters.AddWithValue("@manu_date", txtEDate.Text.Trim());
                cmd.Parameters.AddWithValue("@exp_date", txtMdate.Text.Trim());

                cmd.Parameters.AddWithValue("@category", drpdownCat.SelectedItem.Value);
                


                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Item Update Successful.');</script>");
                filedClear();
                itemGrid.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        protected void delBtn_Click(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(txtitemID.Text))
            {
                Response.Write("<script>alert('Input ID is Empty');</script>");
            }
            else
            {
                if (itemIdExist())
                {
                    deleteItem();

                }
                else
                {
                    //addUser();
                    Response.Write("<script>alert('Item Id does not exist, provide unique Item id');</script>");
                }
            }
        }
        void deleteItem()
        {
            try
            {
                SqlConnection con = new SqlConnection(connection);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("DELETE FROM items WHERE _id=@id", con);

                cmd.Parameters.AddWithValue("@id", txtitemID.Text.Trim());


                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Item Delete Successful.');</script>");
                filedClear();
                itemGrid.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        bool itemIdExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(connection);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from items where id='" + txtitemID.Text.Trim() + "'", con);

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
        bool checkEmptyFields()
        {
            if (String.IsNullOrEmpty(txtitemID.Text) ||
               String.IsNullOrEmpty(txtItemName.Text) ||
               String.IsNullOrEmpty(TxtPDate.Text) ||
               String.IsNullOrEmpty(txtEDate.Text) ||
               String.IsNullOrEmpty(txtMdate.Text) ||
                String.IsNullOrEmpty(txtPrice.Text) ||
               String.IsNullOrEmpty(txtDescr.Text) ||
               String.IsNullOrEmpty(txtItemQuantity.Text))
            {
                return true;
            }
            return false;
        }


    }
}