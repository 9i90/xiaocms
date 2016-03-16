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
 * @Description: 用户主信息
 * @author zhangdaihao
 * @date 2016-03-16 03:05:16
 * @version V1.0   
 *
 */
@Entity
@Table(name = "user_info", schema = "")
@DynamicUpdate(true)
@DynamicInsert(true)
@SuppressWarnings("serial")
public class UserInfoEntity implements java.io.Serializable {
	/**userId*/
	private java.lang.Integer userId;
	/**openid*/
	private java.lang.String openid;
	/**微信号*/
	private java.lang.String wxname;
	/**头像url地址*/
	private java.lang.String headUrl;
	/**用户名（预留，后期好像要做注册）*/
	private java.lang.String username;
	/**password*/
	private java.lang.String password;
	/**昵称*/
	private java.lang.String nickname;
	/**邀请人*/
	private java.lang.Integer inviteUser;
	/**注册时间*/
	private java.util.Date addtime;
	/**注册IP*/
	private java.lang.String addip;
	/**状态（1：正常；-1：停用）*/
	private java.lang.String status;
	
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  userId
	 */
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
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
	 *@return: java.lang.String  openid
	 */
	@Column(name ="OPENID",nullable=true,length=64)
	public java.lang.String getOpenid(){
		return this.openid;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  openid
	 */
	public void setOpenid(java.lang.String openid){
		this.openid = openid;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  微信号
	 */
	@Column(name ="WXNAME",nullable=true,length=30)
	public java.lang.String getWxname(){
		return this.wxname;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  微信号
	 */
	public void setWxname(java.lang.String wxname){
		this.wxname = wxname;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  头像url地址
	 */
	@Column(name ="HEAD_URL",nullable=true,length=256)
	public java.lang.String getHeadUrl(){
		return this.headUrl;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  头像url地址
	 */
	public void setHeadUrl(java.lang.String headUrl){
		this.headUrl = headUrl;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  用户名（预留，后期好像要做注册）
	 */
	@Column(name ="USERNAME",nullable=true,length=30)
	public java.lang.String getUsername(){
		return this.username;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  用户名（预留，后期好像要做注册）
	 */
	public void setUsername(java.lang.String username){
		this.username = username;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  password
	 */
	@Column(name ="PASSWORD",nullable=true,length=32)
	public java.lang.String getPassword(){
		return this.password;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  password
	 */
	public void setPassword(java.lang.String password){
		this.password = password;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  昵称
	 */
	@Column(name ="NICKNAME",nullable=true,length=30)
	public java.lang.String getNickname(){
		return this.nickname;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  昵称
	 */
	public void setNickname(java.lang.String nickname){
		this.nickname = nickname;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  邀请人
	 */
	@Column(name ="INVITE_USER",nullable=true,precision=10,scale=0)
	public java.lang.Integer getInviteUser(){
		return this.inviteUser;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  邀请人
	 */
	public void setInviteUser(java.lang.Integer inviteUser){
		this.inviteUser = inviteUser;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  注册时间
	 */
	@Column(name ="ADDTIME",nullable=false)
	public java.util.Date getAddtime(){
		return this.addtime;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  注册时间
	 */
	public void setAddtime(java.util.Date addtime){
		this.addtime = addtime;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  注册IP
	 */
	@Column(name ="ADDIP",nullable=true,length=20)
	public java.lang.String getAddip(){
		return this.addip;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  注册IP
	 */
	public void setAddip(java.lang.String addip){
		this.addip = addip;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  状态（1：正常；-1：停用）
	 */
	@Column(name ="STATUS",nullable=false,length=2)
	public java.lang.String getStatus(){
		return this.status;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  状态（1：正常；-1：停用）
	 */
	public void setStatus(java.lang.String status){
		this.status = status;
	}
}
