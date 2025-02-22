﻿<%@ Page Title="客户回访_质量管理_客户关系管理" Language="C#" MasterPageFile="~/masterpage/Back.Master" AutoEventWireup="true" CodeBehind="CustomerVisit.aspx.cs" Inherits="Web.CRM.customerservice.CustomerVisit" %>
<%@ Register Src="~/UserControl/ucCRM/CustomerServiceHeader.ascx" TagName="headerMenu" TagPrefix="uc1" %>
<%@ Register Assembly="ControlLibrary" Namespace="Adpost.Common.ExportPageSet" TagPrefix="uc2" %>
<%@ Register Assembly="ControlLibrary" Namespace="ControlLibrary" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="c1" runat="server">
<div class="mainbody">
   <uc1:headerMenu id="cu_HeaderMenu" runat="server" TabIndex="3"  UseMap="质量管理" />
 <div class="hr_10"></div>
        <ul class="fbTab">
        <%if (HasVisist)
          { %>
          <li><a href="/CRM/customerservice/CustomerVisit.aspx"   class="tabtwo-on">客户回访</a></li><%} if (HasComplaint)
          { %>
          <li><a href="/CRM/customerservice/CustomerComplaint.aspx"  >客户投诉</a></li><%} %>
        </ul>
        <div class="hr_10"></div>
        <div id="con_two_1">
        	<table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td width="10" valign="top"><img src="/images/yuanleft.gif"/></td>
                <td><div class="searchbox">
                    <label>被访人：</label> <input type="text"  class="searchinput" id="txtByVisiter" runat="server"/>
                    <label>回访人：</label> <input type="text"  class="searchinput" id="txtVisiter" runat="server"/>
                    <label><a href="javascript:;" onclick="return CustVisit.search();"><img src="/images/searchbtn.gif" style="vertical-align:top;"/></a></label>
                  </div></td>
                <td width="10" valign="top"><img src="/images/yuanright.gif"/></td>
              </tr>
            </table>
            <div class="btnbox">
              <table width="30%" border="0" align="left" cellpadding="0" cellspacing="0">
                <tr><%if(IsAdd){ %>
                  <td width="70" align="left"><a href="javascript:;" onclick="return CustVisit.add();">回 访</a> </td><%} if (IsDelete)
                      { %>
                  <td width="70" align="left"><a href="javascript:;" onclick="return CustVisit.del('');">删 除</a></td><%} %>
                </tr>
              </table>
          </div>
          <div class="tablelist">
          <table width="100%" border="0" cellpadding="0" cellspacing="1">
            <tr>
              <th width="5%" height="30" align="center" bgcolor="#BDDCF4"><input type="checkbox" id="chkAll" onclick="CustVisit.changeAll(this);" />全选</th>
              <th width="12%" align="center" bgcolor="#BDDCF4">被访客户</th>
              <th width="12%" align="center" bgcolor="#bddcf4">被访人</th>
              <th width="12%" align="center" bgcolor="#bddcf4">回访人</th>
              <th width="12%" align="center" bgcolor="#bddcf4">回访时间</th>
              <th width="12%" align="center" bgcolor="#bddcf4">回访结果</th>
              <th width="18%" align="center" bgcolor="#bddcf4">备注</th>
              <th width="13%" align="center" bgcolor="#bddcf4">操作</th>
            </tr>
             <asp:CustomRepeater ID="rptVisiter" runat="server">
                  <ItemTemplate>
            <tr>
              <td height="30"  align="center" bgcolor="#e3f1fc"><input type="checkbox" class="c1" value='<%# Eval("Id") %>'/></td>
              <td align="center" bgcolor="#e3f1fc"><%# Eval("CustomerName")%></td>
              <td align="center" bgcolor="#e3f1fc"><%# Eval("CustomerUser")%></td>
              <td align="center" bgcolor="#e3f1fc"><%# Eval("CallBacker")%></td>
              <td align="center" bgcolor="#e3f1fc"><%# Convert.ToDateTime(Eval("Time")).ToString("yyyy-MM-dd")%></td>
              <td align="center" bgcolor="#e3f1fc"><a href="javascript:;" onclick="return CustVisit.updateC('<%# Eval("Id") %>')">回访结果</a></td>
              <td align="center" bgcolor="#e3f1fc"><%# Eval("Remark") %></td>
              <td align="center" bgcolor="#e3f1fc"><%if (IsUpdate)
                                                     { %><a href="javascript:;" onclick="return CustVisit.updateP('<%# Eval("Id") %>')">修改</a><%} if (IsDelete)
                                                     { %> <a href="javascript:;" onclick="return CustVisit.del('<%# Eval("Id") %>')">删除</a><%} %></td>
            </tr>
            </ItemTemplate>
            <AlternatingItemTemplate>
            <tr>
              <td height="30"  align="center" bgcolor="#BDDCF4"><input type="checkbox" class="c1" value='<%# Eval("Id") %>'/></td>
              <td align="center" bgcolor="#BDDCF4"><%# Eval("CustomerName")%></td>
              <td align="center" bgcolor="#BDDCF4"><%# Eval("CustomerUser")%></td>
              <td align="center" bgcolor="#BDDCF4"><%# Eval("CallBacker")%></td>
              <td align="center" bgcolor="#BDDCF4"><%# Convert.ToDateTime(Eval("Time")).ToString("yyyy-MM-dd")%></td>
              <td align="center" bgcolor="#BDDCF4"><a href="javascript:;" onclick="return CustVisit.updateC('<%# Eval("Id") %>')">回访结果</a></td>
              <td align="center" bgcolor="#BDDCF4"><%# Eval("Remark") %></td>
              <td align="center" bgcolor="#BDDCF4"><%if (IsUpdate)
                                                     { %><a href="javascript:;" onclick="return CustVisit.updateP('<%# Eval("Id") %>')">修改</a><%} if (IsDelete)
                                                     { %> <a href="javascript:;" onclick="return CustVisit.del('<%# Eval("Id") %>')">删除</a><%} %></td>
            </tr>
            </AlternatingItemTemplate>
    </asp:CustomRepeater>
          </table>
          
   <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td align="right">
                <uc2:ExportPageInfo ID="ExportPageInfo1" CurrencyPageCssClass="RedFnt" LinkType="4"  runat="server"></uc2:ExportPageInfo>
              </td>
            </tr>
          </table>
        </div>
        </div>
        
        
        </div>
        <script type="text/javascript">
            var CustVisit = {
                changeAll: function(tar) {
                    $("input:checkbox").not("#chkAll").attr("checked", $(tar).attr("checked"));
                },
                openDialog: function(p_url, p_title, p_width, p_height) {
                    Boxy.iframeDialog({ title: p_title, iframeUrl: p_url, width: p_width, height: p_height });
                    return false;
                },
                //新增客户回访
                add: function() {
                    return CustVisit.openDialog("/CRM/customerservice/VisitEdit.aspx", "新增客户回访", "720px", "480px");
                },
                //修改内容
                updateC: function(id) {
                    CustVisit.openDialog("/CRM/customerservice/ContentEdit.aspx?mtype=visit&id=" + id, "修改回访内容", "620px", "300px");
                    return false;
                },
                //修改人信息
                updateP: function(id) {
                    CustVisit.openDialog("/CRM/customerservice/PeopleEdit.aspx?mtype=visit&id=" + id, "修改", "520px", "230px");
                    return false;
                },
                //删除
                del: function(cId) {
                    var custIds = "";
                    if (cId == "") {
                        var IdArr = [];
                        $(":checked").not("#chkAll").each(function() {
                            IdArr.push($(this).val());
                        });
                        if (IdArr.length > 0) {
                            if (!confirm("你确认要所选的回访记录吗？"))
                                return false;
                        }
                        else {
                            alert("请选择要删除的回访记录！");
                            return false;
                        }
                        custIds = IdArr.toString();
                    }
                    else if (!confirm("你确认要删除该回访记录吗？")) {
                        return false;
                    }
                    else {
                        custIds = cId;
                    }

                    CustVisit.postAjax("del", custIds);
                },
                //提交操作
                postAjax: function(p_method, p_ids) {
                    $.newAjax(
                      {
                          url: "/CRM/customerservice/CustomerVisit.aspx",
                          data: { method: p_method, ids: p_ids },
                          dataType: "json",
                          cache: false,
                          type: "post",
                          success: function(result) {
                              if (result.success == "1") {
                                  alert(result.message);
                                  window.location = "/CRM/customerservice/CustomerVisit.aspx";
                              }
                              else {
                                  alert("操作失败！");
                              }
                          },
                          error: function() {
                              alert("操作时发生未知错误！");
                          }
                      })
                },
                //查询
                search: function() {
                    //执行查询
                    var visiter = $("#<%=txtVisiter.ClientID %>").val(); //回访人
                    var byVisiter = $("#<%=txtByVisiter.ClientID %>").val(); //被访人
                    window.location = "/CRM/customerservice/CustomerVisit.aspx?visister=" + encodeURIComponent(visiter) + "&byVisister=" +encodeURIComponent(byVisiter);
                    return false;
                }
            }
            $(document).ready(function() {
            $("#<%=txtByVisiter.ClientID %>,#<%=txtVisiter.ClientID %>").keydown(function(event) {
                    if (event.keyCode == 13) {
                        CustVisit.search();
                    }
                });
            });
			  </script>
</asp:Content>
