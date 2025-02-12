using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace brensden.user
{
    public partial class propertyDetails : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Get propertyId from query string
                string propertyId = Request.QueryString["propertyId"];

                if (!string.IsNullOrEmpty(propertyId))
                {;
                    // Fetch property details from the database based on propertyId
                    PopulatePropertyDetails(Convert.ToInt32(propertyId));
                }
                else
                {
                    // Handle case where propertyId is not provided
                    // Redirect to an error page or take appropriate action
                    Response.Redirect("error.aspx");
                }
            }
        }

      /*  private void getProperty()
        {
            con = new SqlConnection(Connection.GetConnectionString());
            cmd = new SqlCommand("Apartment_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "Select4Details");
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            DataBind();
        }*/

        private void PopulatePropertyDetails(int propertyId)
        {
            try
            {
                con = new SqlConnection(Connection.GetConnectionString());
                cmd = new SqlCommand("Apartment_Crud", con);
                cmd.Parameters.AddWithValue("@Action", "Select4Details");
                cmd.Parameters.AddWithValue("@ApartmentId", propertyId); // Add parameter for propertyId
                cmd.CommandType = CommandType.StoredProcedure;
                sda = new SqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    // Populate UI controls with the fetched data
                    lblBuildingName.Text = dt.Rows[0]["ap_building_name"].ToString();
                    lblNumBedrooms.Text = dt.Rows[0]["ap_num_bedrooms"].ToString();
                    lblNumBathrooms.Text = dt.Rows[0]["ap_num_bathrooms"].ToString();
                    lblNumParkings.Text = dt.Rows[0]["ap_num_parkings"].ToString();
                    lblSquareFeet.Text = dt.Rows[0]["ap_square_feet"].ToString();
                    lblUploadType.Text = dt.Rows[0]["ap_upload_type"].ToString();
                    lblLocation.Text = dt.Rows[0]["ap_location"].ToString();
                    lblRentAmount.Text = dt.Rows[0]["ap_rent_amount"].ToString();
                    lblDescription.Text = dt.Rows[0]["ap_des"].ToString();

                    DataBind();
                }
                else
                {
                    // Handle case where property details are not found
                    Response.Redirect("error.aspx");
                }
            }catch (Exception ex)
            {
                Response.Redirect("error.aspx");
            }
        }

    }
}