package com.xiao.pojo;


import javax.persistence.Entity;
import javax.persistence.Table;
import com.xiao.pojo.base.FormWithdraw;

/**   
 * @Title: Entity
 * @Description: 提现管理
 * @author zhangdaihao
 * @date 2016-03-16 01:13:57
 * @version V1.0   
 *
 */
@Entity
@Table(name = "form_withdraw", schema = "")
@SuppressWarnings("serial")
public class FormWithdrawEntity extends FormWithdraw implements java.io.Serializable {
	
}
