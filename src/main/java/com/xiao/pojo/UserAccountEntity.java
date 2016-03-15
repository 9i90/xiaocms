package com.xiao.pojo;

import javax.persistence.Entity;
import javax.persistence.MappedSuperclass;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import com.xiao.pojo.base.UserAccount;

/**   
 * @Title: Entity
 * @Description: 用户账户信息
 * @author zhangdaihao
 * @date 2016-03-16 00:19:33
 * @version V1.0   
 *
 */
@Entity
@Table(name = "user_account", schema = "")
//@DynamicUpdate(true)
//@DynamicInsert(true)
@SuppressWarnings("serial")
public class UserAccountEntity extends UserAccount implements java.io.Serializable {
	
}
