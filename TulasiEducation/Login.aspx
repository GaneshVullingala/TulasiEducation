<%@ Page Title="" Language="C#" MasterPageFile="~/PublicMaster.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TulasiEducation.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Header Start -->
    <div class="container-fluid bg-primary py-5 mb-5 page-header">
        <div class="container py-5">
            <div class="row justify-content-center">
                <div class="col-lg-10 text-center">
                    <h1 class="display-3 text-white animated slideInDown">Login</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center">
                            <li class="breadcrumb-item"><a class="text-white" href="#">Home</a></li>
                            <li class="breadcrumb-item"><a class="text-white" href="#">Pages</a></li>
                            <li class="breadcrumb-item text-white active" aria-current="page">Login</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- Header End -->
    <!-- Login Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                <h6 class="section-title bg-white text-center text-primary px-3">Login</h6>
                <h1 class="mb-5">Login for better experience</h1>


                <br />
                <asp:Label ID="lblfullname" runat="server" Text="Name"></asp:Label>
                <br />
            </div>
            <div class="row">
                <div class="col-lg-4">
                    <br />
                </div>
                <div class="col-lg-4">
                    <div class="wow fadeInUp" data-wow-delay="0.5s">
                        <form>
                            <div class="row g-3">
                                <div>
                                    <div class="form-floating">
                                        <asp:TextBox ID="txtusername" runat="server" placeholder="Your Name" class="form-control"></asp:TextBox>
                                        <label for="name">User Name / Mobile / Email</label>
                                    </div>
                                </div>

                            
                                <div>
                                    <div class="form-floating">
                                        <asp:TextBox ID="txtpassword" TextMode="Password" runat="server" placeholder="Your Name" class="form-control"></asp:TextBox>
                                        <label for="email">Password</label>
                                    </div>
                                </div>
                                <div>
                                    <asp:Button id="btnlogin" runat="server" OnClick="btnlogin_Click" Text="Login" class="btn btn-primary w-100 py-3"/>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-lg-4">
                    <br />
                </div>
            </div>
        </div>
    </div>

    <!-- Login End -->

</asp:Content>
