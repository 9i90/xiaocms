package com.xiao.manage.controller.system;
import javax.servlet.http.HttpServletRequest;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.jeecgframework.core.common.controller.BaseController;
import org.jeecgframework.core.common.model.json.AjaxJson;
import org.jeecgframework.core.constant.Globals;
import org.jeecgframework.core.util.StringUtil;
import org.jeecgframework.web.system.pojo.base.TSConfig;
import org.jeecgframework.web.system.service.SystemService;
import org.jeecgframework.core.util.MyBeanUtils;

/**   
 * @Title: Controller
 * @Description: 系统配置
 * @author zhangdaihao
 * @date 2016-03-16 01:14:58
 * @version V1.0   
 *
 */
@Scope("prototype")
@Controller
@RequestMapping("/sysConfigController")
public class SysConfigController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(SysConfigController.class);
	
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
	 * 系统配置列表 页面跳转
	 * 
	 * @return
	 */
	@RequestMapping(params = "sysConfig")
	public ModelAndView sysNotice(HttpServletRequest request) {
		//域名配置
		TSConfig domainname = systemService.findUniqueByProperty(TSConfig.class, "code", "domainname");
		if(domainname==null){
			domainname=new TSConfig();
			domainname.setCode("domainname");
			domainname.setName("网站域名");
		}
		request.setAttribute("domainname", domainname);
		
		//分享配置
		TSConfig share = systemService.findUniqueByProperty(TSConfig.class, "code", "share");
		if(share==null){
			share=new TSConfig();
			share.setCode("share");
			share.setName("分享获取");
		}
		request.setAttribute("share", share);
		
		return new ModelAndView("com/xiao/manage/system/sysConfigList");
	}

	/**
	 * 添加或者修改系统配置
	 * 
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "save")
	@ResponseBody
	public AjaxJson save(TSConfig config, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		if (StringUtil.isNotEmpty(config.getId())) {
			message = "系统配置更新成功";
			TSConfig t = systemService.get(TSConfig.class, config.getId());
			try {
				MyBeanUtils.copyBeanNotNull2Bean(config, t);
				systemService.saveOrUpdate(t);
				systemService.addLog(message, Globals.Log_Type_UPDATE, Globals.Log_Leavel_INFO);
			} catch (Exception e) {
				e.printStackTrace();
				message = "系统配置更新失败";
			}
		} else {
			message = "系统配置添加成功";
			systemService.save(config);
			systemService.addLog(message, Globals.Log_Type_INSERT, Globals.Log_Leavel_INFO);
		}
		j.setMsg(message);
		return j;
	}
}
