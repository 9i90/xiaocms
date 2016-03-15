package com.xiao.pojo;


import javax.persistence.Entity;
import javax.persistence.Table;
import com.xiao.pojo.base.UserSign;

/**   
 * @Title: Entity
 * @Description: 用户签到
 * @author zhangdaihao
 * @date 2016-03-16 01:20:00
 * @version V1.0   
 *
 */
@Entity
@Table(name = "user_sign", schema = "")
@SuppressWarnings("serial")
public class UserSignEntity extends UserSign implements java.io.Serializable {
	
}
