<%@ Page Title="" Language="C#" MasterPageFile="~/Master/TeacherMaster.Master" AutoEventWireup="true" CodeBehind="TMarks.aspx.cs" Inherits="TulasiEducation.Master.TMarks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
        <h6 class="section-title bg-white text-center text-primary px-3">Upload Marks</h6>
        <h1 class="mb-5">Post Student Marks Here</h1>
    </div>
    <div class="row">
        <div class="col-lg-2">
            <asp:Label ID="Label1" runat="server" Text="Select Class: " Font-Bold="true" />
            <asp:DropDownList ID="ddlClass" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlClass_SelectedIndexChanged" CssClass="form-select"></asp:DropDownList>
        </div>
        <div class="col-lg-2">
            <asp:Label ID="Label2" runat="server" Text="Select Student: " Font-Bold="true" />
            <asp:DropDownList ID="ddlStudent" runat="server" CssClass="form-select"></asp:DropDownList>
        </div>
        <div class="col-lg-2">
            <asp:Label ID="Label3" runat="server" Text="Select Exam Type: " Font-Bold="true" />
            <asp:DropDownList ID="ddlExamType" runat="server" CssClass="form-select">
                <asp:ListItem Text="Midterm" Value="Midterm" />
                <asp:ListItem Text="Halfyearly" Value="Halfyearly" />
                <asp:ListItem Text="Final" Value="Final" />
                <asp:ListItem Text="Daily Test" Value="DailyTest" />
                <asp:ListItem Text="Other" Value="Others" />
            </asp:DropDownList>
        </div>
        <div class="col-lg-2">
            <asp:Label ID="Label6" runat="server" Text="Select Subject: " Font-Bold="true" />
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
                <asp:ListItem Text="Mathematics" Value="Mathematics" />
                <asp:ListItem Text="Other" Value="Other" />
            </asp:DropDownList>
        </div>
        <div class="col-lg-1">
            <asp:Label ID="Label4" runat="server" Text="Total Marks: " Font-Bold="true" />
            <asp:TextBox ID="txtTotal" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-lg-1">
            <asp:Label ID="Label5" runat="server" Text="Obtained: " Font-Bold="true" />
            <asp:TextBox ID="txtObtained" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-lg-2 mt-4">
            <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" class="btn btn-primary" />
        </div>
    </div>
    <div class="row">
        <br />
    </div>
    <asp:GridView ID="gvMarks" runat="server" AutoGenerateColumns="true" CssClass="table" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" ForeColor="Black" GridLines="Horizontal" ShowFooter="false" CellSpacing="0" CellPadding="10" Font-Size="Small" AllowPaging="true" PageSize="10" PagerSettings-Position="Bottom">
        <RowStyle BackColor="#EFF3FB" />
        <AlternatingRowStyle BackColor="White" />
        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Center" Height="30px" CssClass="cssPager" />
        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#BEC0D9" Font-Bold="True" ForeColor="Black" VerticalAlign="Middle" />
    </asp:GridView>
</asp:Content>
