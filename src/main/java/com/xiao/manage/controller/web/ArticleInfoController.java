package com.xiao.manage.controller.web;
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
import com.xiao.manage.entity.web.ArticleInfoEntity;

/**   
 * @Title: Controller
 * @Description: 文章管理
 * @author zhangdaihao
 * @date 2016-03-18 01:20:19
 * @version V1.0   
 *
 */
@Scope("prototype")
@Controller
@RequestMapping("/articleInfoController")
public class ArticleInfoController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(ArticleInfoController.class);

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
	 * 文章管理列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "articleInfo")
	public ModelAndView articleInfo(HttpServletRequest request) {
		return new ModelAndView("com/xiao/manage/web/articleInfoList");
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
	public void datagrid(ArticleInfoEntity articleInfo,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(ArticleInfoEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, articleInfo, request.getParameterMap());
		this.systemService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除文章管理
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(ArticleInfoEntity articleInfo, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		articleInfo = systemService.getEntity(ArticleInfoEntity.class, articleInfo.getId());
		message = "文章管理删除成功";
		systemService.delete(articleInfo);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加文章管理
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(ArticleInfoEntity articleInfo, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(articleInfo.getId())) {
			message = "文章更新成功";
			ArticleInfoEntity t = systemService.get(ArticleInfoEntity.class, articleInfo.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(articleInfo, t);
				systemService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
				message = "文章更新失败";
			}
		} else {
			message = "文章添加成功";
			systemService.save(articleInfo);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		j.setMsg(message);
		return j;
	}

	/**
	 * 文章管理列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(ArticleInfoEntity articleInfo, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(articleInfo.getId())) {
			articleInfo = systemService.getEntity(ArticleInfoEntity.class, articleInfo.getId());
			req.setAttribute("articleInfoPage", articleInfo);
		}
		return new ModelAndView("com/xiao/manage/web/articleInfo");
	}
}
