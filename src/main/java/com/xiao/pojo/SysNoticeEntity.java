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

import com.xiao.pojo.base.SysNotice;

import javax.persistence.SequenceGenerator;

/**   
 * @Title: Entity
 * @Description: 系统公告
 * @author zhangdaihao
 * @date 2016-03-16 01:14:58
 * @version V1.0   
 *
 */
@Entity
@Table(name = "sys_notice", schema = "")
@SuppressWarnings("serial")
public class SysNoticeEntity extends SysNotice implements java.io.Serializable {
	
}
