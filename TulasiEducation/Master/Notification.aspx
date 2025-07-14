<%@ Page Title="" Language="C#" MasterPageFile="~/Master/HomeMaster.Master" AutoEventWireup="true" CodeBehind="Notification.aspx.cs" Inherits="TulasiEducation.Master.Notification" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .card {
            border-radius: 12px;
            background: #f8f9fa;
            border-left: 4px solid #343a40;
        }

            .card h5 {
                margin: 0 0 5px 0;
            }

            .card p {
                margin: 0;
            }
    </style>

    <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
        <h6 class="section-title bg-white text-center text-primary px-3">Notifications</h6>
        <h1 class="mb-5">Notifications or Events</h1>
    </div>
    <div class="row">
        <br />
    </div>
    <div id="divinputs" runat="server">


        <asp:DropDownList ID="ddlQryType" runat="server" CssClass="form-control">
            <asp:ListItem Text="-- Select Type --" Value="" />
            <asp:ListItem Text="Exams" Value="Exams" />
            <asp:ListItem Text="Holidays" Value="Holidays" />
            <asp:ListItem Text="Others" Value="Others" />
        </asp:DropDownList>

        <asp:TextBox ID="txtStatement" runat="server" TextMode="MultiLine" CssClass="form-control" Rows="3" />

        <asp:Button ID="btnSubmit" runat="server" Text="Post Notification" CssClass="btn btn-primary mt-2" OnClick="btnSubmit_Click" />

        <hr />
    </div>
    <asp:Repeater ID="rptNotifications" runat="server">
        <ItemTemplate>
            <div class="card my-2 shadow-sm p-3">
                <div class="d-flex justify-content-between">
                    <div>
                        <h5><%# Eval("QryType") %></h5>
                        <p><%# Eval("Statement") %></p>
                        <small class="text-muted"><%# GetTimeAgo(Eval("CreatedOn")) %></small>
                    </div>
                    <div>
                        <p>Posted On</p>
                        <small class="text-muted"><%# Eval("CreatedOn") %></small>
                    </div>
                </div>

            </div>
        </ItemTemplate>
    </asp:Repeater>

</asp:Content>
