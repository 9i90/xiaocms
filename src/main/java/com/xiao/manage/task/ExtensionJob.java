package com.xiao.manage.task;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;

import com.xiao.manage.service.account.UserAccountServiceI;
import com.xiao.utils.SpringInfo;
/**
 * 
 * 功能：推广收益计算 
 * 版本：v1.0
 * 创建人：luo90
 * 创建时间：2016年3月17日 下午12:01:06 
 * 修改历史：
 * 			description by author@date
 */
public class ExtensionJob extends QuartzJobBean {
	@Override
	protected void executeInternal(JobExecutionContext context)
			throws JobExecutionException {
		System.out.println("------------------------------收益更新开始---------");
		try {
			UserAccountServiceI userAccountService = (UserAccountServiceI)SpringInfo.getBean("userAccountService");
			userAccountService.updateShareProfit();
		} catch (Exception e) {
			System.out.println("------------------------------收益更新异常---------");
			e.printStackTrace();
		}
		System.out.println("------------------------------收益更新结束---------");
	}

}
