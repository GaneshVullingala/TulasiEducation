<%@ Page Title="" Language="C#" MasterPageFile="~/Master/TeacherMaster.Master" AutoEventWireup="true" CodeBehind="THome.aspx.cs" Inherits="TulasiEducation.Master.THome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .service-item {
            cursor: pointer;
        }
    </style>
    <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
        <h6 class="section-title bg-white text-center text-primary px-3">Hi, <span>
            <asp:Label ID="txtname" runat="server"></asp:Label></span></h6>
        <h1 class="mb-5">Welcome</h1>
    </div>
    <div class="container">
        <div class="row g-4">
            <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.1s" style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInUp;">
                <div class="service-item text-center pt-3" onclick="window.location.href='studentinfo.aspx';">
                    <div class="p-4">
                        <i class="fa fa-3x fa-solid fa-users text-primary mb-4"></i>
                        <h5 class="mb-3">Student Info</h5>
                        <p>You have <span>
                            <asp:Label ID="lblstudentscount" runat="server"></asp:Label></span> + students, click here for information</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.5s" style="visibility: visible; animation-delay: 0.5s; animation-name: fadeInUp;">
                <div class="service-item text-center pt-3" onclick="window.location.href='ClassActivity.aspx';">
                    <div class="p-4">
                        <i class="fa fa-3x fa-solid fa-chart-line text-primary mb-4"></i>
                        <h5 class="mb-3">Daily Class Activity</h5>
                        <p>Click here for your daily class activity</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.7s" style="visibility: visible; animation-delay: 0.7s; animation-name: fadeInUp;">
                <div class="service-item text-center pt-3" onclick="window.location.href='TTimeTable.aspx';">
                    <div class="p-4">
                        <i class="fa fa-3x fa-solid fa-calendar text-primary mb-4"></i>
                        <h5 class="mb-3">Time Table</h5>
                        <p>Click here for your daily Schedule/Timetable</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.7s" style="visibility: visible; animation-delay: 0.7s; animation-name: fadeInUp;">
                <div class="service-item text-center pt-3" onclick="window.location.href='Attendence.aspx';">
                    <div class="p-4">
                        <i class="fa fa-3x fa-solid fa-calendar-day text-primary mb-4"></i>
                        <h5 class="mb-3">Attandance</h5>
                        <p>Click here for Add/View Daily Student Attandance</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.7s" style="visibility: visible; animation-delay: 0.7s; animation-name: fadeInUp;">
                <div class="service-item text-center pt-3" onclick="window.location.href='AddStudent.aspx';">
                    <div class="p-4">
                        <i class="fa fa-3x fa-solid fa-user-plus text-primary mb-4"></i>
                        <h5 class="mb-3">Add new student</h5>
                        <p>Click here add a new student into your institution</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.7s" style="visibility: visible; animation-delay: 0.7s; animation-name: fadeInUp;">
                <div class="service-item text-center pt-3" onclick="window.location.href='TeacherChat.aspx';">
                    <div class="p-4">
                        <i class="fa fa-3x fa-solid fa-user-plus text-primary mb-4"></i>
                        <h5 class="mb-3">1:1 Support</h5>
                        <p>Click here for students doubts clarification</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.7s" style="visibility: visible; animation-delay: 0.7s; animation-name: fadeInUp;">
                <div class="service-item text-center pt-3" onclick="window.location.href='TMarks.aspx';">
                    <div class="p-4">
                        <i class="fa fa-3x fa-solid fa-pen text-primary mb-4"></i>
                        <h5 class="mb-3">Marks Upload</h5>
                        <p>Click here for upload internal marks or reports..</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.7s" style="visibility: visible; animation-delay: 0.7s; animation-name: fadeInUp;">
                <div class="service-item text-center pt-3" onclick="window.location.href='Notification.aspx';">
                    <div class="p-4">
                        <i class="fa fa-3x fa-solid fa-bell text-primary mb-4"></i>
                        <h5 class="mb-3">Notification</h5>
                        <p>Click here for view notification for exams,holidays,curreculam etc..</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.7s" style="visibility: visible; animation-delay: 0.7s; animation-name: fadeInUp;">
                <div class="service-item text-center pt-3" onclick="window.location.href='Comingsoon.aspx';">
                    <div class="p-4">
                        <i class="fa fa-3x fa-solid fa-coins text-primary mb-4"></i>
                        <h5 class="mb-3">Salary</h5>
                        <p>Click here for detailes of your Salary</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>