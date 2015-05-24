<%@ Page Title="" Language="C#" MasterPageFile="~/Master1.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="FINKIStore.Register1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentplaceHolder1" runat="server">
    <style>
        tr.highlight td {
            padding-bottom: 10px;
        }

        .tdStyle {
            width: 260px;
            height: 26px;
        }
    </style>
    <form id="form1" runat="server">
    <div style="width: 550px; margin: auto;">
            <asp:ValidationSummary ID="ValidationSummary" runat="server" ForeColor="Red" />
            <asp:Label ID="lblError" runat="server" Text="Настана грешка при додавањето. Корисничкото име мора да е единствено." ForeColor="Red" Visible="False"></asp:Label>

            <table style="margin: auto; text-align:center">
                <tr>
                    <td colspan="2" style="background-color: #bcbcbc; text-align: center;">Лични податоци
                    </td>
                </tr>
                <tr class="highlight">
                    <td colspan="2">
                        <asp:RequiredFieldValidator ID="rfVFirstName" runat="server" ControlToValidate="tbName" Display="None" ErrorMessage="Полето за име е задолжително" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="tbAddress" Display="None" ErrorMessage="Полето за адреса е задолжително"  ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator ID="rfVCity" runat="server" ControlToValidate="tbCity" Display="None" ErrorMessage="Полето за град/населено место е задолжително"  ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator ID="rfVPhone" runat="server" ControlToValidate="tbPhone" Display="None" ErrorMessage="Полето за телефон е задолжително"  ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="tbEmail" Display="None" ErrorMessage="Полето за е-пошта место е задолжително"  ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator ID="rfVUsername" runat="server" ControlToValidate="tbUsername" Display="None" ErrorMessage="Полето за корисничко име е задолжително"  ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator ID="rfVPassword" runat="server" ControlToValidate="tbPassword" Display="None" ErrorMessage="Полето за лозинка е задолжително"  ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator ID="rfVRePassword" runat="server" ControlToValidate="tbRePassword" Display="None" ErrorMessage="Полето за повтори лозинка е задолжително"  ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                       
                        <asp:CompareValidator ID="PasswordCompare" runat="server" ErrorMessage="Лозинките не се совпаѓаат" ControlToCompare="tbPassword" ControlToValidate="tbRePassword" Display="None" SetFocusOnError="True"></asp:CompareValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tbPhone" Display="None" ErrorMessage="Формат на телефон: 07ххххххх" ValidationExpression="\d{9}"  ForeColor="Red" SetFocusOnError="True"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align:center; margin-left: 130px;">
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" TextAlign="Left" RepeatDirection="Horizontal" CssClass="st" Height="19px" Width="466px">
                            <asp:ListItem Value="0" Selected="True">Физичко лице</asp:ListItem>
                            <asp:ListItem Value="1">Фирма</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                
                <tr>
                    <td  colspan="2">Име и презиме / Име на фирма:<asp:Label ID="Label1" runat="server" ForeColor="Red" Text="*"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:TextBox ID="tbName" runat="server" Width="220"></asp:TextBox>
                    </td>
                </tr>
                <tr class="highlight">
                    <td></td>
                </tr>
                <tr>
                    <td colspan="2" style="background-color: #bcbcbc; height: 20px; text-align: center;">Контакт</td>
                </tr>
                <tr class="highlight">
                    <td></td>
                </tr>

                <tr>
                    <td class="tdStyle">Адреса:<asp:Label ID="Label16" runat="server" ForeColor="Red" Text="*"></asp:Label>
                    </td>
                    <td class="tdStyle">Град / Населено место:<asp:Label ID="Label17" runat="server" ForeColor="Red" Text="*"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="tdStyle">
                        <asp:TextBox ID="tbAddress" runat="server" Width="220"></asp:TextBox>
                    </td>
                    <td class="tdStyle">
                        <asp:TextBox ID="tbCity" runat="server" Width="220"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="tdStyle">Мобилен телефон:<asp:Label ID="Label10" runat="server" ForeColor="Red" Text="*"></asp:Label>
                    </td>
                    <td class="tdStyle">Е-пошта:<asp:Label ID="Label15" runat="server" ForeColor="Red" Text="*"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="tdStyle">
                        <asp:TextBox ID="tbPhone" runat="server" Width="220" TextMode="Phone"></asp:TextBox>
                    </td>
                    <td class="tdStyle">
                        <asp:TextBox ID="tbEmail" runat="server" Width="220" TextMode="Email"></asp:TextBox>
                    </td>
                </tr>
                <tr class="highlight">
                    <td></td>
                </tr>

                <tr>
                    <td colspan="2" style="height: 20px; background-color: #bcbcbc; text-align: center;">Членство</td>
                </tr>
                <tr class="highlight">
                    <td></td>
                </tr>
                <tr>
                    <td class="tdStyle">Корисничко име:<asp:Label ID="Label11" runat="server" ForeColor="Red" Text="*"></asp:Label>
                    </td>
                    <td class="tdStyle">Лозинка:<asp:Label ID="Label12" runat="server" ForeColor="Red" Text="*"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="tdStyle">
                        <asp:TextBox ID="tbUsername" runat="server" Width="220"></asp:TextBox>
                    </td>
                    <td class="tdStyle">
                        <asp:TextBox ID="tbPassword" runat="server" Width="220" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="tdStyle">&nbsp;</td>
                    <td class="tdStyle">Повтори лозинка:<asp:Label ID="Label14" runat="server" ForeColor="Red" Text="*"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="tdStyle">
                        &nbsp;</td>
                    <td class="tdStyle">
                        <asp:TextBox ID="tbRePassword" runat="server" Width="220" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr class="highlight">
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <asp:Button ID="btnAddUser" runat="server" Text="Регистрирај се !" OnClick="btnAddUser_Click" Width="300" />
                    </td>
                </tr>
                <tr class="highlight">
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</asp:Content>
