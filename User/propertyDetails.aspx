<%@ Page Title="" Language="C#" MasterPageFile="~/user/user.Master" AutoEventWireup="true" CodeBehind="propertyDetails.aspx.cs" Inherits="brensden.user.propertyDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link rel="stylesheet" href="../asset2/css/bootstrap.min.css">
<link rel="stylesheet" href="../asset2/css/magnific-popup.css">
<link rel="stylesheet" href="../asset2/css/jquery-ui.css">
<link rel="stylesheet" href="../asset2/css/owl.carousel.min.css">
<link rel="stylesheet" href="../asset2/css/owl.theme.default.min.css">
<link rel="stylesheet" href="../asset2/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="../asset2/css/mediaelementplayer.css">
<link rel="stylesheet" href="../asset2/css/animate.css">
<link rel="stylesheet" href="../asset2/fonts/flaticon/font/flaticon.css">
<link rel="stylesheet" href="../asset2/css/fl-bigmug-line.css">

  
<link rel="stylesheet" href="../asset2/css/aos.css">

<link rel="stylesheet" href="../asset2/css/style.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="site-section site-section-sm">
      <div class="container">
        <div class="row">
          <div class="col-lg-8">
            <div>
              <div><img src="../asset2/images/hero_bg_1.jpg" alt="Image" class="img-fluid"></div>
            </div>
            <div class="bg-white property-body border-bottom border-left border-right">
              <div class="row mb-5">
                <div class="col-md-6">
                  <strong class="text-success h1 mb-3"><asp:Label ID="lblBuildingName" runat="server" /></strong>
                </div>
                <div class="col-md-6">
                  <ul class="property-specs-wrap mb-3 mb-lg-0  float-lg-right">
                  <li>
                    <span class="property-specs">Beds</span>
                    <span class="property-specs-number"><asp:Label ID="lblNumBedrooms" runat="server" /></span>
                    
                  </li>
                  <li>
                    <span class="property-specs">Baths</span>
                    <span class="property-specs-number"><asp:Label ID="lblNumBathrooms" runat="server" /></span>
                    
                  </li>
                    <li>
                   <span class="property-specs">Parking</span>
                   <span class="property-specs-number"><asp:Label ID="lblNumParkings" runat="server" /></span>

                   </li>
                  <li>
                    <span class="property-specs">SQ FT</span>
                    <span class="property-specs-number"><asp:Label ID="lblSquareFeet" runat="server" /></span>
                    
                  </li>
                </ul>
                </div>
              </div>
              <div class="row mb-5">
                <div class="col-md-6 col-lg-4 text-center border-bottom border-top py-3">
                  <span class="d-inline-block text-black mb-0 caption-text">For</span>
                  <strong class="d-block"><asp:Label ID="lblUploadType" runat="server" /></strong>
                </div>
                <div class="col-md-6 col-lg-4 text-center border-bottom border-top py-3">
                  <span class="d-inline-block text-black mb-0 caption-text">Location</span>
                  <strong class="d-block"><asp:Label ID="lblLocation" runat="server" /></strong>
                </div>
                <div class="col-md-6 col-lg-4 text-center border-bottom border-top py-3">
                  <span class="d-inline-block text-black mb-0 caption-text">Price</span>
                  <strong class="d-block"><asp:Label ID="lblRentAmount" runat="server" /></strong>
                </div>
              </div>
              <h2 class="h4 text-black">More Info</h2>
              <p><asp:Label ID="lblDescription" runat="server" /></p>
              

            
            </div>
          </div>
          <div class="col-lg-4">

            <div class="bg-white widget border rounded">

              <h3 class="h4 text-black widget-title mb-3">Contact Seller</h3>
              <form action="" class="form-contact-agent">
                <div class="form-group">
                  <label for="name">Name</label>
                  <input type="text" id="name" class="form-control">
                </div>
                <div class="form-group">
                  <label for="email">Email</label>
                  <input type="email" id="email" class="form-control">
                </div>
                <div class="form-group">
                  <label for="phone">Phone</label>
                  <input type="text" id="phone" class="form-control">
                </div>
                <div class="form-group">
                  <input type="submit" id="phone" class="btn btn-primary" value="Send Massage">
                </div>
              </form>
            </div>

                       <div class="bg-white widget border rounded">
                           <h3 class="h2 text-black widget-title mb-3">Request A Tour</h3>
                           <form action="" class="form-contact-agent">
                               <div class="form-group">
                                   <label for="name">Name</label>
                                   <input type="text" id="name" class="form-control">
                               </div>
                               <div class="form-group">
                                   <label for="email">Email</label>
                                   <input type="email" id="email" class="form-control">
                               </div>
                               <div class="form-group">
                                   <label for="phone">Phone</label>
                                   <input type="text" id="phone" class="form-control">
                               </div>
                               <div class="form-group">
                                   <label for="phone">Date</label>
                                   <input type="date" id="date" class="form-control">
                               </div>
                               <div class="form-group">
                                   <input type="submit" id="phone" class="btn btn-primary" value="Schedule Tour">
                               </div>
                           </form>

                       </div>

                   </div>
    </div>
    </div>
</div>
</asp:Content>
