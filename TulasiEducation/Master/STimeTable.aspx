<%@ Page Title="" Language="C#" MasterPageFile="~/Master/StudentMaster.Master" AutoEventWireup="true" CodeBehind="STimeTable.aspx.cs" Inherits="TulasiEducation.Master.STimeTable" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .table-container {
            width: 100%;
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            min-width: 600px;
        }

        thead {
            background-color: #BEC0D9;
        }

        th {
            font-weight: bold;
            color: black;
            padding: 12px;
            border: 1px solid #ccc;
            vertical-align: middle;
        }

        tbody tr:nth-child(odd) {
            background-color: white;
        }

        tbody tr:nth-child(even) {
            background-color: #EFF3FB;
        }

        td {
            padding: 12px;
            border: 1px solid #ddd;
            color: #333;
        }

        .selected-row {
            background-color: #CC3333 !important;
            font-weight: bold;
            color: white;
        }

        .footer {
            background-color: #CCCC99;
            color: black;
            text-align: center;
            font-weight: bold;
        }

        .pager {
            background-color: white;
            color: black;
            text-align: center;
            padding: 10px;
            font-size: 14px;
        }

            .pager a {
                color: black;
                margin: 0 5px;
                text-decoration: none;
                font-weight: bold;
            }

                .pager a:hover {
                    text-decoration: underline;
                }
    </style>
    <div class="table-container">
        <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
            <h6 class="section-title bg-white text-center text-primary px-3">Time Table</h6>
            <h1 class="mb-5">Your Weekly Time Table Here!</h1>
        </div>
        <table>
            <thead>
                <tr>
                    <th>Weak</th>
                    <th>9-10</th>
                    <th>10-11</th>
                    <th>11-12</th>
                    <th>12-01</th>
                    <th>Lunch</th>
                    <th>02-03</th>
                    <th>03-04</th>
                    <th>04-05</th>
                    <th>05-06</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Monday</td>
                    <td>Maths 1A</td>
                    <td>Maths 1B</td>
                    <td>English</td>
                    <td>Chemistry</td>
                    <td>Lunch</td>
                    <td>Physics</td>
                    <td>N/A</td>
                    <td>Sanscrit</td>
                    <td>Exam</td>
                </tr>
                <tr>
                    <td>TuesDay</td>
                    <td>Maths 1A</td>
                    <td>Maths 1B</td>
                    <td>English</td>
                    <td>Chemistry</td>
                    <td>Lunch</td>
                    <td>Physics</td>
                    <td>N/A</td>
                    <td>Sanscrit</td>
                    <td>Exam</td>
                </tr>
                <tr>
                    <td>WednesDay</td>
                    <td>Maths 1A </td>
                    <td>Maths 1B</td>
                    <td>English</td>
                    <td>Chemistry</td>
                    <td>Lunch</td>
                    <td>Physics</td>
                    <td>N/A</td>
                    <td>Sanscrit</td>
                    <td>Exam</td>
                </tr>
                <tr>
                    <td>ThursDay</td>
                    <td>Maths 1A</td>
                    <td>Maths 1B</td>
                    <td>English</td>
                    <td>Chemistry</td>
                    <td>Lunch</td>
                    <td>Physics</td>
                    <td>N/A</td>
                    <td>Sanscrit</td>
                    <td>Exam</td>
                </tr>
                <tr>
                    <td>Friday</td>
                    <td>Maths 1A</td>
                    <td>Maths 1B</td>
                    <td>English</td>
                    <td>Chemistry</td>
                    <td>Lunch</td>
                    <td>Physics</td>
                    <td>N/A</td>
                    <td>Sanscrit</td>
                    <td>Exam</td>
                </tr>
                <tr>
                    <td>Saturday</td>
                    <td>Maths 1A </td>
                    <td>Maths 1B</td>
                    <td>English</td>
                    <td>Chemistry</td>
                    <td>Lunch</td>
                    <td>Physics</td>
                    <td>N/A</td>
                    <td>Sanscrit</td>
                    <td>Exam</td>
                </tr>
            </tbody>

        </table>
    </div>
</asp:Content>
