using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace brensden.user
{
    public partial class payavisit : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["vis_id"] != null) // && Session["userId"] != null)
                {
                    getVis();
                }
                else if (Session["userId"] != null)
                {
                    Response.Redirect("buy.aspx");
                }
            }

        }

        protected void btnvis_Click(object sender, EventArgs e)
        {

            // Assuming Connection.GetConnectionString() returns the connection string.
            string actionName = string.Empty, imagePath = string.Empty, fileExtension = string.Empty;
            bool isValidToExecute = false;
            int visID = string.IsNullOrEmpty(Request.QueryString["vis_id"]) ? 0 : Convert.ToInt32(Request.QueryString["vis_id"]);
            con = new SqlConnection(Connection.GetConnectionString());

            cmd = new SqlCommand("Visitor_Crud", con);
            cmd.Parameters.AddWithValue("@Action", visID == 0 ? "Insert" : "UPDATE");
            cmd.Parameters.AddWithValue("@visId", visID);

            cmd.Parameters.AddWithValue("@FirstName", txtFName.Text.Trim());
            cmd.Parameters.AddWithValue("@LastName", txtLName.Text.Trim());
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
            
            
           

            if (isValidToExecute)
            {
                cmd.CommandType = CommandType.StoredProcedure;
                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    actionName = visID == 0 ?
                        "Visit Request is Sent! <b><a href = 'buy.aspx> CLICK HERE </a></b> To Do visit" :
                        "Details updated Successfully <b><a href = 'profile.aspx> CAN CHECK HERE </a></b>";
                    lblMsg.Visible = true;
                    lblMsg.Text = "<b>" + txtFName.Text.Trim() + " </b>" + actionName;
                    lblMsg.CssClass = "alert alert-success";
                    if (visID != 0)
                    {
                        Response.AddHeader("REFRESH", "1;URL=buy.aspx");
                    }
                    clear();
                }

                catch (SqlException ex)
                {
                    if (ex.Message.Contains("Violation of Unique key constraint"))
                    {
                        lblMsg.Visible = true;
                        lblMsg.Text = "<b>" + txtFName.Text.Trim() + "</b> Username already exist, try a new one";
                        lblMsg.CssClass = "alert alert-danger";
                    }
                }
                catch (Exception ex)
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "Error - " + ex.Message;
                    lblMsg.CssClass = "alert alert-danger";
                }
                finally
                {
                    con.Close();
                }
            }

        }

        void getVis()
        {
            con = new SqlConnection(Connection.GetConnectionString());
            cmd = new SqlCommand("Visitor_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "Select4Profile");
            cmd.Parameters.AddWithValue("@visId", Request.QueryString["vis_id"]);
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count == 1)
            {
                txtFName.Text = dt.Rows[0]["vis_first_name"].ToString();
                txtLName.Text = dt.Rows[0]["vis_last_name "].ToString();
                txtEmail.Text = dt.Rows[0]["vis_email"].ToString();
                
            }
            
            
            
        }

        private void clear()
        {
            txtFName.Text = string.Empty;
            txtLName.Text = string.Empty;
            
            txtEmail.Text = string.Empty;
            
    }

}
}