using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using brensden.admin;

namespace brensden.user
{
    public partial class buy : System.Web.UI.Page
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
            

        }

        protected void rBuy_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

        }

        protected void Details_Click(object sender, EventArgs e)
        {
            Response.Redirect("propertyDetails.aspx");
        }
    }
}