<%@ Page Title="" Language="C#" MasterPageFile="~/user/user.Master" AutoEventWireup="true" CodeBehind="buy.aspx.cs" Inherits="brensden.user.buy" %>

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




    <!-- buy section -->

    <div class="site-section site-section-sm bg-light filter-content">

        <div class="container">

            <!-- Filter options -->
            <div class="row mb-3">
                <div class="col-md-6">
                    <label for="locationFilter">Location:</label>
                    <select id="locationFilter" class="form-control">
                        <option value="all">All Locations</option>
                        <option value="all">Dhaka</option>
                        <option value="all">Rajshahi</option>
                        <option value="all">Sylhet</option>
                        <!-- Add options dynamically based on your data -->
                    </select>
                </div>
                <div class="col-md-6">
                    <label for="priceFilter">Price Range:</label>
                    <select id="priceFilter" class="form-control">
                        <option value="all">All Prices</option>
                        <option value="$2,000,000+">$2,000,000 and above</option>
                        <option value="$4,000,000+">$4,000,000 and above</option>
                        <option value="$6,000,000+">$6,000,000 and above</option>
                        <option value="$8,000,000+">$8,000,000 and above</option>
                        <!-- Add options dynamically based on your data -->
                    </select>
                </div>
            </div>


            <div class="row mb-5">


                <asp:Repeater ID="rBuy" runat="server" OnItemCommand="rBuy_ItemCommand"
                    OnItemDataBound="rBuy_ItemDataBound">

                    <ItemTemplate>
                        <div class="col-md-6 col-lg-4 mb-4">
                            <div class="property-entry h-100">
                                <a href="propertyDetails.aspx?propertyId=<%# Eval("ap_id") %>" class="property-thumbnail">
                                    <!-- <a href="propertyDetails.aspx" class="property-thumbnail"></a> -->

                                    <img src="../asset2/images/img_1.jpg" alt="Image" class="img-fluid">
                                </a>
                                <div class="p-4 property-body">
                                    <a href="#" class="property-favorite"><span class="icon-heart-o"></span></a>
                                    <h2 class="property-title"><a href="property-details.html"><%# Eval("ap_building_name") %></a></h2>
                                    <span class="property-location d-block mb-3"><span class="property-icon icon-room"></span><%# Eval("ap_location") %></span>
                                    <strong class="property-price text-primary mb-3 d-block text-success"><%# Eval("ap_rent_amount") %></strong>
                                    <ul class="property-specs-wrap mb-3 mb-lg-0">
                                        <li>
                                            <span class="property-specs">Beds</span>
                                            <span class="property-specs-number"><%# Eval("ap_num_bedrooms") %> <sup>+</sup></span>

                                        </li>
                                        <li>
                                            <span class="property-specs">Baths</span>
                                            <span class="property-specs-number"><%# Eval("ap_num_bathrooms") %></span>

                                        </li>
                                        <li>
                                            <span class="property-specs">SQ FT</span>
                                            <span class="property-specs-number"><%# Eval("ap_num_parkings") %></span>

                                        </li>
                                        <asp:LinkButton ID="Details" Text="Details" runat="server" CommandName="delete"
                                            CssClass="badge bg-danger" CommandArgument='<%# Eval("ap_id") %>'
                                            Onclick="Details_Click">
                                              
                                        </asp:LinkButton>
                                    </ul>

                                </div>
                            </div>
                        </div>
                    </ItemTemplate>

                </asp:Repeater>

            </div>
            <div class="row">
                <div class="col-md-12 text-center">
                    <div class="site-pagination">
                        <a href="#" class="active">1</a>
                        <a href="#">2</a>
                        <a href="#">3</a>
                        <a href="#">4</a>
                        <a href="#">5</a>
                        <span>...</span>
                        <a href="#">10</a>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <div class="site-section">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-7 text-center">
                    <div class="site-section-title">
                        <h2>Why Choose Us?</h2>
                    </div>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Debitis maiores quisquam saepe architecto error corporis aliquam. Cum ipsam a consectetur aut sunt sint animi, pariatur corporis, eaque, deleniti cupiditate officia.</p>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6 col-lg-4">
                    <a href="#" class="service text-center">
                        <span class="icon flaticon-house"></span>
                        <h2 class="service-heading">Research Subburbs</h2>
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Incidunt iure qui natus perspiciatis ex odio molestia.</p>
                        <p><span class="read-more">Read More</span></p>
                    </a>
                </div>
                <div class="col-md-6 col-lg-4">
                    <a href="#" class="service text-center">
                        <span class="icon flaticon-sold"></span>
                        <h2 class="service-heading">Sold Houses</h2>
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Incidunt iure qui natus perspiciatis ex odio molestia.</p>
                        <p><span class="read-more">Read More</span></p>
                    </a>
                </div>
                <div class="col-md-6 col-lg-4">
                    <a href="#" class="service text-center">
                        <span class="icon flaticon-camera"></span>
                        <h2 class="service-heading">Security Priority</h2>
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Incidunt iure qui natus perspiciatis ex odio molestia.</p>
                        <p><span class="read-more">Read More</span></p>
                    </a>
                </div>
            </div>
        </div>
    </div>

    <!-- end buy section -->



    <script>
        $(document).ready(function () {
            // Function to filter properties based on user selections
            function filterProperties() {
                var locationFilter = $("#locationFilter").val();
                var priceFilter = $("#priceFilter").val();

                $(".property-entry").hide(); // Hide all properties

                // Show properties that match the selected filters
                $(".property-entry").each(function () {
                    var propertyLocation = $(this).find(".property-location").text();
                    var propertyPrice = $(this).find(".property-price").text();

                    if ((locationFilter === "all" || propertyLocation.includes(locationFilter)) &&
                        (priceFilter === "all" || propertyPrice.includes(priceFilter))) {
                        $(this).show();
                    }
                });
            }

            // Event listeners for filter changes
            $("#locationFilter, #priceFilter").change(function () {
                filterProperties();
            });

            // Initial filtering
            filterProperties();
        });
    </script>
</asp:Content>
