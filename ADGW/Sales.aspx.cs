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
    public partial class Sales : System.Web.UI.Page
    {
        string connection = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void saleLoad_Click(object sender, EventArgs e)
        {

        }

        protected void saleAddBtn_Click(object sender, EventArgs e)
        {

        }

        protected void searchItem_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(connection);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from items where id like '%'+@id +'%'", con);

                cmd.Parameters.AddWithValue("@id", txtItemID.Text.Trim());
                SqlDataAdapter adpter = new SqlDataAdapter(cmd);

                DataTable datab = new DataTable();
                adpter.Fill(datab);

                itemsearchRsult.DataSource = datab;
                itemsearchRsult.DataBind();
                con.Close();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }
    }
}