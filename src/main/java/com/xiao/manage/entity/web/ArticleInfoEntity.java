package com.xiao.manage.entity.web;

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
 * @Description: 文章管理
 * @author zhangdaihao
 * @date 2016-03-18 01:20:20
 * @version V1.0   
 *
 */
@Entity
@Table(name = "article_info", schema = "")
@DynamicUpdate(true)
@DynamicInsert(true)
@SuppressWarnings("serial")
public class ArticleInfoEntity implements java.io.Serializable {
	/**id*/
	private java.lang.Integer id;
	/**值为0,1,2三个标示。0为删除状态，1为显示状态，2为隐藏状态*/
	private java.lang.String status;
	/**所属栏目*/
	private java.lang.String siteCode;
	/**文章分类（多个逗号分隔）*/
	private java.lang.String type;
	/**标题*/
	private java.lang.String title;
	/**关键字（多个逗号分隔）*/
	private java.lang.String keyword;
	/**图片地址*/
	private java.lang.String litpic;
	/**作者*/
	private java.lang.String author;
	/**是否热门（1：热门；0：非热门）*/
	private java.lang.String hot;
	/**站长推荐（1：推荐；0：不推荐）*/
	private java.lang.String recommended;
	/**内容*/
	private java.lang.Object content;
	/**录入时间*/
	private java.util.Date addtime;
	/**文章来源(user：用户后台录入;sina：新浪;等等其他自己根据需要编)*/
	private java.lang.String source;
	/**浏览次数*/
	private java.lang.Integer readCount;
	
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
	 *@return: java.lang.String  值为0,1,2三个标示。0为删除状态，1为显示状态，2为隐藏状态
	 */
	@Column(name ="STATUS",nullable=false,length=2)
	public java.lang.String getStatus(){
		return this.status;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  值为0,1,2三个标示。0为删除状态，1为显示状态，2为隐藏状态
	 */
	public void setStatus(java.lang.String status){
		this.status = status;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  所属栏目
	 */
	@Column(name ="SITE_CODE",nullable=false,length=20)
	public java.lang.String getSiteCode(){
		return this.siteCode;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  所属栏目
	 */
	public void setSiteCode(java.lang.String siteCode){
		this.siteCode = siteCode;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  文章分类（多个逗号分隔）
	 */
	@Column(name ="TYPE",nullable=false,length=200)
	public java.lang.String getType(){
		return this.type;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  文章分类（多个逗号分隔）
	 */
	public void setType(java.lang.String type){
		this.type = type;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  标题
	 */
	@Column(name ="TITLE",nullable=false,length=255)
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
	 *@return: java.lang.String  关键字（多个逗号分隔）
	 */
	@Column(name ="KEYWORD",nullable=true,length=255)
	public java.lang.String getKeyword(){
		return this.keyword;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  关键字（多个逗号分隔）
	 */
	public void setKeyword(java.lang.String keyword){
		this.keyword = keyword;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  图片地址
	 */
	@Column(name ="LITPIC",nullable=true,length=255)
	public java.lang.String getLitpic(){
		return this.litpic;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  图片地址
	 */
	public void setLitpic(java.lang.String litpic){
		this.litpic = litpic;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  作者
	 */
	@Column(name ="AUTHOR",nullable=true,length=255)
	public java.lang.String getAuthor(){
		return this.author;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  作者
	 */
	public void setAuthor(java.lang.String author){
		this.author = author;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  是否热门（1：热门；0：非热门）
	 */
	@Column(name ="HOT",nullable=true,length=2)
	public java.lang.String getHot(){
		return this.hot;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  是否热门（1：热门；0：非热门）
	 */
	public void setHot(java.lang.String hot){
		this.hot = hot;
	}
	/**
	 *方法: 取得java.lang.String
	 *@return: java.lang.String  站长推荐（1：推荐；0：不推荐）
	 */
	@Column(name ="RECOMMENDED",nullable=false,length=2)
	public java.lang.String getRecommended(){
		return this.recommended;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  站长推荐（1：推荐；0：不推荐）
	 */
	public void setRecommended(java.lang.String recommended){
		this.recommended = recommended;
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
	 *@return: java.lang.String  文章来源(user：用户后台录入;sina：新浪;等等其他自己根据需要编)
	 */
	@Column(name ="SOURCE",nullable=false,length=15)
	public java.lang.String getSource(){
		return this.source;
	}

	/**
	 *方法: 设置java.lang.String
	 *@param: java.lang.String  文章来源(user：用户后台录入;sina：新浪;等等其他自己根据需要编)
	 */
	public void setSource(java.lang.String source){
		this.source = source;
	}
	/**
	 *方法: 取得java.lang.Integer
	 *@return: java.lang.Integer  浏览次数
	 */
	@Column(name ="READ_COUNT",nullable=false,precision=10,scale=0)
	public java.lang.Integer getReadCount(){
		return this.readCount;
	}

	/**
	 *方法: 设置java.lang.Integer
	 *@param: java.lang.Integer  浏览次数
	 */
	public void setReadCount(java.lang.Integer readCount){
		this.readCount = readCount;
	}
}
