package com.luo90.nodecfg.service.impl.campaign;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.luo90.nodecfg.service.campaign.CampaignNodeServiceI;
import org.jeecgframework.core.common.service.impl.CommonServiceImpl;

@Service("campaignNodeService")
@Transactional
public class CampaignNodeServiceImpl extends CommonServiceImpl implements CampaignNodeServiceI {
	
}