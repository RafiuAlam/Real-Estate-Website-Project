using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace brensden.user
{
    public class Utils
    {
        public static bool IsValidExtension(string fileName)
        {
            string[] validExtensions = { ".jpg", ".jpeg", ".png" };
            string fileExtension = Path.GetExtension(fileName);
            return validExtensions.Contains(fileExtension, StringComparer.OrdinalIgnoreCase);
        }
    }

    public partial class registration : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if (Request.QueryString["cus_id"] != null) // && Session["userId"] != null)
                {
                    getUserDetails();
                }
                else if(Session["userId"] != null)
                {
                    Response.Redirect("Default.aspx");
                }
            }

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {

            
                // Assuming Connection.GetConnectionString() returns the connection string.
                string actionName = string.Empty, imagePath = string.Empty, fileExtension = string.Empty;
                bool isValidToExecute = false;
            int cusID = string.IsNullOrEmpty(Request.QueryString["cus_id"]) ? 0 : Convert.ToInt32(Request.QueryString["cus_id"]);
            con = new SqlConnection(Connection.GetConnectionString());
            
            cmd = new SqlCommand("customer_Crud", con);
            cmd.Parameters.AddWithValue("@Action", cusID == 0 ? "INSERT" : "UPDATE");
            cmd.Parameters.AddWithValue("@UserId", cusID);
            
            cmd.Parameters.AddWithValue("@FirstName", txtFName.Text.Trim());
                cmd.Parameters.AddWithValue("@LastName", txtLName.Text.Trim());
                cmd.Parameters.AddWithValue("@Username", txtUsername.Text.Trim());
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@Phone", txtMob.Text.Trim());
                cmd.Parameters.AddWithValue("@Address", txtAddress.Text.Trim());
                cmd.Parameters.AddWithValue("@Password", txtPass.Text.Trim());
                if (fuUserImage.HasFiles)
                {
                if (!Utils.IsValidExtension(fuUserImage.FileName))
                {
                    Guid obj = Guid.NewGuid();
                    fileExtension = Path.GetExtension(fuUserImage.FileName);
                    imagePath = "Images/User/" + obj.ToString() + fileExtension;
                    fuUserImage.PostedFile.SaveAs(Server.MapPath("~/Images/User/") + obj.ToString() + fileExtension);
                    cmd.Parameters.AddWithValue("@ImageUrl", imagePath);
                    isValidToExecute = true;
                }
                else
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "Please select .jpg, .jpeg or .png file image";
                    lblMsg.CssClass = "alert alert-danger";
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
                        actionName = cusID == 0 ?
                            "Registraion is Successful ! <b><a href = 'Login.aspx> CLICK HERE </a></b> To Do Login" :
                            "Details updated Successfully <b><a href = 'profile.aspx> CAN CHECK HERE </a></b>";
                        lblMsg.Visible = true;
                        lblMsg.Text = "<b>" + txtUsername.Text.Trim() + " </b>" + actionName;
                        lblMsg.CssClass = "alert alert-success";
                        if (cusID != 0)
                        {
                            Response.AddHeader("REFRESH", "1;URL=profile.aspx");
                        }
                        clear();
                    }

                    catch (SqlException ex)
                    {
                        if (ex.Message.Contains("Violation of Unique key constraint"))
                        {
                            lblMsg.Visible = true;
                            lblMsg.Text = "<b>" + txtUsername.Text.Trim() + "</b> Username already exist, try a new one";
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

        void getUserDetails()
        {
            con = new SqlConnection(Connection.GetConnectionString());
            cmd = new SqlCommand("customer_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "Select4Profile");
            cmd.Parameters.AddWithValue("@UserId", Request.QueryString["cus_id"]);
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count == 1)
            {
                txtFName.Text = dt.Rows[0]["cus_first_name"].ToString();
                txtLName.Text = dt.Rows[0]["cus_last_name "].ToString();
                txtUsername.Text = dt.Rows[0]["cus_user_name"].ToString();
                txtMob.Text = dt.Rows[0]["cus_phone"].ToString();
                txtEmail.Text = dt.Rows[0]["cus_email"].ToString();
                txtAddress.Text = dt.Rows[0]["cus_address "].ToString();
                imgUser.ImageUrl = string.IsNullOrEmpty(dt.Rows[0]["cus_image "].ToString()) ?
                    "../Images/no_image.png" : "../" + dt.Rows[0]["cus_image "].ToString();
                imgUser.Height = 200;
                imgUser.Width = 200;
                txtPass.TextMode = TextBoxMode.SingleLine;
                txtPass.ReadOnly = true;
                txtPass.Text = dt.Rows[0]["cus_password "].ToString();
            }
            lblHeaderMsg.Text = "<h2>Edit Profile</h2>";
            btnRegister.Text = "Update";
            lblAlreadyUser.Text = "";
        }




        private void clear()
                {
                    txtFName.Text = string.Empty;
                    txtLName.Text = string.Empty;
                    txtMob.Text = string.Empty;
                    txtEmail.Text = string.Empty;
                    txtAddress.Text = string.Empty;
                    txtUsername.Text = string.Empty;
                    txtPass.Text = string.Empty;
                }
        }

}