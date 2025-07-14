<%@ Page Title="" Language="C#" MasterPageFile="~/Master/HomeMaster.Master" AutoEventWireup="true" CodeBehind="TimeTable.aspx.cs" Inherits="TulasiEducation.Master.TimeTable" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        select {
            border-color: #bec0d9;
            border-radius: 5px;
        }
    </style>
    <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
        <h6 class="section-title bg-white text-center text-primary px-3">Time Table</h6>
        <h1 class="mb-5">Add new Time table</h1>
    </div>

    <div class="row">
        <div class="col-lg-3">
            <asp:Label ID="lblStartDate" runat="server" Text="Timetable Start Date: " Font-Bold="true" />
            <asp:TextBox ID="txtStartDate" runat="server" TextMode="Date" CssClass="form-control" />
        </div>
        <div class="col-lg-3">
            <asp:Label ID="lblEndDate" runat="server" Text="End Date: " Font-Bold="true"/>
            <asp:TextBox ID="txtEndDate" runat="server" TextMode="Date" CssClass="form-control"/>
        </div>
         <div class="col-lg-3">
            <asp:Label ID="lblclass" runat="server" Text="Select Class: " Font-Bold="true"/>
            <asp:DropDownList ID="ddlClass" runat="server" CssClass="form-select"></asp:DropDownList>
        </div>
         <div class="col-lg-3 mt-4 text-end">
             <asp:Button ID="Button1" runat="server" Text="View All Time Tables" CssClass="btn btn-primary p-2 px-4" style="border-radius: 10px;"/>
        </div>
    </div>
    
    <br />
    <br />
    <asp:GridView ID="gvTimeTable" runat="server" AutoGenerateColumns="False" OnRowDataBound="gvTimeTable_RowDataBound" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" ForeColor="Black" GridLines="Horizontal" Width="100%" ShowFooter="false" CellSpacing="0" CellPadding="10" Font-Size="Small">
        <Columns>
            <asp:BoundField DataField="Week" HeaderText="Week" />
            <%-- Time Periods --%>
            <asp:TemplateField HeaderText="9-10">
                <ItemTemplate>
                    <asp:DropDownList ID="ddlPeriod1" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="10-11">
                <ItemTemplate>
                    <asp:DropDownList ID="ddlPeriod2" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="11-12">
                <ItemTemplate>
                    <asp:DropDownList ID="ddlPeriod3" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="12-13">
                <ItemTemplate>
                    <asp:DropDownList ID="ddlPeriod4" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Lunch">
                <ItemTemplate>
                    <asp:Label ID="lblLunch" runat="server" Text="LUNCH" />
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="2-3">
                <ItemTemplate>
                    <asp:DropDownList ID="ddlPeriod5" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="3-4">
                <ItemTemplate>
                    <asp:DropDownList ID="ddlPeriod6" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="4-5">
                <ItemTemplate>
                    <asp:DropDownList ID="ddlPeriod7" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="5-6">
                <ItemTemplate>
                    <asp:DropDownList ID="ddlPeriod8" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <RowStyle BackColor="#EFF3FB" />
        <AlternatingRowStyle BackColor="White" />
        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Center" Height="30px" CssClass="cssPager" />
        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#BEC0D9" Font-Bold="True" ForeColor="Black" VerticalAlign="Middle" />
    </asp:GridView>

    <br />
    <div class="text-center">
        <asp:Button ID="btnSave" runat="server" Text="Save Timetable" OnClick="btnSave_Click" CssClass="btn btn-primary p-2 px-4" style="border-radius: 10px;"/>

    </div>
</asp:Content>
