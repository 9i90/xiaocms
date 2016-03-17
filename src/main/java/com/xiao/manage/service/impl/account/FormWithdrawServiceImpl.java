package com.xiao.manage.service.impl.account;

import java.math.BigDecimal;
import java.util.Date;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xiao.manage.entity.account.FormWithdrawEntity;
import com.xiao.manage.entity.account.UserAccountEntity;
import com.xiao.manage.entity.account.UserAccountLogEntity;
import com.xiao.manage.entity.user.UserNoticeEntity;
import com.xiao.manage.service.account.FormWithdrawServiceI;

import org.jeecgframework.core.common.service.impl.CommonServiceImpl;

@Service("formWithdrawService")
@Transactional
public class FormWithdrawServiceImpl extends CommonServiceImpl implements FormWithdrawServiceI {
	/**
	 * 提现审核
	 * @param withDrawId 提现申请ID
	 * @param withdrawTicket 提现凭据号
	 * @param status 审核状态（1：审核通过；-2：审核不通过）
	 * @param remark 备注
	 * @return
	 */
	@Override
	public void audit(Integer withDrawId,String withdrawTicket, String status,Date notifyTime, String remark) {
		FormWithdrawEntity t = commonDao.get(FormWithdrawEntity.class, withDrawId);
		if(t==null)throw new RuntimeException("提现订单不存在");
		if(!"0".equals(t.getStatus()))throw new RuntimeException("已经处理，非法操作");
		//提现成功业务处理
		if("1".equals(status)){
			t.setYesAmount(t.getAmount());
			t.setFee(new BigDecimal(0));
			t.setRemark(remark);
			t.setWithdrawTicket(withdrawTicket);
			t.setNotifyTime(notifyTime);
			t.setStatus("1");
			commonDao.saveOrUpdate(t);
			
			UserAccountEntity account = commonDao.get(UserAccountEntity.class, t.getUserId());
			
			
			UserAccountLogEntity accountLog = new UserAccountLogEntity();
			accountLog.setUserId(account.getUserId());
			accountLog.setType("2005");//提现到账
			accountLog.setDataId(t.getId().toString());
			accountLog.setMoney(t.getAmount());
			accountLog.setOldTotal(account.getTotal());
			accountLog.setOldUseMoney(account.getUseMoney());
			accountLog.setOldExtensionProfit(account.getExtensionProfit());
			accountLog.setOldInviteProfit(account.getInviteProfit());
			
			//更新账户表
			account.setTotal(account.getTotal().subtract(t.getAmount()));
			if(account.getTotal().doubleValue()<0||account.getUseMoney().doubleValue()<0||account.getExtensionProfit().doubleValue()<0||account.getInviteProfit().doubleValue()<0){
				throw new RuntimeException("账户异常");
			}
			commonDao.saveOrUpdate(account);
			
			accountLog.setNewTotal(account.getTotal());
			accountLog.setNewUseMoney(account.getUseMoney());
			accountLog.setNewExtensionProfit(account.getExtensionProfit());
			accountLog.setNewInviteProfit(account.getInviteProfit());
			accountLog.setAddtime(new Date());
			//账户变动日志
			commonDao.save(accountLog);
		}else if("-2".equals(status)){
			t.setRemark(remark);
			t.setStatus("-2");
			commonDao.saveOrUpdate(t);
			
			UserAccountEntity account = commonDao.get(UserAccountEntity.class, t.getUserId());
			
			
			UserAccountLogEntity accountLog = new UserAccountLogEntity();
			accountLog.setUserId(account.getUserId());
			accountLog.setType("2006");//提现不通过资金解冻
			accountLog.setDataId(t.getId().toString());
			accountLog.setMoney(t.getAmount());
			accountLog.setOldTotal(account.getTotal());
			accountLog.setOldUseMoney(account.getUseMoney());
			accountLog.setOldExtensionProfit(account.getExtensionProfit());
			accountLog.setOldInviteProfit(account.getInviteProfit());
			
			//更新账户表
			account.setUseMoney(account.getUseMoney().add(t.getAmount()));
			if(account.getTotal().doubleValue()<0||account.getUseMoney().doubleValue()<0||account.getExtensionProfit().doubleValue()<0||account.getInviteProfit().doubleValue()<0){
				throw new RuntimeException("账户异常");
			}
			commonDao.saveOrUpdate(account);
			
			accountLog.setNewTotal(account.getTotal());
			accountLog.setNewUseMoney(account.getUseMoney());
			accountLog.setNewExtensionProfit(account.getExtensionProfit());
			accountLog.setNewInviteProfit(account.getInviteProfit());
			accountLog.setAddtime(new Date());
			//账户变动日志
			commonDao.save(accountLog);
		}else{
			throw new RuntimeException("不支持的操作");
		}
		
	}
	
}