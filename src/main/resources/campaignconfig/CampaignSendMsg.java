package com.idesky.crowdfund.common;

import java.util.Map;

import com.luo90.campaign.CampaignExecute;

public class CampaignSendMsg implements CampaignExecute {

	@Override
	public void execute(Map param) throws Exception {
		System.out.println("---------------------------------------------------------------------------");
		System.out.println("---------------------------------------------------------------------------");
		System.out.println("---------------------------------------------------------------------------");
		System.out.println("------------------短-信-发-送-开-始-----------------------------------------");
		for(Object key:param.keySet()){
			System.out.println("--------------------key:"+key+";value:"+param.get(key));
		}
		System.out.println("---------------------------------------------------------------------------");
		System.out.println("---------------------------------------------------------------------------");
		System.out.println("---------------------------------------------------------------------------");
	}

}
