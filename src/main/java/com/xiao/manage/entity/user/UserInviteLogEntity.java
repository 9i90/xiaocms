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
 * @Description: 用户邀请收益记录
 * @author zhangdaihao
 * @date 2016-03-16 11:29:09
 * @version V1.0   
 *
 */
@Entity
@Table(name = "user_invite_log", schema = "")
@DynamicUpdate(true)
@DynamicInsert(true)
@SuppressWarnings("serial")
public class UserInviteLogEntity implements java.io.Serializable {
	/**id*/
	private java.lang.Integer id;
	/**用户ID*/
	private java.lang.Integer userId;
	/**好友ID*/
	private java.lang.Integer friendId;
	/**邀请收益*/
	private BigDecimal inviteProfit;
	/**分成收益*/
	private BigDecimal shareProfit;
	/**收益获取时间*/
	private java.util.Date addtime;
	
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
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  好友ID
	 */
	@Column(name ="FRIEND_ID",nullable=false,precision=10,scale=0)
	public java.lang.Integer getFriendId(){
		return this.friendId;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  好友ID
	 */
	public void setFriendId(java.lang.Integer friendId){
		this.friendId = friendId;
	}
	/**
	 *方法: 取得BigDecimal
	 *@return: BigDecimal  邀请收益
	 */
	@Column(name ="INVITE_PROFIT",nullable=false,precision=16,scale=2)
	public BigDecimal getInviteProfit(){
		return this.inviteProfit;
	}

	/**
	 *方法: 设置BigDecimal
	 *@param: BigDecimal  邀请收益
	 */
	public void setInviteProfit(BigDecimal inviteProfit){
		this.inviteProfit = inviteProfit;
	}
	/**
	 *方法: 取得BigDecimal
	 *@return: BigDecimal  分成收益
	 */
	@Column(name ="SHARE_PROFIT",nullable=false,precision=16,scale=2)
	public BigDecimal getShareProfit(){
		return this.shareProfit;
	}

	/**
	 *方法: 设置BigDecimal
	 *@param: BigDecimal  分成收益
	 */
	public void setShareProfit(BigDecimal shareProfit){
		this.shareProfit = shareProfit;
	}
	/**
	 *方法: 取得java.util.Date
	 *@return: java.util.Date  收益获取时间
	 */
	@Column(name ="ADDTIME",nullable=false)
	public java.util.Date getAddtime(){
		return this.addtime;
	}

	/**
	 *方法: 设置java.util.Date
	 *@param: java.util.Date  收益获取时间
	 */
	public void setAddtime(java.util.Date addtime){
		this.addtime = addtime;
	}
}
