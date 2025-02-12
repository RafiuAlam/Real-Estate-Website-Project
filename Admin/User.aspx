<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.Master" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="brensden.admin.User" %>

<%@ Import Namespace="brensden" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script>
        window.onload = function () {
            var seconds = 5;
            setTimeout(function () {
                document.getElementById("<%=lblMsg.ClientID %>").style.display = "none";
             }, seconds * 1000);
        };
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="pcoded-inner-content pt-0">
        <div class="align-align-self-end">
            <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
        </div>

        <div class="main-body">
            <div class="page-wrapper">
                <div class="page-body">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card">
                                <div class="card-holder">
                                </div>
                                <div class="card-block">
                                    <div class="row">

                                        <div class="col-12 movile-inputs">
                                            <h4 class="sub-title">User List</h4>
                                            <div class="card-block table-border-style">

                                                
                                                <asp:Repeater ID="rUser" runat="server" OnItemCommand="rUser_ItemCommand"
                                                    OnItemDataBound="rUser_ItemDataBound">

                                                    
                                                    <HeaderTemplate>
                                                        <table class="table data-table-export table-hover nowrap">
                                                            <thead>
                                                                <tr>
                                                                    <th class="table-plus">Customer ID</th>
                                                                    <th>User Name</th>
                                                                    <th>First Name</th>
                                                                    <th>Last Name</th>
                                                                    <th>Email Name</th>
                                                                    <th class="dataTable-nosort">Delete</th>
                                                                </tr>
                                                            </thead>
                                                        
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        
                                                            
                                                                <tr>
                                                                    <td class="table-plus"><%# Eval("cus_id") %> </td>
                                                                    <td><%# Eval("cus_user_name") %> </td>
                                                                    <td><%# Eval("cus_first_name") %> </td>
                                                                    <td><%# Eval("cus_last_name") %> </td>
                                                                    <td><%# Eval("cus_email") %> </td>
                                                                    <td>
                                                                        <asp:LinkButton ID="lnkDelete" Text="Delete" runat="server" CommandName="delete"
                                                                            CssClass="badge bg-danger" CommandArgument='<%# Eval("cus_id") %>'
                                                                            OnClientClick="return confirm('Do you want to delete this user ?);">
                                                                            <i class="ti-trash"></i>
                                                                        </asp:LinkButton>
                                                                    </td>
                                                                </tr>

                                                            
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            </table>
                                                        </FooterTemplate>
                                                        

                                                    

                                                </asp:Repeater>

                                            </div>
                                        </div>

                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
