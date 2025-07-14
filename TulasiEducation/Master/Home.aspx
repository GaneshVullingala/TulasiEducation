<%@ Page Title="" Language="C#" MasterPageFile="~/Master/HomeMaster.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="TulasiEducation.Master.Home" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .service-item{
            cursor: pointer;
        }
    </style>
    <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
        <h6 class="section-title bg-white text-center text-primary px-3">Hi, Admin</h6>
        <h1 class="mb-5">Welcome</h1>
    </div>
    <div class="container">
            <div class="row g-4">
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.1s" style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInUp;">
                    <div class="service-item text-center pt-3" onclick="window.location.href='studentinfo.aspx';">
                        <div class="p-4">   
                            <i class="fa fa-3x fa-solid fa-users text-primary mb-4"></i>
                            <h5 class="mb-3">Student Info</h5>
                            <p>You have <span><asp:Label ID="lblstudentscount" runat="server"></asp:Label></span> + students, click here for information</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.3s" style="visibility: visible; animation-delay: 0.3s; animation-name: fadeInUp;">
                    <div class="service-item text-center pt-3" onclick="window.location.href='Teacherinfo.aspx';">
                        <div class="p-4">
                            <i class="fa fa-3x fa-solid fa-user text-primary mb-4"></i>
                            <h5 class="mb-3">Teacher Info</h5>
                           <p>You have <span><asp:Label ID="lblteachercount" runat="server"></asp:Label></span> + skilled professionals, click here for info</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.5s" style="visibility: visible; animation-delay: 0.5s; animation-name: fadeInUp;">
                    <div class="service-item text-center pt-3" onclick="window.location.href='SClassActivity.aspx';">
                        <div class="p-4">
                            <i class="fa fa-3x fa-solid fa-chart-line text-primary mb-4"></i>
                            <h5 class="mb-3">Daily Class Activity</h5>
                            <p>Click here for daily class activity on your entire institution</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.7s" style="visibility: visible; animation-delay: 0.7s; animation-name: fadeInUp;">
                    <div class="service-item text-center pt-3" onclick="window.location.href='TimeTable.aspx';">
                        <div class="p-4">
                            <i class="fa fa-3x fa-solid fa-calendar text-primary mb-4"></i>
                            <h5 class="mb-3">Time Table</h5>
                            <p>Click here for add/modify or view timetable</p>
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
                    <div class="service-item text-center pt-3" onclick="window.location.href='AddTeacher.aspx';">
                        <div class="p-4">
                            <i class="fa fa-3x fa-solid fa-address-card text-primary mb-4"></i>
                            <h5 class="mb-3">Add new teacher</h5>
                            <p>Click here for add new teacher or other professional staff</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.7s" style="visibility: visible; animation-delay: 0.7s; animation-name: fadeInUp;">
                    <div class="service-item text-center pt-3" onclick="window.location.href='Notification.aspx';">
                        <div class="p-4">
                            <i class="fa fa-3x fa-solid fa-bell text-primary mb-4"></i>
                            <h5 class="mb-3">Notification</h5>
                            <p>Click here for add a notifications for exams,holidays etc..</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.7s" style="visibility: visible; animation-delay: 0.7s; animation-name: fadeInUp;">
                    <div class="service-item text-center pt-3" onclick="window.location.href='Feedback.aspx';">
                        <div class="p-4">
                            <i class="fa fa-3x fa-solid fa-comment text-primary mb-4"></i>
                            <h5 class="mb-3">Feedback</h5>
                            <p>Click here for view students feedback/complaints</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.7s" style="visibility: visible; animation-delay: 0.7s; animation-name: fadeInUp;">
                    <div class="service-item text-center pt-3" onclick="window.location.href='Comingsoon.aspx';">
                        <div class="p-4">
                            <i class="fa fa-3x fa-solid fa-money-bill text-primary mb-4"></i>
                            <h5 class="mb-3">Fee</h5>
                            <p>Click here for access student fee information</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.7s" style="visibility: visible; animation-delay: 0.7s; animation-name: fadeInUp;">
                    <div class="service-item text-center pt-3" onclick="window.location.href='Comingsoon.aspx';">
                        <div class="p-4">
                            <i class="fa fa-3x fa-solid fa-coins text-primary mb-4"></i>
                            <h5 class="mb-3">Salary</h5>
                            <p>Click here for Manage Teaching / Non-Teaching Staff Salary</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</asp:Content>
