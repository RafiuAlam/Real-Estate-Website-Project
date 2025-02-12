<%@ Page Title="" Language="C#" MasterPageFile="~/user/user.Master" AutoEventWireup="true" CodeBehind="sell.aspx.cs" Inherits="brensden.user.sell" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        /* For disapprering alert msg */

        window.onload = function () {
            var second = 5;
            setTimeout(function () {
                document.getElementById("<%=lblMsg.ClientID %>".style.display = "none");
            }, second * 1000);
        };

    </script>
    <script>
        function ImagePreview(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=imgProperty.ClientID%>').prop('src', e.target.result)
                        .width(200)
                        .height(200);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Basic Form Inputs card start -->
    <div class="card container layout_padding2-bottom layout_padding2-top ">
        <div class="card-header">
            <h5>Property Details</h5>

            <div class="card-header-right">
                <i
                    class="icofont icofont-spinner-alt-5"></i>
            </div>

            <div class="card-header-right">
                <i class="icofont icofont-spinner-alt-5"></i>
            </div>

        </div>
        <div class="aling-aling-self-end">
            <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>


        </div>
        <div class="card-block" style="padding-left: 20px; padding-right: 20px;">

            <form style="padding-top: 20px">

                <div class="form-group row layout_padding2-top">
                    <label class="col-sm-2 col-form-label">Property Name</label>

                    <div class="col-sm-10">
                        <asp:TextBox ID="propertyName" runat="server" CssClass="form-control" placeholder="Property Name"></asp:TextBox>
                        <asp:RequiredFieldValidator ID ="rfvPropertyName" runat="server" ErrorMessage="Name is required" ControlToValidate="propertyName"
                            ForeColor="Red" Display="Dynamic" SetFocusOnError="true"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revPropertyName" runat="server" ErrorMessage="Name must have characters only !" 
                            ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[a-zA-Z\s]+$" 
                            ControlToValidate="propertyName"></asp:RegularExpressionValidator>
                        <asp:HiddenField ID="hdnId" runat="server" Value="0" />
                    </div>

                </div>

                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Bedrooms</label>
                    <div class="col-sm-10">
                        
                        <asp:TextBox ID="bedroomsID" runat="server" CssClass="form-control" placeholder="Add Bedrooms"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvBedrooms" runat="server"
                            ErrorMessage="Bedrooms is Required" ControlToValidate="bedroomsID" ForeColor="Red" Display="Dynamic"
                            SetFocusOnError="true"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revBedrooms" runat="server"
                            ErrorMessage="Bedrooms must be Number Only !" ForeColor="Red" Display="Dynamic"
                            SetFocusOnError="true" ValidationExpression="^[0-9]+$"
                            ControlToValidate="bedroomsID"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Bathrooms</label>
                    <div class="col-sm-10">

                        <asp:TextBox ID="bathroomsID" runat="server" CssClass="form-control" placeholder="Add Bathrooms"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvBathrooms" runat="server"
                            ErrorMessage="Bathrooms is Required" ControlToValidate="bathroomsID" ForeColor="Red" Display="Dynamic"
                            SetFocusOnError="true"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revBathrooms" runat="server"
                            ErrorMessage="Bathrooms must be Number Only !" ForeColor="Red" Display="Dynamic"
                            SetFocusOnError="true" ValidationExpression="^[0-9]+$"
                            ControlToValidate="bathroomsID"></asp:RegularExpressionValidator>
                 
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Parkings</label>
                    <div class="col-sm-10">

                        <asp:TextBox ID="parkingsID" runat="server" CssClass="form-control" placeholder="Add parking slot"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvParking" runat="server"
                            ErrorMessage="Parking is Required" ControlToValidate="parkingsID" ForeColor="Red" Display="Dynamic"
                            SetFocusOnError="true"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revParking" runat="server"
                            ErrorMessage="Parking must be Number Only !" ForeColor="Red" Display="Dynamic"
                            SetFocusOnError="true" ValidationExpression="^[0-9]+$" 
                            ControlToValidate="parkingsID"></asp:RegularExpressionValidator>
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Interior Area(Sqaure Feet)</label>

                    <div class="col-sm-10">
                        <asp:TextBox ID="interiorArea" runat="server" CssClass="form-control" placeholder="Area"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPropertyArea" runat="server"
                            ErrorMessage="Area is Required" ControlToValidate="interiorArea" ForeColor="Red" Display="Dynamic"
                            SetFocusOnError="true"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revPropertyArea" runat="server"
                            ErrorMessage="Area must be Number Only !" ForeColor="Red" Display="Dynamic"
                            SetFocusOnError="true" ValidationExpression="^\d{1,8}(\.\d{1,2})?$" ControlToValidate="interiorArea"></asp:RegularExpressionValidator>
                    </div>
                </div>

               
                
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Price (BDT)</label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="priceTotal" runat="server" CssClass="form-control" placeholder="Price"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPriceTotal" runat="server"
                            ErrorMessage="Price is Required" ForeColor="Red" Display="Dynamic"
                            SetFocusOnError="true" ControlToValidate="priceTotal"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revPriceTotal" runat="server"
                            ErrorMessage="Area must be Number Only !" ForeColor="Red" Display="Dynamic"
                            SetFocusOnError="true" ValidationExpression="^\d{1,8}(\.\d{1,2})?$"
                            ControlToValidate="priceTotal"></asp:RegularExpressionValidator>
                    </div>
                </div>




                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Upload Property Picture</label>
                    <div class="col-sm-10">
                        <asp:FileUpload ID="fileUploadPropertyPicture" runat="server" CssClass="form-control"></asp:FileUpload>

                    </div>
                </div>



                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Upload Type</label>
                    <div class="col-sm-10">
                        <asp:DropDownList ID="SelectUploadType" runat="server" CssClass="form-control">
                            <asp:ListItem Value="Sell">Sell</asp:ListItem>
                            <asp:ListItem Value="Rent">Rent</asp:ListItem>

                        </asp:DropDownList>

                    </div>
                </div>




                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Discription</label>

                    <asp:TextBox ID="description" runat="server" Rows="5" Columns="5" CssClass="form-control" TextMode="MultiLine" placeholder="Default textarea"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvDescription" runat="server"
                        ErrorMessage="Description is Required" ForeColor="Red" Display="Dynamic"
                        SetFocusOnError="true" ControlToValidate="description"></asp:RequiredFieldValidator>
                </div>


                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Location</label>

                    <asp:TextBox ID="Location" runat="server" Rows="3" Columns="5" CssClass="form-control" TextMode="MultiLine" placeholder="Default textarea"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvLocation" runat="server"
                        ErrorMessage="Location is Required" ForeColor="Red" Display="Dynamic"
                        SetFocusOnError="true" ControlToValidate="Location"></asp:RequiredFieldValidator>
                </div>


                <div>
                    <asp:Button ID="uploadPropertyButton" runat="server" Text="Upload Property" CssClass="btn btn-primary" OnClick="uploadPropertyButton_Click" />
                    <asp:Button ID="clearButton" runat="server" Text="Clear" CssClass="btn btn-bg-c-orenge" OnClick="clearButton_Click" />
                </div>

            </form>

            

            <div class="row">
                <div style="align-items: center">
                    <asp:Image ID="imgProperty" runat="server" CssClass="img-thumbnail" />
                </div>
            </div>
        </div>
    </div>
    <!-- Basic Form Inputs card end -->

</asp:Content>
