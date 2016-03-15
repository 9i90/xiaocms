package com.xiao.manage.controller.user;
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

import com.xiao.manage.entity.user.UserBasicEntity;

/**   
 * @Title: Controller
 * @Description: 用户基本信息
 * @author zhangdaihao
 * @date 2016-03-16 03:05:02
 * @version V1.0   
 *
 */
@Scope("prototype")
@Controller
@RequestMapping("/userBasicController")
public class UserBasicController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(UserBasicController.class);

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
	 * 用户基本信息列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "userBasic")
	public ModelAndView userBasic(HttpServletRequest request) {
		return new ModelAndView("com/xiao/manage/user/userBasicList");
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
	public void datagrid(UserBasicEntity userBasic,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(UserBasicEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, userBasic, request.getParameterMap());
		this.systemService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除用户基本信息
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(UserBasicEntity userBasic, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		userBasic = systemService.getEntity(UserBasicEntity.class, userBasic.getUserId());
		message = "用户基本信息删除成功";
		systemService.delete(userBasic);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加用户基本信息
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(UserBasicEntity userBasic, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(userBasic.getUserId())) {
			message = "用户基本信息更新成功";
			UserBasicEntity t = systemService.get(UserBasicEntity.class, userBasic.getUserId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(userBasic, t);
				systemService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
				message = "用户基本信息更新失败";
			}
		} else {
			message = "用户基本信息添加成功";
			systemService.save(userBasic);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		j.setMsg(message);
		return j;
	}

	/**
	 * 用户基本信息列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(UserBasicEntity userBasic, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(userBasic.getUserId())) {
			userBasic = systemService.getEntity(UserBasicEntity.class, userBasic.getUserId());
			req.setAttribute("userBasicPage", userBasic);
		}
		return new ModelAndView("com/xiao/manage/user/userBasic");
	}
}
