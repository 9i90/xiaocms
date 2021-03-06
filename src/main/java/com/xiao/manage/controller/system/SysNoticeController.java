package com.xiao.manage.controller.system;
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

import com.xiao.manage.entity.system.SysNoticeEntity;

/**   
 * @Title: Controller
 * @Description: 系统公告
 * @author zhangdaihao
 * @date 2016-03-16 03:04:25
 * @version V1.0   
 *
 */
@Scope("prototype")
@Controller
@RequestMapping("/sysNoticeController")
public class SysNoticeController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(SysNoticeController.class);

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
	 * 系统公告列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "sysNotice")
	public ModelAndView sysNotice(HttpServletRequest request) {
		return new ModelAndView("com/xiao/manage/system/sysNoticeList");
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
	public void datagrid(SysNoticeEntity sysNotice,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(SysNoticeEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, sysNotice, request.getParameterMap());
		this.systemService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除系统公告
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(SysNoticeEntity sysNotice, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		sysNotice = systemService.getEntity(SysNoticeEntity.class, sysNotice.getId());
		message = "系统公告删除成功";
		systemService.delete(sysNotice);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加系统公告
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(SysNoticeEntity sysNotice, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(sysNotice.getId())) {
			message = "系统公告更新成功";
			SysNoticeEntity t = systemService.get(SysNoticeEntity.class, sysNotice.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(sysNotice, t);
				systemService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
				message = "系统公告更新失败";
			}
		} else {
			message = "系统公告添加成功";
			systemService.save(sysNotice);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		j.setMsg(message);
		return j;
	}

	/**
	 * 系统公告列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(SysNoticeEntity sysNotice, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(sysNotice.getId())) {
			sysNotice = systemService.getEntity(SysNoticeEntity.class, sysNotice.getId());
		}else{
			sysNotice.setAddtime(new Date());
		}
		req.setAttribute("sysNoticePage", sysNotice);
		return new ModelAndView("com/xiao/manage/system/sysNotice");
	}
}
