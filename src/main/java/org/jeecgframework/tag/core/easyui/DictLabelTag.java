package org.jeecgframework.tag.core.easyui;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import org.jeecgframework.web.system.pojo.base.TSType;
import org.jeecgframework.web.system.pojo.base.TSTypegroup;
import org.jeecgframework.web.system.service.MutiLangServiceI;
import org.jeecgframework.web.system.service.SystemService;

import org.apache.commons.lang.StringUtils;
import org.jeecgframework.core.util.ApplicationContextUtil;
import org.jeecgframework.core.util.MutiLangUtil;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;

/**
 * 
 * 功能：字典编码显示替换
 * 版本：v1.0
 * 创建人：luo90
 * 创建时间：2016年3月10日 下午2:30:13 
 * 修改历史：
 * 			description by author@date
 */
public class DictLabelTag extends TagSupport {

	private static final long serialVersionUID = 1;
	private String typeGroupCode; // 数据字典类型
	private String field; // 编码值
	private String defaultVal; // 默认值
	private String dictTable;// 自定义字典表
	private String dictField;// 自定义字典表的匹配字段-字典的编码值
	private String dictText;// 自定义字典表的显示文本-字典的显示值
	private String dictCondition;
	public String getDictCondition() {
		return dictCondition;
	}

	public void setDictCondition(String dicCondition) {
		this.dictCondition = dicCondition;
	}
	@Autowired
	private static SystemService systemService;

	public int doStartTag() throws JspTagException {
		return EVAL_PAGE;
	}

	public int doEndTag() throws JspTagException {
		try {
			JspWriter out = this.pageContext.getOut();
			out.print(end().toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return EVAL_PAGE;
	}

	public StringBuffer end() {
		StringBuffer sb = new StringBuffer();
		if (dictTable != null) {
				sb.append(getTextDic());
		} else {
			List<TSType> types = TSTypegroup.allTypes.get(this.typeGroupCode.toLowerCase());
			for(TSType type:types){
				if(type.getTypecode().equals(field)){
					sb.append(type.getTypename());
					break;
				}
			}
		}
		return sb;
	}
	/**
	 * 查询自定义数据字典
	 * 
	 * @作者：Alexander
	 */
	private Object getTextDic() {
		String sql = "select " + dictField + " as field," + dictText
				+ " as text from " + dictTable;
	       if(dictCondition!=null){
	           sql+=" "+dictCondition;
	           sql+=" and "+dictField+"=?";
	       }else{
	    	   sql+=" where "+dictField+"=?";
	       }
		systemService = ApplicationContextUtil.getContext().getBean(
				SystemService.class);
		Map<String, Object> map = systemService.findOneForJdbc(sql,field);
		if(map==null||map.get("text")==null)return "";
		return map.get("text");
	}

	public String getTypeGroupCode() {
		return typeGroupCode;
	}

	public void setTypeGroupCode(String typeGroupCode) {
		this.typeGroupCode = typeGroupCode;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getDefaultVal() {
		return defaultVal;
	}

	public void setDefaultVal(String defaultVal) {
		this.defaultVal = defaultVal;
	}

	public String getField() {
		return field;
	}

	public void setField(String field) {
		this.field = field;
	}

	public String getDictTable() {
		return dictTable;
	}

	public void setDictTable(String dictTable) {
		this.dictTable = dictTable;
	}

	public String getDictField() {
		return dictField;
	}

	public void setDictField(String dictField) {
		this.dictField = dictField;
	}

	public String getDictText() {
		return dictText;
	}

	public void setDictText(String dictText) {
		this.dictText = dictText;
	}
	
}
