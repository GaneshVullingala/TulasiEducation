<%@ Page Title="" Language="C#" MasterPageFile="~/Master/StudentMaster.Master" AutoEventWireup="true" CodeBehind="SMarks.aspx.cs" Inherits="TulasiEducation.Master.SMarks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
        <h6 class="section-title bg-white text-center text-primary px-3">Progress Report</h6>
        <h1 class="mb-5">Your Internal Exams Results</h1>
    </div>

    <div class="row">
        <div class="col-md-12" style="overflow-x: auto;">
            <asp:GridView ID="grv_list" runat="server" Width="100%" DataKeyNames="MarksID" AutoGenerateColumns="false" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" ForeColor="Black" GridLines="Horizontal" ShowFooter="false" CellSpacing="0" CellPadding="10" Font-Size="Small" AllowPaging="true" PageSize="10" PagerSettings-Position="Bottom" OnPageIndexChanging="grv_list_PageIndexChanging">
                <Columns>
                    <asp:TemplateField ItemStyle-Width="15px">
                        <ItemStyle Height="35px" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Exam Type">
                        <ItemTemplate>
                            <asp:Label ID="lbl_Code" runat="server" Text='<%# Eval("ExamType") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Subject">
                        <ItemTemplate>
                            <asp:Label ID="lbl_Name" runat="server" Text='<%# Eval("Subject1") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Total Marks">
                        <ItemTemplate>
                            <asp:Label ID="lblphone" runat="server" Text='<%# Eval("TotalMarks") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Obtained Marks">
                        <ItemTemplate>
                            <asp:Label ID="lblqualification" runat="server" Text='<%# Eval("ObtainedMarks") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Posted On">
                        <ItemTemplate>
                            <asp:Label ID="lblemail" runat="server" Text='<%# Eval("CreatedDate") %>'></asp:Label>
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

</asp:Content>
