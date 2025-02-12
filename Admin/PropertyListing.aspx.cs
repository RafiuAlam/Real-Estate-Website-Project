using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace brensden.admin
{
    public partial class PropertyListing : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["Breadcrum"] = "APARTMENT";
                getProperty();
            }

        }

        private void getProperty()
        {
            con = new SqlConnection(Connection.GetConnectionString());
            cmd = new SqlCommand("Apartment_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "Select");
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            rBuy.DataSource = dt;
            rBuy.DataBind();
        }

        protected void rBuy_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            con = new SqlConnection(Connection.GetConnectionString());
            cmd = new SqlCommand("Apartment_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "Delete");
            cmd.Parameters.AddWithValue("@ap_id", e.CommandArgument);
            cmd.CommandType = CommandType.StoredProcedure;

            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                lblMsg.Visible = true;
                lblMsg.Text = "Property Deleted Successfully !";
                lblMsg.CssClass = "alert alert-success";
                getProperty();
            }
            catch (Exception ex)
            {
                lblMsg.Visible = true;
                lblMsg.Text = "Error -" + ex.Message;
                lblMsg.CssClass = "alert alert-danger";
            }
            finally
            {
                con.Close();
            }

        }

        protected void rBuy_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

        }
    }
}