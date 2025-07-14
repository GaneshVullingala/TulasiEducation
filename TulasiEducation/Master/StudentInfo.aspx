<%@ Page Title="" Language="C#" MasterPageFile="~/Master/HomeMaster.Master" AutoEventWireup="true" CodeBehind="StudentInfo.aspx.cs" Inherits="TulasiEducation.Master.StudentInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.4.1.min.js"></script>
    <script language="javascript">

        function ConfirmSave() {
            var confirm_value = document.querySelector('[name="confirm_value"]');
            if (!confirm_value) {
                confirm_value = document.createElement("INPUT");
                confirm_value.type = "hidden";
                confirm_value.name = "confirm_value";
                document.forms[0].appendChild(confirm_value);
            }
            if (confirm("Do you want to save the Country?")) {
                confirm_value.value = "Yes";
            } else {
                confirm_value.value = "No";
            }

        }
        function ConfirmModify() {
            var confirm_value = document.querySelector('[name="confirm_value"]');
            if (!confirm_value) {
                confirm_value = document.createElement("INPUT");
                confirm_value.type = "hidden";
                confirm_value.name = "confirm_value";
                document.forms[0].appendChild(confirm_value);
            }
            if (confirm("Do you want to modify the Country?")) {
                confirm_value.value = "Yes";
            } else {
                confirm_value.value = "No";
            }

        }
        function ConfirmDelete() {
            var confirm_value = document.querySelector('[name="confirm_value"]');
            if (!confirm_value) {
                confirm_value = document.createElement("INPUT");
                confirm_value.type = "hidden";
                confirm_value.name = "confirm_value";
                document.forms[0].appendChild(confirm_value);
            }
            if (confirm("Do you want to Delete the Country?")) {
                confirm_value.value = "Yes";
            } else {
                confirm_value.value = "No";
            }
        }
    </script>
    <style type="text/css">
        .cssPager td {
            padding-left: 5px;
            padding-right: 5px;
        }

        .cssPager span {
            background-color: lightgray;
            font-size: 18px;
        }
    </style>
    <div class="container">
          <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                <h6 class="section-title bg-white text-center text-primary px-3">Student Info</h6>
                <h1 class="mb-5">Student Information</h1>
            </div>
        <div class="row">
            <div class="col-md-4">
                <asp:Label ID="Label1" runat="server" Text="Search Students" Font-Names="Arial" Font-Size="19"></asp:Label>
            </div>
            <div class="col-md-4">
                <asp:TextBox ID="txt_search" runat="server" CssClass="txtbox" Width="250px" placeholder="Search by Name or Phone"></asp:TextBox>
                <asp:Button ID="btn_search" runat="server" Text="Search" CssClass="btnclass" Width="100px" CausesValidation="false" OnClick="btn_search_Click" />
            </div>
        </div>
        <hr style="border-color: #282E82" />
        <div class="row">
            <div class="col-md-12" style="overflow-x: auto;">
                <asp:GridView ID="grv_list" runat="server" Width="100%" DataKeyNames="Genid" AutoGenerateColumns="false" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" ForeColor="Black" GridLines="Horizontal" ShowFooter="false" CellSpacing="0" CellPadding="10" Font-Size="Small" AllowPaging="true" PageSize="10" PagerSettings-Position="Bottom" OnPageIndexChanging="grv_list_PageIndexChanging">
                    <Columns>
                        <asp:TemplateField ItemStyle-Width="15px">
                            <ItemStyle Height="35px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Genid">
                            <ItemTemplate>
                                <asp:Label ID="lbl_Code" runat="server" Text='<%# Eval("Genid") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Name">
                            <ItemTemplate>
                                <asp:Label ID="lbl_Name" runat="server" Text='<%# Eval("fullname") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Phone Number">
                            <ItemTemplate>
                                <asp:Label ID="lblphone" runat="server" Text='<%# Eval("Phone") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Qualification">
                            <ItemTemplate>
                                <asp:Label ID="lblqualification" runat="server" Text='<%# Eval("Qualification") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Email">
                            <ItemTemplate>
                                <asp:Label ID="lblemail" runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="City">
                            <ItemTemplate>
                                <asp:Label ID="lblcity" runat="server" Text='<%# Eval("Town") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Status">
                            <ItemTemplate>
                                <asp:Label ID="lblstatus" runat="server" Text='<%# Eval("Status") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="View/Edit">
                            <ItemTemplate>
                                <asp:HyperLink ID="lnkView" runat="server" Text="View" NavigateUrl='<%# Eval("GenID", "Addstudent.aspx?GenID={0}") %>'></asp:HyperLink>
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
            </div>
        </div>
    </div>

</asp:Content>
