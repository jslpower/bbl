﻿<%@ Page Language="C#" MasterPageFile="/masterpage/Back.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Web.administrativeCenter.fixedAssetsManage.Default" Title="固定资产管理_行政中心" %>

<asp:Content ID="Content2" ContentPlaceHolderID="c1" runat="server">
<div class="mainbody">
    <div class="lineprotitlebox">
       <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="15%" nowrap="nowrap"><span class="lineprotitle">行政中心</span></td>
            <td width="85%" nowrap="nowrap" align="right" style="padding:0 10px 2px 0; color:#13509f;">所在位置：行政中心>>固定资产管理</td>
          </tr>
          <tr>
            <td colspan="2" height="2" bgcolor="#000000"></td>
          </tr>
      </table>  
    </div>
    <div class="hr_10"></div>
    <table width="99%" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
    <td width="10" valign="top"><img src="/images/yuanleft.gif"/></td>
    <td height="50"><div class="searchbox">
    编号： <input name="txt_Number" type="text"  class="searchinput2" id="txt_Number" size="10"/>
    资产名称：<input name="txt_AssetName" type="text"  class="searchinput2" id="txt_AssetName" size="15"/>
    购买时间：<input name="txt_BuyTimeStart" type="text" class="searchinput2" id="txt_BuyTimeStart" size="12" onfocus="WdatePicker()" />-<input name="txt_BuyTimeEnd" type="text" class="searchinput2" id="txt_BuyTimeEnd" size="12" onfocus="WdatePicker()" />
    <a href="javascript:void(0);" onclick="Default.OnSearch();">
        <img src="/images/searchbtn.gif" style="vertical-align:top;"/></a>
    </div></td>
    <td width="10" valign="top"><img src="/images/yuanright.gif"/></td>
    </tr>
    </table>
    <div class="btnbox">
    <table id="table_Insert" border="0" align="left" cellpadding="0" cellspacing="0">
    <tr>
    <td width="90" align="center">
        <a id="a_Insert" href="javascript:void(0);">新增</a></td>
    </tr>
    </table>
    </div>
    <div class="tablelist" id="divSearch" align="center">
    </div>
</div>
<script src="/js/Loading.js" type="text/javascript"></script>
<script src="/js/datepicker/WdatePicker.js" type="text/javascript"></script>
<script type="text/javascript">
    var Parms = { Number: "", AssetName: "", BuyTimeStart: "", BuyTimeEnd: "", Page: 1 };
    var Default = {
        OnSearch: function() { //查询
            Parms.Number = $.trim($("#txt_Number").val());
            Parms.AssetName = $.trim($("#txt_AssetName").val());
            Parms.BuyTimeStart = $.trim($("#txt_BuyTimeStart").val());
            Parms.BuyTimeEnd = $.trim($("#txt_BuyTimeEnd").val());
            Parms.Page = 1;
            Default.GetFixedAssetsList();
        },
        GetFixedAssetsList: function() {//得到ajax数据
            LoadingImg.ShowLoading("divSearch");
            if (LoadingImg.IsLoadAddDataToDiv("divSearch")) {
                $.newAjax({
                    type: "GET",
                    dateType: "html",
                    url: "/administrativeCenter/fixedAssetsManage/AjaxFixedAssets.aspx",
                    data: Parms,
                    cache: false,
                    success: function(html) {
                        $("#divSearch").html(html);
                    }
                });
            }
        },
        OpenForm: function(strurl, strtitle, strwidth, strheight, strdate) {
            Boxy.iframeDialog({ title: strtitle, iframeUrl: strurl, width: strwidth, height: strheight,
                draggable: true, data: strdate
            });
        },
        OpenPage: function(method, number) {
            if (method == "add") {
                Default.OpenForm("/administrativeCenter/fixedAssetsManage/EditFixedAssets.aspx", "添加固定资产",
	                 "640px", "320px", "true");
            }
            if (method == "update") {
                Default.OpenForm("/administrativeCenter/fixedAssetsManage/EditFixedAssets.aspx", "修改固定资产",
	                 "640px", "320px", "FixedID=" + number);
            }
        },
        DeleteFixedAsset: function(ID) {
            if (ID > 0) {
                if (window.confirm("您确认要删除此固定资产信息吗?\n此操作不可恢复!")) {
                    $.newAjax({
                        type: "GET",
                        dateType: "html",
                        url: "/administrativeCenter/fixedAssetsManage/AjaxFixedAssets.aspx",
                        data: {
                            FixedAssetID: ID,
                            Method: 'DeleteFixedAsset'
                        },
                        cache: false,
                        async: false,
                        success: function(result) {
                            if (result == "True") {
                                alert("删除成功！");
                                Default.OnSearch();
                            } else if (result == "NoPermission") {
                                alert("没有删除权限！");
                            } else {
                                alert("删除失败！");
                            }
                        }
                    });
                }
            } else {
                alert("没有该记录。");
            }
        },
        LoadData: function(obj) {       //分页
            var Page = exporpage.getgotopage(obj);
            Parms.Page = Page;
            Default.GetFixedAssetsList();
        }
    };
    $(document).ready(function() {
        $("#txt_Number,#txt_AssetName,#txt_BuyTimeStart,#txt_BuyTimeEnd").keydown(function() {
            if (event.keyCode == 13) {
                Default.OnSearch();
            }
        });
    }); 
    $(function() {
        if ("<%=InsertFlag %>" == "True") {
            $("#table_Insert").show();
            $("#a_Insert").click(function() {
                Default.OpenPage('add', '');
                return false;
            });
        } else {
            $("#table_Insert").hide();
        }
        Default.OnSearch();
    });
</script>
</asp:Content>