<%@ Page Title="" Language="C#" MasterPageFile="~/Master/TeacherMaster.Master" AutoEventWireup="true" CodeBehind="ClassActivity.aspx.cs" Inherits="TulasiEducation.Master.ClassActivity" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="lblActivityId" runat="server" Visible="false" />
    <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
        <h6 class="section-title bg-white text-center text-primary px-3">Daily Activity</h6>
        <h1 class="mb-5">Add A Class Activity</h1>
    </div>
    <div class="row">
        <div class="col-lg-3">
            <asp:Label ID="lbldate" runat="server" Text="Class Date: " Font-Bold="true" />
            <asp:TextBox ID="txtDate" runat="server" TextMode="Date" CssClass="form-control" />
        </div>
        <div class="col-lg-3">
            <asp:Label ID="lblclass" runat="server" Text="Select Class: " Font-Bold="true" />
             <asp:DropDownList ID="ddlClass" runat="server" cssclass="form-select"/>
        </div>
        <div class="col-lg-3">
            <asp:Label ID="lbldis" runat="server" Text="Enter Class Details: " Font-Bold="true" />
             <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="2" Columns="20" cssclass="form-control"/>
        </div>
        <div class="col-lg-3">
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" cssclass="btn btn-primary mt-4"/>
        </div>
    </div>

    <br />

    <asp:GridView ID="gvActivities" runat="server" Width="100%" AutoGenerateColumns="False" OnRowCommand="gvActivities_RowCommand" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" ForeColor="Black" GridLines="Horizontal" ShowFooter="false" CellSpacing="0" CellPadding="10" Font-Size="Small" AllowPaging="true" PageSize="10" PagerSettings-Position="Bottom" OnPageIndexChanging="gvActivities_PageIndexChanging">
        <Columns>
            <asp:BoundField DataField="ActivityDate" HeaderText="Date" />
            <asp:BoundField DataField="Qualification" HeaderText="Class" />
            <asp:BoundField DataField="Description" HeaderText="Description" />
            <asp:TemplateField HeaderText="Edit">
                <ItemTemplate>
                    <asp:Button ID="btnEdit" runat="server" Text="Edit" CommandName="EditActivity" CommandArgument='<%# Eval("ActivityID") %>' />
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

</asp:Content>
