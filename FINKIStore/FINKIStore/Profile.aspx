<%@ Page Title="" Language="C#" MasterPageFile="~/Master1.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="FINKIStore.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentplaceHolder1" runat="server">
    <style>
        .left {
            // width: 200px;
            float: left;
            margin-left: 30px;
            margin-right: 10px;
            font-weight: bold;
        }

        .left2 {
            width: 200px;
            float: left;
            margin-left: 30px;
            font-weight: bold;
        }

        .row {
            clear: both;
            padding: 5px;
        }

        .caption {
            background: #c9c9c9;
            font-size: 15px;
            margin-top: 10px;
            padding-left: 10px;
        }
    </style>
    <form runat="server">
        <div style="width: 650px; margin: auto;">
            <ul class="nav nav-tabs" role="tablist" id="myTab">
                <li class="active"><a href="#profile" role="tab" data-toggle="tab">Профил</a></li>
                <li><a href="#shoppingchart" role="tab" data-toggle="tab">Моја кошничка</a></li>
            </ul>

            <div class="tab-content">
                <div class="tab-pane active" id="profile">
                    <div id="userINFO">
                        <div class="caption">Лични податоци:</div>
                        <div style="float: right; margin: 25px; height: 242px; width: 182px; border: 1px solid black;">
                            <asp:Image ID="image" runat="server" />
                        </div>
                        </br>
                <div style="float: left;">
                    <div class="row" style="height: 8px"></div>
                    <div class="row">
                        <div class="left">Име:</div>
                        <div style="float: left;">
                            <asp:Label ID="lblFirstName" runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                    </br>
                    <div class="row">
                        <div class="left">Презиме:</div>
                        <asp:Label ID="lblLastName" runat="server" Text=""></asp:Label>
                    </div>
                    </br>
                    <div class="row">
                        <div class="left">Адреса: </div>
                        <asp:Label ID="lblAdress" runat="server" Text=""></asp:Label>
                    </div>
                    </br>
                    <div class="row">
                        <div class="left">Телефон: </div>
                        <asp:Label ID="lblPhone" runat="server" Text=""></asp:Label>
                    </div>
                    </br>
                    <div class="row">
                        <div class="left">Е-пошта: </div>
                        <asp:Label ID="lblEmail" runat="server" Text=""></asp:Label>
                    </div>

                </div>
                        <div style="clear: both;"></div>
                    </div>
                    <div id="changePassword">
                        <div class="caption">Податоци за сметка:</div>
                        <div class="row">
                            <div class="left">Корисничко име: </div>
                            <asp:Label ID="lblUsername" runat="server"></asp:Label>
                        </div>
                        <div class="row">
                            <div class="left2">Моемнтална лозинка: </div>
                            <asp:TextBox ID="tbCurrentPassword" runat="server" Width="200" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbCurrentPassword" Display="Dynamic" ErrorMessage="Полето не може да биде празно" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <div class="row">
                            <div class="left2">Нова лозинка: </div>
                            <asp:TextBox ID="tbNewPassword" runat="server" Width="200" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbNewPassword" Display="Dynamic" ErrorMessage="Полето не смее да биде празно" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <div class="row">
                            <div class="left2">Потврди нова лозинка: </div>
                            <asp:TextBox ID="tbNewPassword2" runat="server" Width="200" TextMode="Password"></asp:TextBox>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="tbNewPassword2" ControlToValidate="tbNewPassword" ErrorMessage="Лозинките не се совпаѓаат" ForeColor="Red"></asp:CompareValidator>
                        </div>
                        <div class="row" style="margin-left: 215px;">
                            <asp:Button ID="bthChangePassword" runat="server" Text="Промени лозинка" Width="200" OnClick="bthChangePassword_Click" />
                        </div>
                        <div class="row" style="margin-left: 215px;">
                            <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                </div>
                <div class="tab-pane" id="shoppingchart">...</div>
            </div>
        </div>
    </form>
    <script>
        $(function () {
            $('#myTab a:first').tab('show')
        })
    </script>
</asp:Content>
