﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EyouSoft.Common;
using EyouSoft.Common.Function;

namespace Web.CRM.customerservice
{  
    /// <summary>
    ///添加客户回访
    ///xuty 2011/1/19
    ///修改:
    /// </summary>
    public partial class VisitEdit : Eyousoft.Common.Page.BackPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {   
            //判断权限
            if (!CheckGrant(global::Common.Enum.TravelPermission.客户关系管理_质量管理_新增回访))
            {
                Utils.ResponseNoPermit(global::Common.Enum.TravelPermission.客户关系管理_质量管理_新增回访, true);
                return;
            }
            string method = Utils.GetFormValue("hidMethod");//操作
            ucPeople1.IsVisist = true;
            ucPeople1.isRequiredVisiterName = true;
            ucPeople1.VisiterName = SiteUserInfo.ContactInfo.ContactName;
            if (method == "save")
            {
                #region 添加客户回访
                string showMess = "数据保存成功！";
                bool result = false;
                EyouSoft.BLL.CompanyStructure.Customer custBll = new EyouSoft.BLL.CompanyStructure.Customer();
                EyouSoft.Model.CompanyStructure.CustomerCallBackInfo custVisistModel = new EyouSoft.Model.CompanyStructure.CustomerCallBackInfo();
                
                List<EyouSoft.Model.CompanyStructure.CustomerCallBackResultInfo> resultList=new List<EyouSoft.Model.CompanyStructure.CustomerCallBackResultInfo>();
                EyouSoft.Model.CompanyStructure.CustomerCallBackResultInfo infoModel = new EyouSoft.Model.CompanyStructure.CustomerCallBackResultInfo
                {
                    Car = (byte)ucContent1.LevelCar,
                    DepartureTime = ucContent1.LeaveDate,
                    Guide = (byte)ucContent1.LevelGuideService,
                    Hotel = (byte)ucContent1.LevelHotelCondition,
                    Journey = (byte)ucContent1.LevelTravel,
                    meals = (byte)ucContent1.LevelFood,
                    RouteID = Utils.GetInt(ucContent1.RouteId),
                    RouteName = ucContent1.RouteName,
                    Shopping = (byte)ucContent1.LevelShopping,
                    Spot = (byte)ucContent1.LevelLandScape,
                    Remark=ucContent1.Remark
                };  
                    
                resultList.Add(infoModel);
                custVisistModel.CustomerCallBackResultInfoList=resultList;
                custVisistModel.Time=ucPeople1.VisistDate;
                custVisistModel.CompanyId = CurrentUserCompanyID;
                custVisistModel.CallBacker= ucPeople1.VisiterName;
                custVisistModel.CustomerName= ucPeople1.ByVisisterCompany;//被访客户
                custVisistModel.CustomerId= Utils.GetInt(ucPeople1.ByVisisterCompanyId);//被访客户ID
                custVisistModel.CustomerUser = ucPeople1.ByVisisterName;//被访人
                custVisistModel.Remark= Utils.InputText(txtRemarkP.Value);//备注
                custVisistModel.IsCallBack = EyouSoft.Model.EnumType.CompanyStructure.CallBackType.回访;
                result=custBll.AddCustomerCallBack(custVisistModel);
                if (!result)
                { 
                    showMess = "数据保存失败！";
                }
                if (result)
                {
                    MessageBox.ResponseScript(this, string.Format(";alert('{0}');window.parent.location='/CRM/customerservice/CustomerVisit.aspx';window.parent.Boxy.getIframeDialog('{1}').hide()", showMess, Utils.GetQueryStringValue("iframeId")));
                }
                else
                {
                    MessageBox.ShowAndRedirect(this, "数据保存失败！", this.Request.Url.ToString());
                }
               
                #endregion
            }
        }
        protected override void OnPreInit(EventArgs e)
        {
            base.OnPreInit(e);
            this.PageType = Eyousoft.Common.Page.PageType.boxyPage;
        }
    }
}
