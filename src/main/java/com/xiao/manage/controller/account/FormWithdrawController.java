package com.xiao.manage.controller.account;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.jeecgframework.core.common.controller.BaseController;
import org.jeecgframework.core.common.hibernate.qbc.CriteriaQuery;
import org.jeecgframework.core.common.model.json.AjaxJson;
import org.jeecgframework.core.common.model.json.DataGrid;
import org.jeecgframework.core.constant.Globals;
import org.jeecgframework.core.util.StringUtil;
import org.jeecgframework.tag.core.easyui.TagUtil;
import org.jeecgframework.web.system.pojo.base.TSDepart;
import org.jeecgframework.web.system.service.SystemService;
import org.jeecgframework.core.util.MyBeanUtils;

import com.xiao.manage.entity.account.FormWithdrawEntity;
import com.xiao.manage.entity.user.UserInfoEntity;
import com.xiao.manage.entity.user.UserNoticeEntity;
import com.xiao.manage.service.account.FormWithdrawServiceI;
import com.xiao.utils.StringUtils;

/**   
 * @Title: Controller
 * @Description: 提现管理
 * @author zhangdaihao
 * @date 2016-03-16 02:59:05
 * @version V1.0   
 *
 */
@Scope("prototype")
@Controller
@RequestMapping("/formWithdrawController")
public class FormWithdrawController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(FormWithdrawController.class);

	@Autowired
	private FormWithdrawServiceI formWithdrawService;
	@Autowired
	private SystemService systemService;
	private String message;
	
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}


	/**
	 * 提现管理列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "formWithdraw")
	public ModelAndView formWithdraw(HttpServletRequest request) {
		return new ModelAndView("com/xiao/manage/account/formWithdrawList");
	}

	/**
	 * easyui AJAX请求数据
	 * 
	 * @param request
	 * @param response
	 * @param dataGrid
	 * @param user
	 */

	@RequestMapping(params = "datagrid")
	public void datagrid(FormWithdrawEntity formWithdraw,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(FormWithdrawEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, formWithdraw, request.getParameterMap());
		this.formWithdrawService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除提现管理
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(FormWithdrawEntity formWithdraw, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		formWithdraw = systemService.getEntity(FormWithdrawEntity.class, formWithdraw.getId());
		message = "提现管理删除成功";
		formWithdrawService.delete(formWithdraw);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加提现管理
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(FormWithdrawEntity formWithdraw, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(formWithdraw.getId())) {
			message = "提现管理更新成功";
			FormWithdrawEntity t = formWithdrawService.get(FormWithdrawEntity.class, formWithdraw.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(formWithdraw, t);
				formWithdrawService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
				message = "提现管理更新失败";
			}
		} else {
			message = "提现管理添加成功";
			formWithdrawService.save(formWithdraw);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		j.setMsg(message);
		return j;
	}
	/**
	 * 提现审核
	 * @param withDrawId 提现申请ID
	 * @param status 审核状态（1：审核通过；-2：审核不通过）
	 * @param yesAmount 实际到账金额
	 * @param remark 备注
	 * @param request
	 * @return
	 */
	@RequestMapping(params = "audit")
	@ResponseBody
	public AjaxJson audit(Integer withDrawId,String withdrawTicket,String status, String remark,Date notifyTime,String sendMsg,String msgContent, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		message = "提现审核成功";
		try {
			formWithdrawService.audit(withDrawId, withdrawTicket, status,notifyTime, remark);
			
			if("1".equals(sendMsg)&&msgContent!=null&&msgContent.trim().length()>0){
				FormWithdrawEntity t = formWithdrawService.get(FormWithdrawEntity.class, withDrawId);
				UserInfoEntity u = systemService.get(UserInfoEntity.class, t.getUserId());
				UserNoticeEntity notice = new UserNoticeEntity();
				msgContent=msgContent.replaceAll("name", u.getNickname());
				msgContent=msgContent.replaceAll("money",StringUtils.DoubleStrRound(t.getAmount().doubleValue(),2));
				msgContent=msgContent.replaceAll("fee",StringUtils.DoubleStrRound(t.getFee().doubleValue(),2));
				notice.setContext(msgContent);
				notice.setSendtime(new Date());
				notice.setStatus("0");
				notice.setTitle("提现到账通知");
				notice.setType("0");
				notice.setUserId(t.getUserId());
				systemService.save(notice);
			}
			
			systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
		} catch (Exception e) {
			e.printStackTrace();
			message = e.getMessage();
		}
		j.setMsg(message);
		return j;
	}
	/**
	 * 提现管理列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(FormWithdrawEntity formWithdraw, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(formWithdraw.getId())) {
			formWithdraw = formWithdrawService.getEntity(FormWithdrawEntity.class, formWithdraw.getId());
			req.setAttribute("formWithdrawPage", formWithdraw);
		}
		return new ModelAndView("com/xiao/manage/account/formWithdraw");
	}
	
	/**
	 * 提现管理列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "toaudit")
	public ModelAndView toaudit(FormWithdrawEntity formWithdraw, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(formWithdraw.getId())) {
			formWithdraw = formWithdrawService.getEntity(FormWithdrawEntity.class, formWithdraw.getId());
			if(formWithdraw.getNotifyTime()==null)formWithdraw.setNotifyTime(new Date());
			req.setAttribute("formWithdrawPage", formWithdraw);
		}
		return new ModelAndView("com/xiao/manage/account/withdrawAudit");
	}
}
