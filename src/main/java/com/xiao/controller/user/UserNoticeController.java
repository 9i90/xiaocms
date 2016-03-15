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

import com.xiao.pojo.UserNoticeEntity;

/**   
 * @Title: Controller
 * @Description: 站内信
 * @author zhangdaihao
 * @date 2016-03-16 01:15:49
 * @version V1.0   
 *
 */
@Scope("prototype")
@Controller
@RequestMapping("/userNoticeController")
public class UserNoticeController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(UserNoticeController.class);

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
	 * 站内信列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "userNotice")
	public ModelAndView userNotice(HttpServletRequest request) {
		return new ModelAndView("com/xiao/user/userNoticeList");
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
	public void datagrid(UserNoticeEntity userNotice,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(UserNoticeEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, userNotice, request.getParameterMap());
		this.systemService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除站内信
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(UserNoticeEntity userNotice, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		userNotice = systemService.getEntity(UserNoticeEntity.class, userNotice.getId());
		message = "站内信删除成功";
		systemService.delete(userNotice);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加站内信
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(UserNoticeEntity userNotice, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(userNotice.getId())) {
			message = "站内信更新成功";
			UserNoticeEntity t = systemService.get(UserNoticeEntity.class, userNotice.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(userNotice, t);
				systemService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
				message = "站内信更新失败";
			}
		} else {
			message = "站内信添加成功";
			systemService.save(userNotice);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		j.setMsg(message);
		return j;
	}

	/**
	 * 站内信列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(UserNoticeEntity userNotice, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(userNotice.getId())) {
			userNotice = systemService.getEntity(UserNoticeEntity.class, userNotice.getId());
			req.setAttribute("userNoticePage", userNotice);
		}
		return new ModelAndView("com/xiao/user/userNotice");
	}
}
