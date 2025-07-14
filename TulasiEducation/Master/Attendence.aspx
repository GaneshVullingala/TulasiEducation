<%@ Page Title="" Language="C#" MasterPageFile="~/Master/HomeMaster.Master" AutoEventWireup="true" CodeBehind="Attendence.aspx.cs" Inherits="TulasiEducation.Master.Attendence" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
        <h6 class="section-title bg-white text-center text-primary px-3">Student Attendence</h6>
        <h1 class="mb-5">Daily Attendence</h1>
    </div>

    <div class="row" style="margin-bottom: 15px;">
        <div class="col-lg-3">
            <asp:Label ID="Label1" runat="server" Text="Select Class: " Font-Bold="true" />
            <asp:DropDownList ID="ddlclass" runat="server" CssClass="form-select" OnSelectedIndexChanged="ddlclass_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
        </div>
        <div class="col-lg-3">
            <asp:Label ID="lbldate" runat="server" Text="Attendance Date: " Font-Bold="true" />
            <asp:TextBox ID="txtdate" runat="server" TextMode="Date" CssClass="form-control" />
        </div>
        <div class="col-lg-3 mt-4">
            <asp:Button ID="btnSave" runat="server" Text="Save Attendance" CssClass="btn btn-primary" OnClick="btnSave_Click" />
        </div>
        <div class="col-lg-3 mt-4">
            <asp:Button ID="btnview" runat="server" Text="View Attendance" CssClass="btn btn-primary" OnClick="btnview_Click" />
        </div>
    </div>
    <div style="max-height: 400px; overflow-y: auto; padding: 10px; display: flex; justify-content: center;">
        <asp:Repeater ID="rptAttendanceChunks" runat="server">
            <ItemTemplate>
                <asp:GridView ID="gvChunk" runat="server" CssClass="grid" ShowHeader="true" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" ForeColor="Black" GridLines="Horizontal" AutoGenerateColumns="False" DataKeyNames="StudentId" CellSpacing="0" CellPadding="10" Font-Size="Small" style="margin-right: 20px;">
                    <Columns>
                        <asp:TemplateField HeaderText="Student ID">
                            <ItemTemplate>
                                <asp:Label ID="lblStudentid" runat="server" Text='<%# Eval("StudentId") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Student Name">
                            <ItemTemplate>
                                <asp:Label ID="lblStudentName" runat="server" Text='<%# Eval("fullname") %>' />
                                <asp:HiddenField ID="hdnStudentId" runat="server" Value='<%# Eval("StudentId") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Present">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkPresent" runat="server" AutoPostBack="false" />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Absent">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkAbsent" runat="server" AutoPostBack="false" />
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

                <div style="height: 15px;"></div>
                <%-- spacing between chunks --%>
            </ItemTemplate>
        </asp:Repeater>
    </div>

</asp:Content>
