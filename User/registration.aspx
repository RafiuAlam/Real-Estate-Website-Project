<%@ Page Title="" Language="C#" MasterPageFile="~/user/user.Master" AutoEventWireup="true" CodeBehind="registration.aspx.cs" Inherits="brensden.user.registration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script>
        window.onload = function () {
            var seconds = 5;
            setTimeout(function () {
                document.getElementById("<%=lblMsg.ClientID %>").style.display = "none";
            }, seconds * 1000);
        };
    </script>
    <script>
        function ImagePreview(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=imgUser.ClientID%>').prop('src', e.target.result)
                        .width(200)
                        .height(200);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="book_selection layout_padding">
        <div class="container">
            <div class="heading_container">
                <div class="align-self-end">
                    <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
                </div>
                <asp:Label ID="lblHeaderMsg" runat="server" Text="<h2>User Registration</h2>"></asp:Label>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <div class="form_container">

                        <div style="margin-top: 20px;">
                            <asp:TextBox ID="txtFName" runat="server" CssClass="form-control" placeholder="Enter First Name"
                                ToolTip="First Name"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvNFame" runat="server" ErrorMessage="First Name is Required" ControlToValidate="txtFName"
                                ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revFName" runat="server" ErrorMessage="First Name must have characters only !"
                                ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[a-zA-Z\s]+$"
                                ControlToValidate="txtFName"></asp:RegularExpressionValidator>
                        </div>

                        <div style="margin-top: 10px;">
                            <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Enter Username"
                                ToolTip="Username"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ErrorMessage="Username is Required" 
                                ControlToValidate="txtUsername" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
           
                        </div>

                        <div style="margin-top: 10px;">
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter Gmail Adress"
                                ToolTip="Email"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="Email is Required"
                                ControlToValidate="txtEmail" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revEmail" runat="server" ErrorMessage="Email must have @gmail.com"
                                ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[a-zA-Z0-9._%+-]+@gmail\.com$"
                                ControlToValidate="txtEmail"></asp:RegularExpressionValidator>
                        </div>

                        <div style="margin-top: 10px;">
                            <asp:TextBox ID="txtMob" runat="server" CssClass="form-control" placeholder="Enter Mobile Number"
                                ToolTip="Mobile Number"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvMob" runat="server" ErrorMessage="Mobile Number is Required"
                                ControlToValidate="txtMob" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revMob" runat="server" ErrorMessage="Mobile Number must have 10 digits"
                                ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[0-9]{10}$"
                                ControlToValidate="txtMob"></asp:RegularExpressionValidator>
                        </div>
                        
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form_container">

                        <div style="margin-top: 20px;">
                            <asp:TextBox ID="txtLName" runat="server" CssClass="form-control" placeholder="Enter Last Name"
                                ToolTip="Last Name"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvLName" runat="server" ErrorMessage="Last Name is Required" ControlToValidate="txtLName"
                                ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revLName" runat="server" ErrorMessage="Last Name must have characters only !"
                                ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[a-zA-Z\s]+$"
                                ControlToValidate="txtLName"></asp:RegularExpressionValidator>
                        </div>

                        <div style="margin-top: 20px;">
                            <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Enter Address"
                                ToolTip="Address" TextMode="MultiLine"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ErrorMessage="Address is Required" ControlToValidate="txtAddress"
                                ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                        </div>

                        <div style="margin-top: 10px;">
                            <asp:FileUpload ID="fuUserImage" runat="server" CssClass="form-control" ToolTip="User Image" onchange="imagePreview(this);" />
                        </div>

                        <div style="margin-top: 10px;">
                            <asp:TextBox ID="txtPass" runat="server" CssClass="form-control" placeholder="Enter Password"
                                ToolTip="Password" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="Password is Required"
                                ControlToValidate="txtPass" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revPassword" runat="server" ErrorMessage="Password must contain a special character, an uppercase letter, and be at least 8 characters long."
                                ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^(?=.*[!@#$%^&*])(?=.*[A-Z]).{8,}$"
                                ControlToValidate="txtPass"></asp:RegularExpressionValidator>
                            <asp:Button ID="btnShowPassword" runat="server" Text="Show Password" OnClientClick="togglePasswordVisibility(); return false;" Style="margin-top: 5px;" />
                        </div>


                        <script>
                            function togglePasswordVisibility() {
                                var passwordTextBox = document.getElementById('<%= txtPass.ClientID %>');
                                if (passwordTextBox.type === "password") {
                                    passwordTextBox.type = "text";
                                } else {
                                    passwordTextBox.type = "password";
                                }
                            }
                        </script>

                    </div>
                </div>

                <div class ="row pl-4">
                    <div class ="btn_box">
                        <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-success rounded-pill pl-4 pr-4 text-white"
                            OnClick="btnRegister_Click"/>

                        <asp:Label ID="lblAlreadyUser" runat="server" CssClass="pl-3 text-black-100"
                            Text="Already Registered? <a href='Login.aspx' class='badge badge-info' style='font-size: 15px;'>Login here..</a>">
                        </asp:Label>
                    </div>
                </div>

                <div class="row p-5">
                    <div style="align-items:center">
                        <asp:Image ID="imgUser" runat="server" CssClass="img-thumbnail" />
                    </div>
                </div>

            </div>
        </div>
    </section>
</asp:Content>
