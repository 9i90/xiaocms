package com.xiao.manage.entity.web;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.GenericGenerator;
import javax.persistence.SequenceGenerator;

/**   
 * @Title: Entity
 * @Description: 网站浏览临时记录
 * @author zhangdaihao
 * @date 2016-03-17 17:20:49
 * @version V1.0   
 *
 */
@Entity
@Table(name = "article_read_temp", schema = "")
@DynamicUpdate(true)
@DynamicInsert(true)
@SuppressWarnings("serial")
public class ArticleReadTempEntity implements java.io.Serializable {
	/**id*/
	private java.lang.String id;
	/**文章ID*/
	private java.lang.Integer articleId;
	/**分享人ID*/
	private java.lang.Integer shareUserId;
	/**阅读时间*/
	private java.util.Date addtime;
	/**阅读IP*/
	private java.lang.String addip;
	/**请求SESSIONID*/
	private java.lang.String sessionId;
	
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  id
	 */
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name ="ID",nullable=false,length=32)
	public java.lang.String getId(){
		return this.id;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  id
	 */
	public void setId(java.lang.String id){
		this.id = id;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  文章ID
	 */
	@Column(name ="ARTICLE_ID",nullable=false,precision=10,scale=0)
	public java.lang.Integer getArticleId(){
		return this.articleId;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  文章ID
	 */
	public void setArticleId(java.lang.Integer articleId){
		this.articleId = articleId;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  分享人ID
	 */
	@Column(name ="SHARE_USER_ID",nullable=true,precision=10,scale=0)
	public java.lang.Integer getShareUserId(){
		return this.shareUserId;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  分享人ID
	 */
	public void setShareUserId(java.lang.Integer shareUserId){
		this.shareUserId = shareUserId;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  阅读时间
	 */
	@Column(name ="ADDTIME",nullable=false)
	public java.util.Date getAddtime(){
		return this.addtime;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  阅读时间
	 */
	public void setAddtime(java.util.Date addtime){
		this.addtime = addtime;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  阅读IP
	 */
	@Column(name ="ADDIP",nullable=false,length=20)
	public java.lang.String getAddip(){
		return this.addip;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  阅读IP
	 */
	public void setAddip(java.lang.String addip){
		this.addip = addip;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  请求SESSIONID
	 */
	@Column(name ="SESSION_ID",nullable=false,length=32)
	public java.lang.String getSessionId(){
		return this.sessionId;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  请求SESSIONID
	 */
	public void setSessionId(java.lang.String sessionId){
		this.sessionId = sessionId;
	}
}
