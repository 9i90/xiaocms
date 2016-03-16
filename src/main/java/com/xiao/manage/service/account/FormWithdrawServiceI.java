package com.xiao.manage.service.account;

import java.util.Date;

import org.jeecgframework.core.common.service.CommonService;

public interface FormWithdrawServiceI extends CommonService{
	/**
	 * 提现审核
	 * @param withDrawId 提现申请ID
	 * @param withdrawTicket 提现凭据号
	 * @param status 审核状态（1：审核通过；-2：审核不通过）
	 * @param remark 备注
	 * @return
	 */
	public void audit(Integer withDrawId,String withdrawTicket,String status,Date notifyTime, String remark);
}
