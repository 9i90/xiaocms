package com.xiao.manage.service.impl.account;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xiao.manage.entity.account.UserAccountEntity;
import com.xiao.manage.entity.account.UserAccountLogEntity;
import com.xiao.manage.entity.web.ArticleReadRecordEntity;
import com.xiao.manage.entity.web.ArticleReadTempEntity;
import com.xiao.manage.service.account.UserAccountServiceI;

import org.jeecgframework.core.common.service.impl.CommonServiceImpl;
import org.jeecgframework.core.util.MyBeanUtils;
import org.jeecgframework.web.system.pojo.base.TSConfig;

@Service("userAccountService")
@Transactional
public class UserAccountServiceImpl extends CommonServiceImpl implements UserAccountServiceI {

	@Override
	public void updateShareProfit() {
		int querySize = 500;
		TSConfig querySizeConfig = commonDao.findUniqueByProperty(TSConfig.class, "code", "querySize");
		if(querySizeConfig!=null){
			try{
				querySize = Integer.parseInt(querySizeConfig.getContents());
			}catch(Exception e){
				querySize = 500;
			}
		}
		
		//没有分享人的浏览记录直接放入历史表
		commonDao.executeSql("insert into article_read_temp select * from article_read_record where share_user_id is null");
		commonDao.executeSql("insert into article_read_history select * from article_read_temp");
		commonDao.executeSql("delete from  article_read_record where id in (select id from article_read_temp)");
		commonDao.executeSql("delete from  article_read_temp");
		
		//TODO 过滤重复浏览IP限制等的记录
		String sql="";
		sql+=" select * from article_read_record ";
		sql+=" where id not in(";
		sql+=" select min(id) from article_read_record group by  article_id,share_user_id,addip having count(*)>1";
		sql+=" )";
		sql+=" and id not in(";
		sql+=" select id from article_read_record group by  article_id,share_user_id,addip having count(*)=1";
		sql+=" )";
		commonDao.executeSql("insert into article_read_temp "+sql);
		commonDao.executeSql("insert into article_read_history select * from article_read_temp");
		commonDao.executeSql("delete from  article_read_record where id in (select id from article_read_temp)");
		commonDao.executeSql("delete from  article_read_temp");
		
		
		int shareProfitSize = 30;
		TSConfig shareConfig = commonDao.findUniqueByProperty(TSConfig.class, "code", "shareProfitSize");
		if(shareConfig!=null){
			try{
				shareProfitSize = Integer.parseInt(shareConfig.getContents());
			}catch(Exception e){
				shareProfitSize = 30;
			}
		}
		double shareProfitMoney = 0.0;
		TSConfig shareMoneyConfig = commonDao.findUniqueByProperty(TSConfig.class, "code", "shareProfitMoney");
		if(shareMoneyConfig!=null){
			try{
				shareProfitMoney = Integer.parseInt(shareMoneyConfig.getContents());
			}catch(Exception e){
				shareProfitMoney = 0.0;
			}
		}
		//有人分享的记录进行收益计算再转入历史表
		List<Map<String, Object>> shareUserList = commonDao.findForJdbc("SELECT share_user_id,count(*) as count from article_read_record where share_user_id is not null GROUP BY share_user_id HAVING count(share_user_id)>"+shareProfitSize, 1, querySize);
		for(Map<String,Object> map:shareUserList){
			Integer userId = (Integer)map.get("share_user_id");
			Integer count = Integer.parseInt(map.get("count").toString());
			
			//临时数据移植到历史数据
			int n = count/shareProfitSize;
			
			commonDao.executeSql("insert into article_read_temp select * from article_read_record where share_user_id=? limit 0,?",userId,n*shareProfitSize);
			commonDao.executeSql("insert into article_read_history select * from article_read_temp");
			commonDao.executeSql("delete from  article_read_record where id in (select id from article_read_temp)");
			commonDao.executeSql("delete from  article_read_temp");
			
			
//			commonDao.deleteAllEntitie(shareTempList);
//			commonDao.batchSave(shareList);
			
			//收益累计
			double profit = shareProfitMoney*n;
			
			UserAccountEntity account = commonDao.get(UserAccountEntity.class, userId);
			
			
			UserAccountLogEntity accountLog = new UserAccountLogEntity();
			accountLog.setUserId(account.getUserId());
			accountLog.setType("3001");//分享被阅读收益增加
			accountLog.setDataId(null);
			accountLog.setMoney(new BigDecimal(profit));
			accountLog.setOldTotal(account.getTotal());
			accountLog.setOldUseMoney(account.getUseMoney());
			accountLog.setOldExtensionProfit(account.getExtensionProfit());
			accountLog.setOldInviteProfit(account.getInviteProfit());
			
			//更新账户表
			account.setUseMoney(account.getUseMoney().add(new BigDecimal(profit)));
			account.setTotal(account.getTotal().add(new BigDecimal(profit)));
			commonDao.saveOrUpdate(account);
			
			accountLog.setNewTotal(account.getTotal());
			accountLog.setNewUseMoney(account.getUseMoney());
			accountLog.setNewExtensionProfit(account.getExtensionProfit());
			accountLog.setNewInviteProfit(account.getInviteProfit());
			accountLog.setAddtime(new Date());
			//账户变动日志
			commonDao.save(accountLog);
		}
	}
	
}