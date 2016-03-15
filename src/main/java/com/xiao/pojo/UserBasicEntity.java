package com.xiao.pojo;

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

import com.xiao.pojo.base.UserBasic;

import javax.persistence.SequenceGenerator;

/**   
 * @Title: Entity
 * @Description: 用户基本信息
 * @author zhangdaihao
 * @date 2016-03-16 01:13:00
 * @version V1.0   
 *
 */
@Entity
@Table(name = "user_basic", schema = "")
@SuppressWarnings("serial")
public class UserBasicEntity extends UserBasic implements java.io.Serializable {
	
}
