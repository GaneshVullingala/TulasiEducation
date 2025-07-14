<%@ Page Title="" Language="C#" MasterPageFile="~/PublicMaster.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="TulasiEducation.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Header Start -->
    <div class="container-fluid bg-primary py-5 mb-5 page-header">
        <div class="container py-5">
            <div class="row justify-content-center">
                <div class="col-lg-10 text-center">
                    <h1 class="display-3 text-white animated slideInDown">Register Now!</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center">
                            <li class="breadcrumb-item"><a class="text-white" href="#">Home</a></li>
                            <li class="breadcrumb-item"><a class="text-white" href="#">Pages</a></li>
                            <li class="breadcrumb-item text-white active" aria-current="page">Contact</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- Header End -->
    <!-- Header Start -->
    <div class="row">
        <div class="col-12 col-lg-5">
            <br />
        </div>
        <div class="col-12 col-lg-2">
            <label>Select Category</label>
            <asp:DropDownList ID="ddlcategory" runat="server" AutoPostBack="false" CssClass="form-select" OnSelectedIndexChanged="ddlcategory_SelectedIndexChanged">
            </asp:DropDownList>
        </div>
        <div class="col-12 col-lg-5">
            <br />
        </div>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="form-group">
                    <label class="form-label">First Name</label>
                    <asp:TextBox class="form-control" ID="txtfirstname" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="form-group">
                    <label class="form-label">Last Name</label>
                    <asp:TextBox class="form-control" ID="txtlastname" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="form-group">
                    <label class="form-label">Phone</label>
                    <asp:TextBox class="form-control" ID="txtphone" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="form-group">
                    <label class="form-label">Email</label>
                    <asp:TextBox class="form-control" ID="txtemail" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="col-12 col-lg-3">
                <label class="form-label">Select Gender</label>
                <asp:DropDownList ID="ddlgender" runat="server" AutoPostBack="false" CssClass="form-select" OnSelectedIndexChanged="ddlExample_SelectedIndexChanged">
                    <asp:ListItem Text="Select an option" Value="" />
                    <asp:ListItem Text="Male" Value="1" />
                    <asp:ListItem Text="Female" Value="2" />
                    <asp:ListItem Text="Others" Value="3" />
                </asp:DropDownList>
            </div>
            <div class="col-12 col-lg-3">
                <label class="form-label">Select Qualification</label>
                <asp:DropDownList ID="ddlqualification" runat="server" AutoPostBack="false" CssClass="form-select" OnSelectedIndexChanged="ddlqualification_SelectedIndexChanged">
                </asp:DropDownList>
            </div>
            <div class="col-lg-3">
                <label class="form-label">Select Course</label>
                <asp:DropDownList ID="ddlcourse" runat="server" AutoPostBack="false" CssClass="form-select">
                </asp:DropDownList>
            </div>
            <div class="col-lg-3">
                <label class="form-label">Select State</label>
                <asp:DropDownList ID="ddlstate" runat="server" AutoPostBack="false" CssClass="form-select">
                </asp:DropDownList>
            </div>
            <div class="col-lg-3">
                <div class="form-group">
                    <label class="form-label">Town/City</label>
                    <asp:TextBox class="form-control" ID="txttown" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="form-group">
                    <label class="form-label">Address</label>
                    <asp:TextBox class="form-control" ID="txtaddress" runat="server"></asp:TextBox>
                </div>
            </div>
        </div>
        <div>
            <asp:Button id="btnresgister" CssClass="button" Text="Register" runat="server" OnClick="btnresgister_Click"/>
        </div>
    </div>
</asp:Content>
