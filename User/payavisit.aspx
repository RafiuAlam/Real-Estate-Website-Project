<%@ Page Title="" Language="C#" MasterPageFile="~/user/user.Master" AutoEventWireup="true" CodeBehind="payavisit.aspx.cs" Inherits="brensden.user.payavisit" %>

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
             <asp:Label ID="lblHeaderMsg" runat="server" Text="<h2>Pay A Visit</h2>"></asp:Label>
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
                         <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter Gmail Adress"
                             ToolTip="Email"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="Email is Required"
                             ControlToValidate="txtEmail" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                         <asp:RegularExpressionValidator ID="revEmail" runat="server" ErrorMessage="Email must have @gmail.com"
                             ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[a-zA-Z0-9._%+-]+@gmail\.com$"
                             ControlToValidate="txtEmail"></asp:RegularExpressionValidator>
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
                 </div>
             </div>

             <div class ="row pl-4">
                 <div class ="btn_box">
                     <asp:Button ID="btnvis" runat="server" Text="Request A Visit" CssClass="btn btn-success rounded-pill pl-4 pr-4 text-white"
                         OnClick="btnvis_Click"/>

                     
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
