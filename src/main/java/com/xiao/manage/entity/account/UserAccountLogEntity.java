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
 * @Description: 用户资金流水
 * @author zhangdaihao
 * @date 2016-03-17 02:08:59
 * @version V1.0   
 *
 */
@Entity
@Table(name = "user_account_log", schema = "")
@DynamicUpdate(true)
@DynamicInsert(true)
@SuppressWarnings("serial")
public class UserAccountLogEntity implements java.io.Serializable {
	/**id*/
	private java.lang.Integer id;
	/**userId*/
	private java.lang.Integer userId;
	/**资金变动类型*/
	private java.lang.String type;
	/**变动资金*/
	private BigDecimal money;
	/**关联数据ID*/
	private java.lang.String dataId;
	/**资金变动时间*/
	private java.util.Date addtime;
	/**变动前总金额*/
	private BigDecimal oldTotal;
	/**变动前可用金额*/
	private BigDecimal oldUseMoney;
	/**变动前推广收益*/
	private BigDecimal oldExtensionProfit;
	/**变动前邀请收益*/
	private BigDecimal oldInviteProfit;
	/**变动后总金额*/
	private BigDecimal newTotal;
	/**变动后总可用*/
	private BigDecimal newUseMoney;
	/**变动后推广收益*/
	private BigDecimal newExtensionProfit;
	/**变动后邀请收益*/
	private BigDecimal newInviteProfit;
	
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
	 *@return: java.lang.String  资金变动类型
	 */
	@Column(name ="TYPE",nullable=false,length=10)
	public java.lang.String getType(){
		return this.type;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  资金变动类型
	 */
	public void setType(java.lang.String type){
		this.type = type;
	}
	/**
	 *方法: 取得BigDecimal
	 *@return: BigDecimal  变动资金
	 */
	@Column(name ="MONEY",nullable=false,precision=16,scale=2)
	public BigDecimal getMoney(){
		return this.money;
	}

	/**
	 *方法: 设置BigDecimal
	 *@param: BigDecimal  变动资金
	 */
	public void setMoney(BigDecimal money){
		this.money = money;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  关联数据ID
	 */
	@Column(name ="DATA_ID",nullable=true,length=32)
	public java.lang.String getDataId(){
		return this.dataId;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  关联数据ID
	 */
	public void setDataId(java.lang.String dataId){
		this.dataId = dataId;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  资金变动时间
	 */
	@Column(name ="ADDTIME",nullable=false)
	public java.util.Date getAddtime(){
		return this.addtime;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  资金变动时间
	 */
	public void setAddtime(java.util.Date addtime){
		this.addtime = addtime;
	}
	/**
	 *方法: 取得BigDecimal
	 *@return: BigDecimal  变动前总金额
	 */
	@Column(name ="OLD_TOTAL",nullable=false,precision=16,scale=2)
	public BigDecimal getOldTotal(){
		return this.oldTotal;
	}

	/**
	 *方法: 设置BigDecimal
	 *@param: BigDecimal  变动前总金额
	 */
	public void setOldTotal(BigDecimal oldTotal){
		this.oldTotal = oldTotal;
	}
	/**
	 *方法: 取得BigDecimal
	 *@return: BigDecimal  变动前可用金额
	 */
	@Column(name ="OLD_USE_MONEY",nullable=false,precision=16,scale=2)
	public BigDecimal getOldUseMoney(){
		return this.oldUseMoney;
	}

	/**
	 *方法: 设置BigDecimal
	 *@param: BigDecimal  变动前可用金额
	 */
	public void setOldUseMoney(BigDecimal oldUseMoney){
		this.oldUseMoney = oldUseMoney;
	}
	/**
	 *方法: 取得BigDecimal
	 *@return: BigDecimal  变动前推广收益
	 */
	@Column(name ="OLD_EXTENSION_PROFIT",nullable=false,precision=16,scale=2)
	public BigDecimal getOldExtensionProfit(){
		return this.oldExtensionProfit;
	}

	/**
	 *方法: 设置BigDecimal
	 *@param: BigDecimal  变动前推广收益
	 */
	public void setOldExtensionProfit(BigDecimal oldExtensionProfit){
		this.oldExtensionProfit = oldExtensionProfit;
	}
	/**
	 *方法: 取得BigDecimal
	 *@return: BigDecimal  变动前邀请收益
	 */
	@Column(name ="OLD_INVITE_PROFIT",nullable=false,precision=16,scale=2)
	public BigDecimal getOldInviteProfit(){
		return this.oldInviteProfit;
	}

	/**
	 *方法: 设置BigDecimal
	 *@param: BigDecimal  变动前邀请收益
	 */
	public void setOldInviteProfit(BigDecimal oldInviteProfit){
		this.oldInviteProfit = oldInviteProfit;
	}
	/**
	 *方法: 取得BigDecimal
	 *@return: BigDecimal  变动后总金额
	 */
	@Column(name ="NEW_TOTAL",nullable=false,precision=16,scale=2)
	public BigDecimal getNewTotal(){
		return this.newTotal;
	}

	/**
	 *方法: 设置BigDecimal
	 *@param: BigDecimal  变动后总金额
	 */
	public void setNewTotal(BigDecimal newTotal){
		this.newTotal = newTotal;
	}
	/**
	 *方法: 取得BigDecimal
	 *@return: BigDecimal  变动后总可用
	 */
	@Column(name ="NEW_USE_MONEY",nullable=false,precision=16,scale=2)
	public BigDecimal getNewUseMoney(){
		return this.newUseMoney;
	}

	/**
	 *方法: 设置BigDecimal
	 *@param: BigDecimal  变动后总可用
	 */
	public void setNewUseMoney(BigDecimal newUseMoney){
		this.newUseMoney = newUseMoney;
	}
	/**
	 *方法: 取得BigDecimal
	 *@return: BigDecimal  变动后推广收益
	 */
	@Column(name ="NEW_EXTENSION_PROFIT",nullable=false,precision=16,scale=2)
	public BigDecimal getNewExtensionProfit(){
		return this.newExtensionProfit;
	}

	/**
	 *方法: 设置BigDecimal
	 *@param: BigDecimal  变动后推广收益
	 */
	public void setNewExtensionProfit(BigDecimal newExtensionProfit){
		this.newExtensionProfit = newExtensionProfit;
	}
	/**
	 *方法: 取得BigDecimal
	 *@return: BigDecimal  变动后邀请收益
	 */
	@Column(name ="NEW_INVITE_PROFIT",nullable=false,precision=16,scale=2)
	public BigDecimal getNewInviteProfit(){
		return this.newInviteProfit;
	}

	/**
	 *方法: 设置BigDecimal
	 *@param: BigDecimal  变动后邀请收益
	 */
	public void setNewInviteProfit(BigDecimal newInviteProfit){
		this.newInviteProfit = newInviteProfit;
	}
}
