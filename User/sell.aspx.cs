using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Diagnostics.Eventing.Reader;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices.ComTypes;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.Mime.MediaTypeNames;

namespace brensden.user
{
    public partial class sell : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void uploadPropertyButton_Click(object sender, EventArgs e)
        {
            string actionName = string.Empty, imagePath = string.Empty, fileExtension = string.Empty;
            bool isValidToExecute = false;
            int propertyId = Convert.ToInt32(hdnId.Value);
            con = new SqlConnection(Connection.GetConnectionString());
            cmd = new SqlCommand("Apartment_Crud", con);
            cmd.Parameters.AddWithValue("@Action", propertyId == 0 ? "INSERT" : "UPDATE");
            cmd.Parameters.AddWithValue("@Name", propertyName.Text.Trim());
            cmd.Parameters.AddWithValue("@Address", Location.Text.Trim());
            cmd.Parameters.AddWithValue("@Description", description.Text);
            cmd.Parameters.AddWithValue("@Price", priceTotal.Text.Trim());
            cmd.Parameters.AddWithValue("@Size", interiorArea.Text.Trim());
            cmd.Parameters.AddWithValue("@Bedrooms", bedroomsID.Text.Trim());
            cmd.Parameters.AddWithValue("@Bathrooms", bathroomsID.Text.Trim());
            cmd.Parameters.AddWithValue("@Parkings", parkingsID.Text.Trim());
            cmd.Parameters.AddWithValue("@UploadType", SelectUploadType.SelectedValue);


            if (fileUploadPropertyPicture.HasFile)
            {
                if (Utils.IsValidExtension(fileUploadPropertyPicture.FileName))
                {
                    Guid obj = Guid.NewGuid();
                    fileExtension = Path.GetExtension(fileUploadPropertyPicture.FileName);
                    imagePath = " Images/Property/" + obj.ToString() + fileExtension;
                    fileUploadPropertyPicture.PostedFile.SaveAs(Server.MapPath("~/Images/Property/") + obj.ToString() + fileExtension);
                    cmd.Parameters.AddWithValue("@ImageUrl_1", imagePath);
                }
                else
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "Please select .jpg, .jpeg or .png image";
                    lblMsg.CssClass = " alert alert-danger";
                    isValidToExecute = false;
                }
            }
            else
            {
                isValidToExecute = true;
            }
            if (isValidToExecute)
            {
                cmd.CommandType = CommandType.StoredProcedure;
                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    actionName = propertyId == 0 ? "Inserted" : "updated";
                    lblMsg.Visible = true;
                    lblMsg.Text = "Property " + actionName + " successfully !! ";
                    lblMsg.CssClass = "alert alert-success";
                    getProperty();
                    
                    
                    if(propertyId != 0)
                          {
                             Response.AddHeader("REFRESH", "1;URL=sell.aspx");

                          }
                    clear();
                }
                catch (Exception ex)
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "Error " + ex.Message;
                    lblMsg.CssClass = "alert alert-danger";
                }
                finally
                {
                    con.Close();
                }
            }

        }

        private void getProperty()
        {
            con = new SqlConnection(Connection.GetConnectionString());
            cmd = new SqlCommand("Apartment_Crud", con);
            cmd.Parameters.AddWithValue("Action", "Select");
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);


        }

        private void clear()
        {
            propertyName.Text = string.Empty;
            bedroomsID.Text = string.Empty;
            bathroomsID.Text = string.Empty;
            parkingsID.Text = string.Empty;
            priceTotal.Text = string.Empty;
            description.Text = string.Empty;
            SelectUploadType.Text = string.Empty;
            interiorArea.Text = string.Empty;
            Location.Text = string.Empty;
            imgProperty.ImageUrl = string.Empty;
            hdnId.Value = "0";



        }

        protected void clearButton_Click(object sender, EventArgs e)
        {
            clear();
        }
    }
}