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
 * @Description: 站内信
 * @author zhangdaihao
 * @date 2016-03-16 01:15:49
 * @version V1.0   
 *
 */
@MappedSuperclass
public class UserNotice implements java.io.Serializable {
	/**序列*/
	private java.lang.Integer id;
	/**userId*/
	private java.lang.Integer userId;
	/**标题*/
	private java.lang.String title;
	/**类型，默认为0， 后续备用*/
	private java.lang.String type;
	/**内容*/
	private java.lang.Object context;
	/**发送时间*/
	private java.util.Date sendtime;
	/**阅读时间*/
	private java.util.Date opentime;
	/**状态  0未读，1 已读，3 删除*/
	private java.lang.String status;
	
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  序列
	 */
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name ="ID",nullable=false,precision=10,scale=0)
	public java.lang.Integer getId(){
		return this.id;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  序列
	 */
	public void setId(java.lang.Integer id){
		this.id = id;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  userId
	 */
	@Column(name ="USER_ID",nullable=false,precision=10,scale=0)
	public java.lang.Integer getUserId(){
		return this.userId;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  userId
	 */
	public void setUserId(java.lang.Integer userId){
		this.userId = userId;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  标题
	 */
	@Column(name ="TITLE",nullable=true,length=256)
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
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  类型，默认为0， 后续备用
	 */
	@Column(name ="TYPE",nullable=true,length=4)
	public java.lang.String getType(){
		return this.type;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  类型，默认为0， 后续备用
	 */
	public void setType(java.lang.String type){
		this.type = type;
	}
	/**
	 *方法: 取得java.lang.Object
	 *@return: java.lang.Object  内容
	 */
	@Column(name ="CONTEXT",nullable=true,length=65535)
	public java.lang.Object getContext(){
		return this.context;
	}

	/**
	 *方法: 设置java.lang.Object
	 *@param: java.lang.Object  内容
	 */
	public void setContext(java.lang.Object context){
		this.context = context;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  发送时间
	 */
	@Column(name ="SENDTIME",nullable=true)
	public java.util.Date getSendtime(){
		return this.sendtime;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  发送时间
	 */
	public void setSendtime(java.util.Date sendtime){
		this.sendtime = sendtime;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  阅读时间
	 */
	@Column(name ="OPENTIME",nullable=true)
	public java.util.Date getOpentime(){
		return this.opentime;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  阅读时间
	 */
	public void setOpentime(java.util.Date opentime){
		this.opentime = opentime;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  状态  0未读，1 已读，3 删除
	 */
	@Column(name ="STATUS",nullable=true,length=4)
	public java.lang.String getStatus(){
		return this.status;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  状态  0未读，1 已读，3 删除
	 */
	public void setStatus(java.lang.String status){
		this.status = status;
	}
}
