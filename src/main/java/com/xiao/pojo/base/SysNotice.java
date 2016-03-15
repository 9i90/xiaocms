package com.xiao.pojo.base;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.SequenceGenerator;

/**   
 * @Title: Entity
 * @Description: 系统公告
 * @author zhangdaihao
 * @date 2016-03-16 01:14:58
 * @version V1.0   
 *
 */
@MappedSuperclass
public class SysNotice implements java.io.Serializable {
	/**id*/
	private java.lang.Integer id;
	/**标题*/
	private java.lang.String title;
	/**内容*/
	private java.lang.Object content;
	/**录入时间*/
	private java.util.Date addtime;
	/**状态（0：草稿；1：发布；2：关闭）*/
	private java.lang.String status;
	/**发布时间*/
	private java.util.Date publish;
	
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  id
	 */
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name ="ID",nullable=false,precision=10,scale=0)
	public java.lang.Integer getId(){
		return this.id;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  id
	 */
	public void setId(java.lang.Integer id){
		this.id = id;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  标题
	 */
	@Column(name ="TITLE",nullable=false,length=20)
	public java.lang.String getTitle(){
		return this.title;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  标题
	 */
	public void setTitle(java.lang.String title){
		this.title = title;
	}
	/**
	 *方法: 取得java.lang.Object
	 *@return: java.lang.Object  内容
	 */
	@Column(name ="CONTENT",nullable=false,length=65535)
	public java.lang.Object getContent(){
		return this.content;
	}

	/**
	 *方法: 设置java.lang.Object
	 *@param: java.lang.Object  内容
	 */
	public void setContent(java.lang.Object content){
		this.content = content;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  录入时间
	 */
	@Column(name ="ADDTIME",nullable=false)
	public java.util.Date getAddtime(){
		return this.addtime;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  录入时间
	 */
	public void setAddtime(java.util.Date addtime){
		this.addtime = addtime;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  状态（0：草稿；1：发布；2：关闭）
	 */
	@Column(name ="STATUS",nullable=false,length=2)
	public java.lang.String getStatus(){
		return this.status;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  状态（0：草稿；1：发布；2：关闭）
	 */
	public void setStatus(java.lang.String status){
		this.status = status;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  发布时间
	 */
	@Column(name ="PUBLISH",nullable=false)
	public java.util.Date getPublish(){
		return this.publish;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  发布时间
	 */
	public void setPublish(java.util.Date publish){
		this.publish = publish;
	}
}
