﻿<%@ Page Title="行程单" Language="C#" AutoEventWireup="true" CodeBehind="FastSanFightPrint.aspx.cs"
    Inherits="Web.print.bbl.FastSanFightPrint" MasterPageFile="~/masterpage/Print.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="PrintC1" runat="server">
    <table align="center" width="759">
        <tbody>
            <tr>
                <td height="30" class="normaltd">
                    <table class="table_normal2" width="100%">
                        <tbody>
                            <tr>
                                <th height="25" align="center" colspan="3">
                                    线路名称：<asp:Label ID="lblAreaName" runat="server" Text=""></asp:Label>
                                </th>
                            </tr>
                            <tr>
                                <td height="25" align="left" width="40%">
                                    团 号：
                                    <asp:Label ID="lblTeamNum" runat="server" Text=""></asp:Label>
                                    <asp:TextBox ID="txttourcode" runat="server" CssClass="nonelineTextBox"></asp:TextBox>
                                </td>
                                <td align="left" width="30%">
                                    旅游天数：<asp:Label ID="lblDay" runat="server" Text=""></asp:Label>
                                </td>
                                <td align="left" width="30%">
                                    人 数：
                                    <asp:Label ID="lblAdult" runat="server" Text=""></asp:Label>
                                    <asp:TextBox ID="TXTADULT" runat="server" CssClass="nonelineTextBox"></asp:TextBox>
                                    +
                                    <asp:Label ID="lblChild" runat="server" Text=""></asp:Label>
                                    <asp:TextBox ID="TXTCHILD" runat="server" CssClass="nonelineTextBox"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td height="25" align="left">
                                    出发交通：
                                    <asp:Label ID="lblBegin" runat="server" Text=""></asp:Label>
                                    <asp:TextBox ID="TXtBEGIN" runat="server" CssClass="nonelineTextBox"></asp:TextBox>
                                </td>
                                <td align="left" colspan="2">
                                    返程交通 ：
                                    <asp:Label ID="lblEnd" runat="server" Text=""></asp:Label>
                                    <asp:TextBox ID="TXTEnd" runat="server" CssClass="nonelineTextBox"></asp:TextBox>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
            <tr>
                <td height="10" align="center">
                </td>
            </tr>
            <tr>
                <td height="30" class="normaltd" align="center">
                    <table class="table_normal2" align="center" width="100%">
                        <tbody>
                            <tr>
                                <td height="20" align="left">
                                    <b>·行程安排</b>
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                                    <asp:Literal ID="litTravel" runat="server"></asp:Literal>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
            <tr>
                <th height="30" align="left">
                    ·服务标准
                </th>
            </tr>
            <tr>
                <td height="30" style="border: 1px solid rgb(0, 0, 0);">
                    <asp:Literal ID="litService" runat="server"></asp:Literal>
                </td>
            </tr>
            <asp:Panel ID="pnedij" runat="server">
                <tr>
                    <th height="30" align="left">
                        ·地接社信息
                    </th>
                </tr>
                <tr>
                    <td height="30">
                        <table class="table_normal2" align="center" width="100%">
                            <tbody>
                                <tr>
                                    <td height="20" align="center" width="33%">
                                        <b>地社名称</b>
                                    </td>
                                    <td height="20" align="center" width="33%">
                                        <b>许可证号</b>
                                    </td>
                                    <td height="20" align="center" width="33%">
                                        <b>电话</b>
                                    </td>
                                </tr>
                                <asp:Repeater ID="rptDjInfo" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td height="20" class="td_r_border" align="center" width="33%">
                                                <%#Eval("Name") %>
                                            </td>
                                            <td height="20" class="td_r_border" align="center" width="33%">
                                                <%#Eval("LicenseNo") %>
                                            </td>
                                            <td height="20" bgcolor="#ffffff" align="center" width="33%">
                                                <%#Eval("Telephone") %>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                    </td>
                </tr>
            </asp:Panel>
        </tbody>
    </table>
</asp:Content>
