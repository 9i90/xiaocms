package com.luo90.nodecfg.service.impl.campaign;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.luo90.nodecfg.service.campaign.CampaignNodeInfoServiceI;
import org.jeecgframework.core.common.service.impl.CommonServiceImpl;

@Service("campaignNodeInfoService")
@Transactional
public class CampaignNodeInfoServiceImpl extends CommonServiceImpl implements CampaignNodeInfoServiceI {
	
}