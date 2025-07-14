<%@ Page Title="" Language="C#" MasterPageFile="~/Master/StudentMaster.Master" AutoEventWireup="true" CodeBehind="SAttendence.aspx.cs" Inherits="TulasiEducation.Master.SAttendence" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
        <h6 class="section-title bg-white text-center text-primary px-3">Attendance</h6>
        <h1 class="mb-5">Your daily attendance here</h1>
    </div>
    <style>
        .present-day {
            background-color: green !important;
            border-radius: 50%;
            padding: 8px;
        }

        .absent-day {
            background-color: red !important;
            border-radius: 50%;
            padding: 8px;
        }

        .custom-calendar {
            width: auto;
            font-size: 12px;
        }

            .custom-calendar td, .custom-calendar th {
                padding: 5px;
            }

        /* Style for tablets and larger screens */
        @media screen and (min-width: 768px) {
            .custom-calendar {
                width: 100%;
                font-size: 16px;
            }

                .custom-calendar td, .custom-calendar th {
                    padding: 15px;
                }
        }
    </style>
    <div class="row">
        <div class="col-lg-4">
            <br />
        </div>
        <div class="col-lg-4">
            <div style="margin: auto; display: flex; justify-content: center;">
                <asp:Calendar ID="calAttendance" runat="server" OnDayRender="calAttendance_DayRender" CssClass="custom-calendar" />
            </div>
        </div>
        <div class="col-lg-4">
            <br />
        </div>
    </div>

</asp:Content>
