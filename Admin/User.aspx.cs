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
    public partial class User : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                Session["Breadcrum"] = "customer";
                getUser();
            }

        }

        private void getUser()
        {
            con = new SqlConnection(Connection.GetConnectionString());
            cmd = new SqlCommand("customer_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "Select4Admin");
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            rUser.DataSource = dt;
            rUser.DataBind();
        }
        protected void rUser_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            con = new SqlConnection(Connection.GetConnectionString());
            cmd = new SqlCommand("customer_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "Delete");
            cmd.Parameters.AddWithValue("@UserId", e.CommandArgument);
            cmd.CommandType=CommandType.StoredProcedure;

            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                lblMsg.Visible = true;
                lblMsg.Text = "User Deleted Successfully !";
                lblMsg.CssClass = "alert alert-success";
                getUser();
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

        protected void rUser_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

        }
    }
}