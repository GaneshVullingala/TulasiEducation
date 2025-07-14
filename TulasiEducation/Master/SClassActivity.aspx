<%@ Page Title="" Language="C#" MasterPageFile="~/Master/StudentMaster.Master" AutoEventWireup="true" CodeBehind="SClassActivity.aspx.cs" Inherits="TulasiEducation.Master.SClassActivity" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
        <h6 class="section-title bg-white text-center text-primary px-3">Class Activity</h6>
        <h1 class="mb-5">Daily Class Activity</h1>
    </div>
    <div class="row">
        <div class="col-lg-3">
            <asp:Label ID="lbldate" runat="server" Text="Class Date: " Font-Bold="true" />
            <asp:TextBox ID="txtdate" runat="server" TextMode="Date" CssClass="form-control" />
        </div>
        <div class="col-lg-3">
            <asp:Label ID="lblclass" runat="server" Text="Select Class: " Font-Bold="true" />
            <asp:DropDownList ID="ddlClass" runat="server" AutoPostBack="true" CssClass="form-select"></asp:DropDownList>
        </div>
        <div class="col-lg-3 mt-4">
            <asp:Button ID="btnseearch" runat="server" OnClick="btnseearch_Click" Text="Search" class="btn btn-primary" />
        </div>
        <div class="col-lg-3 mt-4 text-end">
            <asp:Button ID="btnrefresh" runat="server" OnClick="btnrefresh_Click" Text="Refresh" class="btn btn-primary" />
        </div>
       
    </div>
    <div class="row">
        <br />
    </div>
    <asp:GridView ID="gvMarks" runat="server" AutoGenerateColumns="true" CssClass="table">
    <RowStyle BackColor="#EFF3FB" />
    <AlternatingRowStyle BackColor="White" />
    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Center" Height="30px" CssClass="cssPager" />
    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#BEC0D9" Font-Bold="True" ForeColor="Black" VerticalAlign="Middle" />
</asp:GridView>
</asp:Content>
