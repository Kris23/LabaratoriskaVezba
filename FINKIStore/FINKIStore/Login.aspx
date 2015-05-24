<%@ Page Title="" Language="C#" MasterPageFile="~/Master1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="FINKIStore.Login1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentplaceHolder1" runat="server">
    <div style="width: 400px; margin: auto; padding-top: 10px; text-align:center; min-height: 535px;">
        <form id="form1" runat="server">
                <table style="margin:auto">
                    <tr>
                        <td>Корисничко име:</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:textbox id="tbUsername" runat="server"></asp:textbox>
                            <br />
                            <asp:requiredfieldvalidator id="RequiredFieldValidator1" runat="server" controltovalidate="tbUsername" display="Dynamic" errormessage="Внесете корисничко име" forecolor="Red"></asp:requiredfieldvalidator>

                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>

                        <td>Лозинка:</td>
                    </tr>

                    <tr>
                        <td>
                            <asp:textbox id="tbPassword" runat="server" textmode="Password"></asp:textbox>
                            <br />
                            <asp:requiredfieldvalidator id="RequiredFieldValidator2" runat="server" controltovalidate="tbPassword" display="Dynamic" errormessage="Внесете лозинка" forecolor="Red"></asp:requiredfieldvalidator>

                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;
                    <asp:label id="lblError" runat="server" forecolor="Red"></asp:label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:button id="btnLogin" runat="server" onclick="btnNajaviSe_Click" text="Најави се" width="160" />
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:button id="btnRegister" runat="server" text="Регистрирај се" width="160" onclick="btnRegister_Click" CausesValidation="False" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:button id="btnForgotPass" runat="server" text="Заборавена лозинка" width="160" onclick="btnForgoten" CausesValidation="False" />
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                    </tr>
                </table>
                <br />
        </form>
    </div>
</asp:Content>
