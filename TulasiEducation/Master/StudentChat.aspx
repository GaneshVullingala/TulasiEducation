<%@ Page Title="" Language="C#" MasterPageFile="~/Master/StudentMaster.Master" AutoEventWireup="true" CodeBehind="StudentChat.aspx.cs" Inherits="TulasiEducation.Master.StudentChat" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script>
        function openChatPopup(chatId, sender) {
            document.getElementById("chatPopup").style.display = "block";
            loadChat(chatId, sender);
        }

        function closeChat() {
            document.getElementById("chatPopup").style.display = "none";
            location.reload(); // to show updated grid
        }

        function sendMessage() {
            var chatId = currentChatId;
            var message = document.getElementById("txtMessage").value;
            var fileInput = document.getElementById("fileUpload");
            var senderType = currentSender;

            var formData = new FormData();
            formData.append("chatId", chatId);
            formData.append("message", message);
            formData.append("sender", senderType);
            formData.append("file", fileInput.files[0]);

            fetch("SendMessageHandler.aspx", {
                method: "POST",
                body: formData
            }).then(response => response.text()).then(res => {
                loadChat(chatId, senderType); // reload messages
                document.getElementById("txtMessage").value = "";
                fileInput.value = "";
            });
        }

    </script>
    <style>
       .student-msg {
            text-align: right;
            background-color: #dcf8c6;
            padding: 8px;
            border-radius: 10px;
            margin: 5px;
        }

        .teacher-msg {
            text-align: left;
            background-color: #f1f0f0;
            padding: 8px;
            border-radius: 10px;
            margin: 5px;
            width: max-content;
        }


        .avatar {
           height: 50px;
           width: 50px;
           border-radius: 100%;
        }
    </style>
    <div class="row">
         <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                <h6 class="section-title bg-white text-center text-primary px-3">Doubt Section</h6>
                <h1 class="mb-5">Hassle free to ask your doubts</h1>
            </div>

        <div class="col-md-3">
            <asp:DropDownList ID="ddlTeacher" runat="server" CssClass="form-select"></asp:DropDownList>
        </div>
        <div class="col-md-3">
            <asp:DropDownList ID="ddlQueryType" runat="server" CssClass="form-select">
            <asp:ListItem Text="Subject Related" Value="Subject" />
            <asp:ListItem Text="Exam Related" Value="Exam" />
        </asp:DropDownList>
        </div>
       <div class="col-md-3">
            <asp:Button ID="btnStart" Text="Start Conversation" runat="server" OnClick="btnStart_Click" class="btn btn-primary" />
       </div>
    </div>
    <div class="row">
        <br />
    </div>
    <div class="row">
        <br />
    </div>
    <!-- Grid to show past chats -->
    <asp:GridView ID="gvChats" runat="server" AutoGenerateColumns="False" Width="100%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" ForeColor="Black" GridLines="Horizontal" CellSpacing="0" CellPadding="10" Font-Size="Small" AllowPaging="true">
        <Columns>
            <asp:BoundField HeaderText="Teacher Name" DataField="fullname" />
            <asp:BoundField HeaderText="Subject" DataField="Subject" />
            <asp:BoundField HeaderText="Query Type" DataField="QueryType" />
            <asp:BoundField HeaderText="Date" DataField="CreatedDate" />
            <asp:TemplateField HeaderText="View Chat">
                <ItemTemplate>
                    <asp:Button ID="btnView" Text="View" runat="server" CommandArgument='<%# Eval("ChatID") %>' OnClick="btnView_Click" />
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
    <div class="row">
        <br />
    </div>
    <div class="row">
        <div class="col-lg-3">
            <br />
        </div>
        <div class="col-lg-6">
            <asp:Panel ID="pnlChatPopup" runat="server" Visible="false" CssClass="chat-popup" Style="padding: 15px; margin-top: 20px; border-radius: 10px; box-shadow: 0px 0px 8px 0px;">
                  <div>
                    <div class="d-flex align-items-top flex-wrap">
                        <div class="me-2">
                            <span class="avatar">
                                <img src="../SiteImages/teacher.jpg" alt="" class="avatar">
                            </span>
                        </div>
                        <div class="flex-fill">
                            <p class="fw-semibold mb-0"><asp:Label ID="lblteachername" runat="server" Text="Teacher Name"></asp:Label></p>
                            <span class="text-muted fs-12"><asp:Label ID="lblsubject" runat="server"></asp:Label></span>
                        </div>
                        
                    </div>
                </div>
                
                
                <div style="max-height: 300px; overflow-y: auto; margin-bottom: 10px;" id="chatContainer" runat="server"></div>

                <asp:TextBox ID="txtMessage" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" Placeholder="Type your message here..."></asp:TextBox>
                <br />
                <asp:FileUpload ID="fuDocument" runat="server" />
                <br />
                <br />
                <asp:Button ID="btnSend" runat="server" Text="Send" CssClass="btn btn-primary" OnClick="btnSend_Click" />
                <asp:Button ID="btnClose" runat="server" Text="Close" CssClass="btn btn-secondary" OnClick="btnClose_Click" />
            </asp:Panel>
        </div>
        <div class="col-lg-3">
            <br />
        </div>
    </div>
</asp:Content>
