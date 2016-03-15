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
 * @Description: 用户基本信息
 * @author zhangdaihao
 * @date 2016-03-16 03:05:02
 * @version V1.0   
 *
 */
@Entity
@Table(name = "user_basic", schema = "")
@DynamicUpdate(true)
@DynamicInsert(true)
@SuppressWarnings("serial")
public class UserBasicEntity implements java.io.Serializable {
	/**userId*/
	private java.lang.Integer userId;
	/**真实姓名*/
	private java.lang.String realname;
	/**手机号*/
	private java.lang.String phone;
	/**性别（M：男，F：女）*/
	private java.lang.String gender;
	/**出生省*/
	private java.lang.String birthProvince;
	/**出生城市*/
	private java.lang.String birthCity;
	/**常住地址*/
	private java.lang.String address;
	/**行业*/
	private java.lang.String professionCode;
	/**年龄范围*/
	private java.lang.String ageScope;
	/**收入范围*/
	private java.lang.String revenue;
	/**资料完善时间*/
	private java.util.Date addtime;
	
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
	 *@return: java.lang.String  真实姓名
	 */
	@Column(name ="REALNAME",nullable=false,length=30)
	public java.lang.String getRealname(){
		return this.realname;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  真实姓名
	 */
	public void setRealname(java.lang.String realname){
		this.realname = realname;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  手机号
	 */
	@Column(name ="PHONE",nullable=false,length=15)
	public java.lang.String getPhone(){
		return this.phone;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  手机号
	 */
	public void setPhone(java.lang.String phone){
		this.phone = phone;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  性别（M：男，F：女）
	 */
	@Column(name ="GENDER",nullable=false,length=2)
	public java.lang.String getGender(){
		return this.gender;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  性别（M：男，F：女）
	 */
	public void setGender(java.lang.String gender){
		this.gender = gender;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  出生省
	 */
	@Column(name ="BIRTH_PROVINCE",nullable=true,length=50)
	public java.lang.String getBirthProvince(){
		return this.birthProvince;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  出生省
	 */
	public void setBirthProvince(java.lang.String birthProvince){
		this.birthProvince = birthProvince;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  出生城市
	 */
	@Column(name ="BIRTH_CITY",nullable=true,length=50)
	public java.lang.String getBirthCity(){
		return this.birthCity;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  出生城市
	 */
	public void setBirthCity(java.lang.String birthCity){
		this.birthCity = birthCity;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  常住地址
	 */
	@Column(name ="ADDRESS",nullable=true,length=200)
	public java.lang.String getAddress(){
		return this.address;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  常住地址
	 */
	public void setAddress(java.lang.String address){
		this.address = address;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  行业
	 */
	@Column(name ="PROFESSION_CODE",nullable=true,length=10)
	public java.lang.String getProfessionCode(){
		return this.professionCode;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  行业
	 */
	public void setProfessionCode(java.lang.String professionCode){
		this.professionCode = professionCode;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  年龄范围
	 */
	@Column(name ="AGE_SCOPE",nullable=true,length=10)
	public java.lang.String getAgeScope(){
		return this.ageScope;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  年龄范围
	 */
	public void setAgeScope(java.lang.String ageScope){
		this.ageScope = ageScope;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  收入范围
	 */
	@Column(name ="REVENUE",nullable=true,length=10)
	public java.lang.String getRevenue(){
		return this.revenue;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  收入范围
	 */
	public void setRevenue(java.lang.String revenue){
		this.revenue = revenue;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  资料完善时间
	 */
	@Column(name ="ADDTIME",nullable=false)
	public java.util.Date getAddtime(){
		return this.addtime;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  资料完善时间
	 */
	public void setAddtime(java.util.Date addtime){
		this.addtime = addtime;
	}
}
