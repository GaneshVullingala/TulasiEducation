<%@ Page Title="" Language="C#" MasterPageFile="~/Master/StudentMaster.Master" AutoEventWireup="true" CodeBehind="SHome.aspx.cs" Inherits="TulasiEducation.Master.SHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .service-item {
            cursor: pointer;
        }
    </style>
    <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
        <h6 class="section-title bg-white text-center text-primary px-3">Hi, <span>
            <asp:Label ID="lblname" runat="server" Text="Student"></asp:Label></span></h6>
        <h1 class="mb-5">Welcome</h1>
    </div>
    <div class="container">
        <div class="row g-4">
            <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.5s" style="visibility: visible; animation-delay: 0.5s; animation-name: fadeInUp;">
                <div class="service-item text-center pt-3" onclick="window.location.href='SClassActivity.aspx';">
                    <div class="p-4">
                        <i class="fa fa-3x fa-solid fa-chart-line text-primary mb-4"></i>
                        <h5 class="mb-3">Daily Class Activity</h5>
                        <p>Click here for daily activity of your class</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.7s" style="visibility: visible; animation-delay: 0.7s; animation-name: fadeInUp;">
                <div class="service-item text-center pt-3" onclick="window.location.href='STimeTable.aspx';">
                    <div class="p-4">
                        <i class="fa fa-3x fa-solid fa-calendar text-primary mb-4"></i>
                        <h5 class="mb-3">Time Table</h5>
                        <p>Click here for your daily class timetable</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.7s" style="visibility: visible; animation-delay: 0.7s; animation-name: fadeInUp;">
                <div class="service-item text-center pt-3" onclick="window.location.href='StudentChat.aspx';">
                    <div class="p-4">
                        <i class="fa fa-3x fa-solid fa-user-plus text-primary mb-4"></i>
                        <h5 class="mb-3">1:1 Support</h5>
                        <p>Click here for your doubts clarification</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.7s" style="visibility: visible; animation-delay: 0.7s; animation-name: fadeInUp;">
                <div class="service-item text-center pt-3" onclick="window.location.href='SAttendence.aspx';">
                    <div class="p-4">
                        <i class="fa fa-3x fa-solid fa-calendar-day text-primary mb-4"></i>
                        <h5 class="mb-3">Attandance</h5>
                        <p>Click here for yor Daily Attandance Report</p>
                    </div>
                </div>
            </div>
             <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.7s" style="visibility: visible; animation-delay: 0.7s; animation-name: fadeInUp;">
                <div class="service-item text-center pt-3" onclick="window.location.href='SMarks.aspx';">
                    <div class="p-4">
                        <i class="fa fa-3x fa-solid fa-pen text-primary mb-4"></i>
                        <h5 class="mb-3">Internal Marks</h5>
                        <p>Click here for view your internal marks or reports..</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.7s" style="visibility: visible; animation-delay: 0.7s; animation-name: fadeInUp;">
                <div class="service-item text-center pt-3" onclick="window.location.href='Notification.aspx';">
                    <div class="p-4">
                        <i class="fa fa-3x fa-solid fa-bell text-primary mb-4"></i>
                        <h5 class="mb-3">Notification</h5>
                        <p>Click here for notifications of exams,holidays etc..</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.7s" style="visibility: visible; animation-delay: 0.7s; animation-name: fadeInUp;">
                <div class="service-item text-center pt-3" onclick="window.location.href='Feedback.aspx';">
                    <div class="p-4">
                        <i class="fa fa-3x fa-solid fa-comment text-primary mb-4"></i>
                        <h5 class="mb-3">Feedback</h5>
                        <p>Click here for Post feedback/complaints</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.7s" style="visibility: visible; animation-delay: 0.7s; animation-name: fadeInUp;">
                <div class="service-item text-center pt-3" onclick="window.location.href='Comingsoon.aspx';">
                    <div class="p-4">
                        <i class="fa fa-3x fa-solid fa-money-bill text-primary mb-4"></i>
                        <h5 class="mb-3">Fee</h5>
                        <p>Click here for access your fee information</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
