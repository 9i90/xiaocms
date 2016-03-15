package com.xiao.manage.entity.account;

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
 * @Description: 提现管理
 * @author zhangdaihao
 * @date 2016-03-16 02:59:05
 * @version V1.0   
 *
 */
@Entity
@Table(name = "form_withdraw", schema = "")
@DynamicUpdate(true)
@DynamicInsert(true)
@SuppressWarnings("serial")
public class FormWithdrawEntity implements java.io.Serializable {
	/**编号*/
	private java.lang.Integer id;
	/**申请用户ID*/
	private java.lang.Integer userId;
	/**提现方式（1：支付宝；2：微信）*/
	private java.lang.String type;
	/**提现金额*/
	private BigDecimal amount;
	/**状态（-2：申请不通过；-1：撤回；0：申请中；1：提现成功）*/
	private java.lang.String status;
	/**申请时间*/
	private java.util.Date addtime;
	/**申请IP*/
	private java.lang.String addip;
	/**备注*/
	private java.lang.String remark;
	/**提现凭据号（银行流水号）*/
	private java.lang.String withdrawTicket;
	/**实际到账时间*/
	private java.util.Date notifyTime;
	/**实际到账金额*/
	private BigDecimal yesAmount;
	/**提现手续费*/
	private BigDecimal fee;
	
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  编号
	 */
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name ="ID",nullable=false,precision=10,scale=0)
	public java.lang.Integer getId(){
		return this.id;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  编号
	 */
	public void setId(java.lang.Integer id){
		this.id = id;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  申请用户ID
	 */
	@Column(name ="USER_ID",nullable=false,precision=10,scale=0)
	public java.lang.Integer getUserId(){
		return this.userId;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  申请用户ID
	 */
	public void setUserId(java.lang.Integer userId){
		this.userId = userId;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  提现方式（1：支付宝；2：微信）
	 */
	@Column(name ="TYPE",nullable=false,length=2)
	public java.lang.String getType(){
		return this.type;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  提现方式（1：支付宝；2：微信）
	 */
	public void setType(java.lang.String type){
		this.type = type;
	}
	/**
	 *方法: 取得BigDecimal
	 *@return: BigDecimal  提现金额
	 */
	@Column(name ="AMOUNT",nullable=false,precision=16,scale=2)
	public BigDecimal getAmount(){
		return this.amount;
	}

	/**
	 *方法: 设置BigDecimal
	 *@param: BigDecimal  提现金额
	 */
	public void setAmount(BigDecimal amount){
		this.amount = amount;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  状态（-2：申请不通过；-1：撤回；0：申请中；1：提现成功）
	 */
	@Column(name ="STATUS",nullable=false,length=2)
	public java.lang.String getStatus(){
		return this.status;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  状态（-2：申请不通过；-1：撤回；0：申请中；1：提现成功）
	 */
	public void setStatus(java.lang.String status){
		this.status = status;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  申请时间
	 */
	@Column(name ="ADDTIME",nullable=false)
	public java.util.Date getAddtime(){
		return this.addtime;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  申请时间
	 */
	public void setAddtime(java.util.Date addtime){
		this.addtime = addtime;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  申请IP
	 */
	@Column(name ="ADDIP",nullable=true,length=20)
	public java.lang.String getAddip(){
		return this.addip;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  申请IP
	 */
	public void setAddip(java.lang.String addip){
		this.addip = addip;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  备注
	 */
	@Column(name ="REMARK",nullable=true,length=100)
	public java.lang.String getRemark(){
		return this.remark;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  备注
	 */
	public void setRemark(java.lang.String remark){
		this.remark = remark;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  提现凭据号（银行流水号）
	 */
	@Column(name ="WITHDRAW_TICKET",nullable=true,length=32)
	public java.lang.String getWithdrawTicket(){
		return this.withdrawTicket;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  提现凭据号（银行流水号）
	 */
	public void setWithdrawTicket(java.lang.String withdrawTicket){
		this.withdrawTicket = withdrawTicket;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  实际到账时间
	 */
	@Column(name ="NOTIFY_TIME",nullable=true)
	public java.util.Date getNotifyTime(){
		return this.notifyTime;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  实际到账时间
	 */
	public void setNotifyTime(java.util.Date notifyTime){
		this.notifyTime = notifyTime;
	}
	/**
	 *方法: 取得BigDecimal
	 *@return: BigDecimal  实际到账金额
	 */
	@Column(name ="YES_AMOUNT",nullable=true,precision=16,scale=2)
	public BigDecimal getYesAmount(){
		return this.yesAmount;
	}

	/**
	 *方法: 设置BigDecimal
	 *@param: BigDecimal  实际到账金额
	 */
	public void setYesAmount(BigDecimal yesAmount){
		this.yesAmount = yesAmount;
	}
	/**
	 *方法: 取得BigDecimal
	 *@return: BigDecimal  提现手续费
	 */
	@Column(name ="FEE",nullable=true,precision=16,scale=2)
	public BigDecimal getFee(){
		return this.fee;
	}

	/**
	 *方法: 设置BigDecimal
	 *@param: BigDecimal  提现手续费
	 */
	public void setFee(BigDecimal fee){
		this.fee = fee;
	}
}
