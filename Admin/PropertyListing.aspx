<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.Master" AutoEventWireup="true" CodeBehind="PropertyListing.aspx.cs" Inherits="brensden.admin.PropertyListing" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="pcoded-inner-content pt-0">
        <div class="align-align-self-end">
            <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
        </div>



        <!-- Basic table card start -->
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
                                            <h4 class="sub-title">Property List</h4>
                                            <div class="card-block table-border-style">


                                                <asp:Repeater ID="rBuy" runat="server" OnItemCommand="rBuy_ItemCommand"
                                                    OnItemDataBound="rBuy_ItemDataBound">


                                                    <HeaderTemplate>
                                                        <table class="table data-table-export table-hover nowrap">
                                                            <thead>
                                                                <tr>
                                                                    <th class="table-plus">Property ID</th>
                                                                    <th>Property Name</th>
                                                                    <th>Price</th>
                                                                    <th>Location</th>
                                                                    <th>For</th>
                                                                    <th class="dataTable-nosort">Delete</th>
                                                                </tr>
                                                            </thead>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>


                                                        <tr>
                                                            <td class="table-plus"><%# Eval("ap_id") %> </td>
                                                            <td><%# Eval("ap_building_name") %> </td>
                                                            <td><%# Eval("ap_rent_amount") %> </td>
                                                            <td><%# Eval("ap_location") %> </td>
                                                            <td><%# Eval("ap_upload_type") %> </td>
                                                            <td>
                                                                <asp:LinkButton ID="lnkDelete" Text="Delete" runat="server" CommandName="delete"
                                                                    CssClass="badge bg-danger" CommandArgument='<%# Eval("ap_id") %>'
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
        <!-- Basic table card end -->
</asp:Content>
