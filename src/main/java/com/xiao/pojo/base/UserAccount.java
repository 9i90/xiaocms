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
 * @Description: 用户账户信息
 * @author zhangdaihao
 * @date 2016-03-16 00:19:33
 * @version V1.0   
 *
 */
@MappedSuperclass
public class UserAccount implements java.io.Serializable {
	/**userId*/
	private java.lang.Integer userId;
	/**总金额*/
	private BigDecimal total;
	/**可用金额*/
	private BigDecimal useMoney;
	/**推广收益*/
	private BigDecimal extensionProfit;
	/**推广收益*/
	private BigDecimal inviteProfit;
	
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
	 *方法: 取得BigDecimal
	 *@return: BigDecimal  总金额
	 */
	@Column(name ="TOTAL",nullable=false,precision=16,scale=2)
	public BigDecimal getTotal(){
		return this.total;
	}

	/**
	 *方法: 设置BigDecimal
	 *@param: BigDecimal  总金额
	 */
	public void setTotal(BigDecimal total){
		this.total = total;
	}
	/**
	 *方法: 取得BigDecimal
	 *@return: BigDecimal  可用金额
	 */
	@Column(name ="USE_MONEY",nullable=false,precision=16,scale=2)
	public BigDecimal getUseMoney(){
		return this.useMoney;
	}

	/**
	 *方法: 设置BigDecimal
	 *@param: BigDecimal  可用金额
	 */
	public void setUseMoney(BigDecimal useMoney){
		this.useMoney = useMoney;
	}
	/**
	 *方法: 取得BigDecimal
	 *@return: BigDecimal  推广收益
	 */
	@Column(name ="EXTENSION_PROFIT",nullable=false,precision=16,scale=2)
	public BigDecimal getExtensionProfit(){
		return this.extensionProfit;
	}

	/**
	 *方法: 设置BigDecimal
	 *@param: BigDecimal  推广收益
	 */
	public void setExtensionProfit(BigDecimal extensionProfit){
		this.extensionProfit = extensionProfit;
	}
	/**
	 *方法: 取得BigDecimal
	 *@return: BigDecimal  推广收益
	 */
	@Column(name ="INVITE_PROFIT",nullable=false,precision=16,scale=2)
	public BigDecimal getInviteProfit(){
		return this.inviteProfit;
	}

	/**
	 *方法: 设置BigDecimal
	 *@param: BigDecimal  推广收益
	 */
	public void setInviteProfit(BigDecimal inviteProfit){
		this.inviteProfit = inviteProfit;
	}
}
