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
    public partial class Supplier : System.Web.UI.Page
    {
        string connection = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            SupplierGridView.DataBind();
        }

        protected void addSuplierBtn_Click(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(txtSupId.Text) ||
               String.IsNullOrEmpty(txtSupName.Text))
            {
                Response.Write("<script>alert('One or more field is empty');</script>");
            }
            else
            {
                if (supplierIdExist())
                {
                    Response.Write("<script>alert('Supplier Id exits, provide unique Supplier id');</script>");
                }
                else
                {
                    addSupplier();
                }

            }
        }
        bool supplierIdExist()
        {
            try
            {
                SqlConnection con = new SqlConnection(connection);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from supplier where supplier_id='" + txtSupId.Text.Trim() + "'", con);

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
                Response.Write("<script>alert('Supplier updated Successful ');</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }
        void addSupplier()
        {
            try
            {
                SqlConnection con = new SqlConnection(connection);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO supplier (supplier_id, supplier_name) VALUES(@id, @name )", con);

                cmd.Parameters.AddWithValue("@id", txtSupId.Text.Trim());
                cmd.Parameters.AddWithValue("@name", txtSupName.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Supplier added successfully');</script>");
                txtSupId.Text = "";
                txtSupName.Text = "";
                SupplierGridView.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void getSupUpdateData()
        {
            try
            {
                SqlConnection con = new SqlConnection(connection);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from supplier where supplier_id='" + txtSupId.Text.Trim() + "'", con);

                SqlDataAdapter adpter = new SqlDataAdapter(cmd);

                DataTable datab = new DataTable();
                adpter.Fill(datab);

                if (datab.Rows.Count > 0)
                {

                    txtSupId.Text = datab.Rows[0][0].ToString();

                    txtSupName.Text = datab.Rows[0][1].ToString();
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
        protected void updateSupplierBtn_Click(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(txtSupId.Text) ||
               String.IsNullOrEmpty(txtSupName.Text))
            {
                Response.Write("<script>alert('One or more Fields are empty');</script>");
            }
            else
            {
                if (supplierIdExist())
                {
                    updateSupplier();

                }
                else
                {
                    //addUser();
                    Response.Write("<script>alert('Supplier Id does not exist, provide unique supplier id');</script>");
                }
            }
        }
        void updateSupplier()
        {
            try
            {
                SqlConnection con = new SqlConnection(connection);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE supplier " +

                    "SET  supplier_name=@name WHERE supplier_id=@id ", con);

                cmd.Parameters.AddWithValue("@id", txtSupId.Text.Trim());
                cmd.Parameters.AddWithValue("@name", txtSupName.Text.Trim());

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Supplier Update Successful.');</script>");
                txtSupId.Text = "";
                txtSupName.Text = "";
                SupplierGridView.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void LoadSupData_Click(object sender, EventArgs e)
        {
            if (supplierIdExist())
            {
                getSupUpdateData();

            }
            else
            {
                Response.Write("<script>alert('Category Id does not exits, provide unique Category id');</script>");
            }
        }

        protected void deleteSupplierBtn_Click(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(txtSupId.Text) ||
               String.IsNullOrEmpty(txtSupName.Text))
            {
                Response.Write("<script>alert('One or more Fields are empty');</script>");
            }
            else
            {
                if (supplierIdExist())
                {
                    deletesupplier();

                }
                else
                {
                    //addUser();
                    Response.Write("<script>alert('Supplier Id does not exist, provide unique supplier id');</script>");
                }
            }
        }
        void deletesupplier() //deleting supplier
        {
            try
            {
                SqlConnection con = new SqlConnection(connection);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("DELETE FROM supplier WHERE supplier_id=@id", con);

                cmd.Parameters.AddWithValue("@id", txtSupId.Text.Trim());


                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Supplier Delete Successful.');</script>");
                txtSupId.Text = "";
                txtSupName.Text = "";
                SupplierGridView.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}