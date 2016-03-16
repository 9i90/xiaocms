package com.xiao.manage.entity.user;

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
 * @Description: 用户反馈
 * @author zhangdaihao
 * @date 2016-03-16 03:06:02
 * @version V1.0   
 *
 */
@Entity
@Table(name = "user_opinion", schema = "")
@DynamicUpdate(true)
@DynamicInsert(true)
@SuppressWarnings("serial")
public class UserOpinionEntity implements java.io.Serializable {
	/**id*/
	private java.lang.Integer id;
	/**userId*/
	private java.lang.Integer userId;
	/**反馈标题*/
	private java.lang.String title;
	/**phone*/
	private java.lang.String phone;
	/**反馈内容*/
	private java.lang.String content;
	/**状态（1：反馈发出；2：已处理；）*/
	private java.lang.String status;
	
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
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  userId
	 */
	@Column(name ="USER_ID",nullable=true,precision=10,scale=0)
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
	 *@return: java.lang.String  反馈标题
	 */
	@Column(name ="TITLE",nullable=true,length=200)
	public java.lang.String getTitle(){
		return this.title;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  反馈标题
	 */
	public void setTitle(java.lang.String title){
		this.title = title;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  phone
	 */
	@Column(name ="PHONE",nullable=true,length=15)
	public java.lang.String getPhone(){
		return this.phone;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  phone
	 */
	public void setPhone(java.lang.String phone){
		this.phone = phone;
	}
	/**
	 *方法: 取得java.lang.Object
	 *@return: java.lang.Object  反馈内容
	 */
	@Column(name ="CONTENT",nullable=true,length=4000)
	public java.lang.String getContent(){
		return this.content;
	}

	/**
	 *方法: 设置java.lang.Object
	 *@param: java.lang.Object  反馈内容
	 */
	public void setContent(java.lang.String content){
		this.content = content;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  状态（1：反馈发出；2：已处理；）
	 */
	@Column(name ="STATUS",nullable=false,length=2)
	public java.lang.String getStatus(){
		return this.status;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  状态（1：反馈发出；2：已处理；）
	 */
	public void setStatus(java.lang.String status){
		this.status = status;
	}
}
