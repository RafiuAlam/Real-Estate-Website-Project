<%@ Page Title="" Language="C#" MasterPageFile="~/admin/Admin.Master" AutoEventWireup="true" CodeBehind="RequestListing.aspx.cs" Inherits="brensden.admin.RequestListing" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


     <!-- Basic table card start -->
                                 <div class="card">
                                     <div class="card-header">
                                         <h5>Requested Properties For Listing</h5>
                                         
                                         <div class="card-header-right">    <ul class="list-unstyled card-option">        <li><i class="icofont icofont-simple-left "></i></li>        <li><i class="icofont icofont-maximize full-card"></i></li>        <li><i class="icofont icofont-minus minimize-card"></i></li>        <li><i class="icofont icofont-refresh reload-card"></i></li>        <li><i class="icofont icofont-error close-card"></i></li>    </ul></div>
                                     </div>
                                     <div class="card-block table-border-style">
                                         <div class="table-responsive">
                                             <table class="table">
                                                 <thead>
                                                     <tr>
                                                         <th>#</th>
                                                         <th>Property ID</th>
                                                         <th>Seller ID</th>
                                                         <th>Price</th>
                                                         <th>Date</th>
                                                         <th>Approval</th>
                                                         
                                                     </tr>
                                                 </thead>
                                                 <tbody>
                                                     <tr>
                                                         <th scope="row">1</th>
                                                         <td>Mark</td>
                                                         <td>Otto</td>
                                                         <td>@mdo</td>
                                                         <td>@mdo</td>
                                                         <td>
                                                             <button class="bg-c-green rounded border-0">Approve </button>
                                                             <button class="bg-c-orenge rounded border-0">Cancel </button>
                                                         </td>
                                                     </tr>
                                                     <tr>
                                                         <th scope="row">2</th>
                                                         <td>Jacob</td>
                                                         <td>Thornton</td>
                                                         <td>@fat</td>
                                                         <td>@mdo</td>
                                                             <td>
                                                                 <button class="bg-c-green rounded border-0">Approve </button>
                                                                 <button class="bg-c-orenge rounded border-0">Cancel </button>
                                                             </td>
                                                     </tr>
                                                     <tr>
                                                         <th scope="row">3</th>
                                                         <td>Larry</td>
                                                         <td>the Bird</td>
                                                         <td>@twitter</td>
                                                         <td>@mdo</td>
                                                                 <td>
                                                                     <button class="bg-c-green rounded border-0 ">Approve </button>
                                                                     <button class="bg-c-orenge rounded border-0">Cancel </button>
                                                                 </td>
                                                     </tr>
                                                     

                                                 </tbody>
                                             </table>
                                         </div>
                                     </div>
                                 </div>
                                 <!-- Basic table card end -->
</asp:Content>
