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

import com.xiao.manage.entity.user.UserOpinionEntity;

/**   
 * @Title: Controller
 * @Description: 用户反馈
 * @author zhangdaihao
 * @date 2016-03-16 03:06:02
 * @version V1.0   
 *
 */
@Scope("prototype")
@Controller
@RequestMapping("/userOpinionController")
public class UserOpinionController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(UserOpinionController.class);

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
	 * 用户反馈列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "userOpinion")
	public ModelAndView userOpinion(HttpServletRequest request) {
		return new ModelAndView("com/xiao/manage/user/userOpinionList");
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
	public void datagrid(UserOpinionEntity userOpinion,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(UserOpinionEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, userOpinion, request.getParameterMap());
		this.systemService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除用户反馈
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(UserOpinionEntity userOpinion, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		userOpinion = systemService.getEntity(UserOpinionEntity.class, userOpinion.getId());
		message = "用户反馈删除成功";
		systemService.delete(userOpinion);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加用户反馈
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(UserOpinionEntity userOpinion, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(userOpinion.getId())) {
			message = "用户反馈更新成功";
			UserOpinionEntity t = systemService.get(UserOpinionEntity.class, userOpinion.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(userOpinion, t);
				systemService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
				message = "用户反馈更新失败";
			}
		} else {
			message = "用户反馈添加成功";
			systemService.save(userOpinion);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		j.setMsg(message);
		return j;
	}

	/**
	 * 用户反馈列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(UserOpinionEntity userOpinion, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(userOpinion.getId())) {
			userOpinion = systemService.getEntity(UserOpinionEntity.class, userOpinion.getId());
			req.setAttribute("userOpinionPage", userOpinion);
		}
		return new ModelAndView("com/xiao/manage/user/userOpinion");
	}
}
