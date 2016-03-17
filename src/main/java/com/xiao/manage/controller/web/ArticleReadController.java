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
import com.xiao.manage.entity.web.ArticleReadRecordEntity;

/**   
 * @Title: Controller
 * @Description: 文章浏览记录
 * @author zhangdaihao
 * @date 2016-03-17 17:31:07
 * @version V1.0   
 *
 */
@Scope("prototype")
@Controller
@RequestMapping("/articleReadController")
public class ArticleReadController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(ArticleReadController.class);

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
	 * 文章浏览记录列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "articleRead")
	public ModelAndView articleRead(HttpServletRequest request) {
		return new ModelAndView("com/xiao/manage/web/articleReadList");
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
	public void datagrid(ArticleReadRecordEntity articleRead,HttpServletRequest request, HttpServletResponse response, DataGrid dataGrid) {
		CriteriaQuery cq = new CriteriaQuery(ArticleReadRecordEntity.class, dataGrid);
		//查询条件组装器
		org.jeecgframework.core.extend.hqlsearch.HqlGenerateUtil.installHql(cq, articleRead, request.getParameterMap());
		this.systemService.getDataGridReturn(cq, true);
		TagUtil.datagrid(response, dataGrid);
	}

	/**
	 * 删除文章浏览记录
	 * 
	 * @return
	 */
	@RequestMapping(params = "del")
	@ResponseBody
	public AjaxJson del(ArticleReadRecordEntity articleRead, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		articleRead = systemService.getEntity(ArticleReadRecordEntity.class, articleRead.getId());
		message = "文章浏览记录删除成功";
		systemService.delete(articleRead);
		systemService.addLog(message, Globals.Log_Type_DEL, Globals.Log_Leavel_INFO);
		
		j.setMsg(message);
		return j;
	}


	/**
	 * 添加文章浏览记录
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(ArticleReadRecordEntity articleRead, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(articleRead.getId())) {
			message = "文章浏览记录更新成功";
			ArticleReadRecordEntity t = systemService.get(ArticleReadRecordEntity.class, articleRead.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(articleRead, t);
				systemService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
				message = "文章浏览记录更新失败";
			}
		} else {
			message = "文章浏览记录添加成功";
			systemService.save(articleRead);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		j.setMsg(message);
		return j;
	}

	/**
	 * 文章浏览记录列表页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "addorupdate")
	public ModelAndView addorupdate(ArticleReadRecordEntity articleRead, HttpServletRequest req) {
		if (StringUtil.isNotEmpty(articleRead.getId())) {
			articleRead = systemService.getEntity(ArticleReadRecordEntity.class, articleRead.getId());
			req.setAttribute("articleReadPage", articleRead);
		}
		return new ModelAndView("com/xiao/manage/web/articleRead");
	}
}
