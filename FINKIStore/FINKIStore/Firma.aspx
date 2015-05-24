<%@ Page Title="" Language="C#" MasterPageFile="~/Master1.Master" AutoEventWireup="true" CodeBehind="Firma.aspx.cs" Inherits="FINKIStore.Firma" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentplaceHolder1" runat="server">
    <style>
        .left {
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
    <form id="Form2" runat="server">
        <div style="width: 650px; margin: auto;">
            <asp:ImageButton ID="ImageButton2" runat="server" OnClick="ImageButton2_Click" />
            <asp:ImageButton ID="ImageButton1" runat="server" AlternateText="Додади продукт" Height="32px" ImageUrl="~/Content/image/add.png" OnClick="btnAddProduct_Click1" ToolTip="Додади продукт" Width="32px"></asp:ImageButton>
            <ul class="nav nav-tabs" role="tablist" id="myTab">
                <li class="active"><a href="#products" role="tab" data-toggle="tab">Мои производи</a></li>
                <li><a href="#profile" role="tab" data-toggle="tab">Профил</a></li>
            </ul>

            <div class="tab-content">
                <div class="tab-pane active" id="products">
                    <div style="margin-top: 10px; margin-right: 20px; float: right; margin-bottom: 10px;">
                        <div style="float: left;">
                            <asp:ImageButton ID="btnAddProduct" runat="server" AlternateText="Додади продукт" Height="32px" ImageUrl="~/Content/image/add.png" OnClick="btnAddProduct_Click1" ToolTip="Додади продукт" Width="32px"></asp:ImageButton>
                        </div>
                        <div id="divAddProduct" style="height: 32px; float: left; padding-top: 7px; padding-left: 5px; cursor: pointer;">
                            <asp:Label Text="Додади продукт" runat="server" ID="lblAddProduct"></asp:Label>
                        </div>
                    </div>
                    </br>
                    <asp:GridView ID="gvFirma" runat="server" Height="167px" Width="650px" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" OnRowCancelingEdit="gvFirma_RowCancelingEdit" OnRowEditing="gvFirma_RowEditing" OnRowUpdating="gvFirma_RowUpdating" OnRowDeleting="gvFirma_RowDeleting">
                        <Columns>
                            <asp:BoundField HeaderText="Производи" DataField="ime"></asp:BoundField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:HiddenField ID="hdnProductId" runat="server" Value=' <%#Eval("idProduct") %>' />
                                    <div>
                                        <div style="color: red"><strong><span class="auto-style1">Цена:</span></strong><span class="auto-style1"></span></div>
                                        <%#Eval("cena") %>
                                    </div>
                                    <div>
                                        <div style="color: red"></span><strong><span class="auto-style1">Количина:</span></strong></div>
                                        <%#Eval("kolicina") %>
                                    </div>
                                    <div>
                                        <div style="color: red"><strong><span class="auto-style1">Категорија:</span></strong><span class="auto-style1"></span></div>
                                        <%#Eval("kategorija") %>
                                    </div>
                                    <div>
                                        <div style="color: red"><strong><span class="auto-style1">Опис:</span></strong><span class="auto-style1"></span></div>
                                        <%#Eval("opis") %>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField CancelText="Откажи" EditText="Уреди" SelectText="" ShowEditButton="True" UpdateText="Промени" />
                            <asp:CommandField DeleteText="Избриши" ShowDeleteButton="True" />
                        </Columns>
                        <PagerStyle BorderStyle="Double" />
                        <EmptyDataTemplate>Нема продукти за прикажување...</EmptyDataTemplate>
                    </asp:GridView>
                    <asp:Label ID="lblPoraka1" runat="server" Text="lblPoraka1"></asp:Label>
                    </>
                </div>
                <div class="tab-pane" id="profile">
                    <div id="userINFO">
                        <div class="caption">Лични податоци:</div>
                        <div style="float: right; margin: 25px; height: 242px; width: 182px; border: 1px solid black;">
                            <asp:Image ID="image" runat="server" />
                        </div>
                        </br>
                <div style="float: left; width: 350px;">
                    <div class="row" style="height: 8px"></div>
                    <div class="row">
                        <div class="left">Име и Презиме:</div>
                        <div style="float: left;">
                            <asp:Label ID="lblFirstName" runat="server" Text=""></asp:Label>
                        </div>
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
                            <div class="left" style="width: 190px">Корисничко име:</div>
                            <asp:Label ID="lblUsername" runat="server"></asp:Label>
                        </div>
                        <div class="row">
                            <div class="left2">Моментална лозинка: </div>
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
            </div>
        </div>
    </form>
    <script>
        $(function () {
            $('#myTab a:first').tab('show')
        })

    </script>
</asp:Content>
