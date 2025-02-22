﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HotelLoadExcel.aspx.cs"
    Inherits="Web.SupplierControl.Hotels.HotelLoadExcel" %>

<%@ Register Src="~/UserControl/ExcelFileUploadControl.ascx" TagName="upload" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link href="/css/sytle.css" rel="stylesheet" type="text/css" />
    <link href="/css/swfupload/default.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="/js/jquery.js"></script>

    <script type="text/javascript" src="/js/swfupload/swfupload.js"></script>

    <script type="text/javascript" src="/js/loadExcel.js"></script>

    <script type="text/javascript">
        function loadexcel(array) {
            loadXls.init(array, "#tablelist", ".s1");
            //$(".tablelist").html(loadXls.createTable());

            ///确定反回的选定数组
            //loadXls.bindIndex([0,2]);
            $("#selectall").bind("click", function() {
                loadXls.selectAll(true);
            });
            $("#reset").bind("click", function() {
                loadXls.selectAll(false);
            });
            $("#selectback").bind("click", function() {
                loadXls.selectback();
            });
            $("#ok").bind("click", function() {
            var datas = loadXls.bindIndex([$("#hotelprovince").val(), $("#hotelcity").val(), $("#hotelunionname").val(),
            $("#hotelstart").val(), $("#hoteladdress").val(), $("#hotelIntroduce").val(),
            $("#HotelTourGuide ").val(), $("#ContectName").val(), $("#ContectJob").val(),
            $("#ContectTel").val(), $("#ContectPhone").val(), $("#ContectQQ").val(),
            $("#ContectEmail").val(), $("#Chamber").val(), $("#SalesPrices").val(),
            $("#SettlementPrices").val(), $("#Breakfast").val(), $("#hotelremark").val()]);
                if (datas.length > 0) {
                    for (var i = 0; i < datas.length; i++) {
                        for (var j = 0; j < datas[i].length; j++) {
                            datas[i][j] = encodeURIComponent(datas[i][j]);
                        }
                    }
                    $.newAjax({
                        type: "post",
                        dataType: "json",
                        url: "HotelLoadExcel.aspx?action=load",
                        data: { dataxls: datas.join(';') },
                        cache: false,
                        success: function(r) {
                            if (r.res) {
                                switch (r.res) {
                                    case 1:
                                        alert("导入成功");
                                        parent.Boxy.getIframeDialog('<%=Request.QueryString["iframeId"] %>').hide();
                                        parent.location.reload();
                                        break;
                                    default:
                                        alert("导入失败");
                                        break;
                                }
                            }
                        },
                        error: function() {
                            alert("服务器忙！");
                        }
                    });
                } else {
                    alert("请选择导入数据！");
                }
            });
        }
    </script>

</head>
<body>
    <form id="form" runat="server">
    <uc1:upload ID="Upload1" UploadSuccessJavaScriptFunCallBack="loadexcel" runat="server" UploadFrom="酒店" />
    <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
        <tr>
            <td>
                <fieldset>
                    <legend>源数据预览&nbsp;&nbsp;&nbsp;&nbsp;</legend>
                    <table height="30" cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
                        <tr>
                            <td>
                                <div id="tablelist">
                                </div>
                                <input type="button" id="selectall" value="全选" />
                                <input type="button" id="reset" value="清空">
                                <input type="button" id="selectback" value="反选" />
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
    </table>
    <table cellspacing="0" cellpadding="0" width="98%" align="center" border="0">
        <tbody>
            <tr>
                <td style="padding-top: 15px;">
                    <fieldset>
                        <legend>请设置对应字段</legend>
                        <table cellspacing="0" id="tbl_Cell" cellpadding="5" width="98%" align="center" border="0">
                            <tbody>
                                <tr>
                                    <td>
                                        <label>
                                            省份：</label><select id="hotelprovince" class="s1"></select>
                                    </td>
                                    <td>
                                        <label>
                                            城市：</label><select id="hotelcity" class="s1"></select>
                                    </td>
                                    <td>
                                        <label>
                                            酒店名称：</label><select id="hotelunionname" class="s1"></select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>
                                            星级：</label><select id="hotelstart" class="s1"></select>
                                    </td>
                                    <td>
                                        <label>
                                            地址：</label><select id="hoteladdress" class="s1"></select>
                                    </td>
                                    <td>
                                        <label>
                                            酒店简介：</label><select id="hotelIntroduce" class="s1"></select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>
                                            导游词：</label><select id="HotelTourGuide" class="s1"></select>
                                    </td>
                                    <td>
                                        <label>
                                            联系人姓名：</label><select id="ContectName" class="s1"></select>
                                    </td>
                                    <td>
                                        <label>
                                            联系人职务：</label><select id="ContectJob" class="s1"></select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>
                                            联系人电话：</label><select id="ContectTel" class="s1"></select>
                                    </td>
                                    <td>
                                        <label>
                                            联系人手机：</label><select id="ContectPhone" class="s1"></select>
                                    </td>
                                    <td>
                                        <label>
                                            联系人QQ：</label><select id="ContectQQ" class="s1"></select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>
                                            联系人E-Mail:</label><select id="ContectEmail" class="s1"></select>
                                    </td>
                                    <td>
                                        <label>
                                            房型：</label><select id="Chamber" class="s1"></select>
                                    </td>
                                    <td>
                                        <label>
                                            前台销售价：</label><select id="SalesPrices" class="s1"></select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>
                                            结算价：</label><select id="SettlementPrices" class="s1"></select>
                                    </td>
                                    <td>
                                        <label>
                                            含早：</label><select id="Breakfast" class="s1"></select>
                                    </td>
                                    <td>
                                        <label>
                                            备注：</label><select id="hotelremark" class="s1"></select>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr>
                                <td height="40" align="center" class="tjbtn02">
                                    <a href="javascript:;" id="ok">保存</a>
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                </td>
            </tr>
        </tbody>
    </table>
    </form>
</body>
</html>
