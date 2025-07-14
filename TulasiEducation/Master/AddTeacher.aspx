<%@ Page Title="" Language="C#" MasterPageFile="~/Master/HomeMaster.Master" AutoEventWireup="true" CodeBehind="AddTeacher.aspx.cs" 
    Inherits="TulasiEducation.Master.AddTeacher" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-xxl">
        <div class="container">
            <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                <h6 class="section-title bg-white text-center text-primary px-3">Add Teacher</h6>
                <h1 class="mb-5">Add A New Teacher</h1>
            </div>
            <div class="row">
                <div class="col-6 col-md-4 col-lg-3 my-2">
                    <div class="form-floating">
                        <asp:TextBox ID="txtfirstname" runat="server" placeholder="Your Name" class="form-control"></asp:TextBox>
                        <label for="txtfirstname">First Name</label>
                    </div>
                </div>
                <div class="col-6 col-md-4 col-lg-3 my-2">
                    <div class="form-floating">
                        <asp:TextBox ID="txtlastname" runat="server" placeholder="Your Name" class="form-control"></asp:TextBox>
                        <label for="txtlastname">Last Name</label>
                    </div>
                </div>
                <div class="col-6 col-md-4 col-lg-3 my-2">
                    <div class="form-floating">
                        <asp:TextBox ID="txtphone" runat="server" placeholder="Your Name" class="form-control" OnTextChanged="txtphone_TextChanged" AutoPostBack="true"></asp:TextBox>
                        <label for="txtphone">Phone number</label>
                    </div>
                </div>
                <div class="col-6 col-md-4 col-lg-3 my-2">
                    <div class="form-floating">
                        <asp:TextBox ID="txtemail" runat="server" placeholder="Your Name" class="form-control" OnTextChanged="txtemail_TextChanged" AutoPostBack="true"></asp:TextBox>
                        <label for="txtemail">Email</label>
                    </div>
                </div>
                <div class="col-6 col-md-4 col-12 col-lg-3 my-2">
                    <div class="form-floating">
                        <asp:DropDownList ID="ddlgender" runat="server" AutoPostBack="false" CssClass="form-select">
                            <asp:ListItem Text="Select an option" Value="" />
                            <asp:ListItem Text="Male" Value="1" />
                            <asp:ListItem Text="Female" Value="2" />
                            <asp:ListItem Text="Others" Value="3" />
                        </asp:DropDownList>
                        <label for="ddlgender">Select Gender</label>
                    </div>
                </div>
                 <div class="col-6 col-md-4 col-12 col-lg-3 my-2">
                    <div class="form-floating">
                        <asp:DropDownList ID="ddlsubject" runat="server" AutoPostBack="false" CssClass="form-select">
                            <asp:ListItem Text="Select an option" Value="" />
                            <asp:ListItem Text="Sanskrit" Value="Sanskrit" />
                            <asp:ListItem Text="Telugu" Value="Telugu" />
                            <asp:ListItem Text="English" Value="English" />
                            <asp:ListItem Text="Hindi" Value="Hindi" />
                             <asp:ListItem Text="Physics" Value="Physics" />
                            <asp:ListItem Text="Chemistry" Value="Chemistry" />
                            <asp:ListItem Text="Electronics" Value="Electronics" />
                            <asp:ListItem Text="Statistics" Value="Statistics" />
                            <asp:ListItem Text="Other" Value="Other" />
                        </asp:DropDownList>
                        <label for="ddlgender">Select Subject</label>
                    </div>
                </div>
                <div class="col-6 col-md-4 col-lg-3">
                    <div class="form-floating my-2">
                        <asp:DropDownList ID="ddlstate" runat="server" AutoPostBack="false" CssClass="form-select">
                        </asp:DropDownList>
                        <label for="ddlqualification">Select State</label>
                    </div>
                </div>
                <div class="col-6 col-md-4 col-lg-3">
                    <div class="form-floating my-2">
                        <asp:TextBox ID="txttown" runat="server" placeholder="Your Name" class="form-control"></asp:TextBox>
                        <label for="txtemail">Town</label>
                    </div>
                </div>
                <div class="col-6 col-md-4 col-lg-3">
                    <div class="form-floating my-2">
                        <asp:TextBox ID="txtaddress" runat="server" placeholder="Your Name" class="form-control"></asp:TextBox>
                        <label for="txtemail">Address</label>
                    </div>
                </div>
                <div class="col-6 col-md-4 col-lg-3">
                    <div class="form-floating my-2">
                        <asp:DropDownList ID="ddlstatus" runat="server" AutoPostBack="false" CssClass="form-select">
                            <asp:ListItem Text="Select Status" Selected="True" Value="0"></asp:ListItem>
                            <asp:ListItem Text="Active" Value="Active"></asp:ListItem>
                            <asp:ListItem Text="Inactive" Value="Inactive"></asp:ListItem>
                        </asp:DropDownList>
                        <label for="ddlqualification">Select Status</label>
                    </div>
                </div>
            </div>
            <div class="row">
                <br />
            </div>
            <div class="text-center">
                <asp:Button ID="btnresgister" class="btn btn-primary p-3 px-5" style="border-radius: 10px;" Text="Register" runat="server" Onclick="btnresgister_Click1" />
            </div>
            <asp:HiddenField id="hdngenid" runat="server"/>
        </div>
    </div>
</asp:Content>
