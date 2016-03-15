package com.xiao.controller.user;
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

import com.xiao.pojo.UserInfoEntity;

/**   
 * @Title: Controller
 * @Description: 用户信息
 * @author zhangdaihao
 * @date 2016-03-16 01:12:29
 * @version V1.0   
 *
 */
@Scope("prototype")
@Controller
@RequestMapping("/userInfoController")
public class UserInfoController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(UserInfoController.class);

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
	 * 用户信息列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "userInfo")
	public ModelAndView userInfo(HttpServletRequest request) {
		return new ModelAndView("com/xiao/user/userInfoList");
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
	public void datagrid(UserInfoEntity userInfo,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(UserInfoEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, userInfo, request.getParameterMap());
		this.systemService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除用户信息
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(UserInfoEntity userInfo, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		userInfo = systemService.getEntity(UserInfoEntity.class, userInfo.getUserId());
		message = "用户信息删除成功";
		systemService.delete(userInfo);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加用户信息
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(UserInfoEntity userInfo, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(userInfo.getUserId())) {
			message = "用户信息更新成功";
			UserInfoEntity t = systemService.get(UserInfoEntity.class, userInfo.getUserId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(userInfo, t);
				systemService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
				message = "用户信息更新失败";
			}
		} else {
			message = "用户信息添加成功";
			systemService.save(userInfo);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		j.setMsg(message);
		return j;
	}

	/**
	 * 用户信息列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(UserInfoEntity userInfo, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(userInfo.getUserId())) {
			userInfo = systemService.getEntity(UserInfoEntity.class, userInfo.getUserId());
			req.setAttribute("userInfoPage", userInfo);
		}
		return new ModelAndView("com/xiao/user/userInfo");
	}
}
