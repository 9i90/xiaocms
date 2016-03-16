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
 * @Description: 用户推广收益记录
 * @author zhangdaihao
 * @date 2016-03-16 11:28:41
 * @version V1.0   
 *
 */
@Entity
@Table(name = "user_extension_log", schema = "")
@DynamicUpdate(true)
@DynamicInsert(true)
@SuppressWarnings("serial")
public class UserExtensionLogEntity implements java.io.Serializable {
	/**id*/
	private java.lang.Integer id;
	/**用户ID*/
	private java.lang.Integer userId;
	/**获取收益时间*/
	private java.util.Date addtime;
	/**收益*/
	private BigDecimal money;
	/**收益来源（1：分享文章被浏览）*/
	private java.lang.String source;
	
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
	 *@return: java.lang.Integer  用户ID
	 */
	@Column(name ="USER_ID",nullable=false,precision=10,scale=0)
	public java.lang.Integer getUserId(){
		return this.userId;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  用户ID
	 */
	public void setUserId(java.lang.Integer userId){
		this.userId = userId;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  获取收益时间
	 */
	@Column(name ="ADDTIME",nullable=false)
	public java.util.Date getAddtime(){
		return this.addtime;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  获取收益时间
	 */
	public void setAddtime(java.util.Date addtime){
		this.addtime = addtime;
	}
	/**
	 *方法: 取得BigDecimal
	 *@return: BigDecimal  收益
	 */
	@Column(name ="MONEY",nullable=false,precision=16,scale=2)
	public BigDecimal getMoney(){
		return this.money;
	}

	/**
	 *方法: 设置BigDecimal
	 *@param: BigDecimal  收益
	 */
	public void setMoney(BigDecimal money){
		this.money = money;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  收益来源（1：分享文章被浏览）
	 */
	@Column(name ="SOURCE",nullable=false,length=10)
	public java.lang.String getSource(){
		return this.source;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  收益来源（1：分享文章被浏览）
	 */
	public void setSource(java.lang.String source){
		this.source = source;
	}
}
