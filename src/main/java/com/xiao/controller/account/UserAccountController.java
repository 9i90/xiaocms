package com.xiao.controller.account;
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

import com.xiao.pojo.UserAccountEntity;
import com.xiao.service.account.UserAccountServiceI;

/**   
 * @Title: Controller
 * @Description: 用户账户信息
 * @author zhangdaihao
 * @date 2016-03-16 00:19:33
 * @version V1.0   
 *
 */
@Scope("prototype")
@Controller
@RequestMapping("/userAccountController")
public class UserAccountController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(UserAccountController.class);

	@Autowired
	private UserAccountServiceI userAccountService;
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
	 * 用户账户信息列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "userAccount")
	public ModelAndView userAccount(HttpServletRequest request) {
		return new ModelAndView("com/xiao/account/userAccountList");
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
	public void datagrid(UserAccountEntity userAccount,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(UserAccountEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, userAccount, request.getParameterMap());
		this.userAccountService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}
	/**
	 * 用户账户信息列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(UserAccountEntity userAccount, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(userAccount.getUserId())) {
			userAccount = userAccountService.getEntity(UserAccountEntity.class, userAccount.getUserId());
			req.setAttribute("userAccountPage", userAccount);
		}
		return new ModelAndView("com/xiao/account/userAccount");
	}
}
