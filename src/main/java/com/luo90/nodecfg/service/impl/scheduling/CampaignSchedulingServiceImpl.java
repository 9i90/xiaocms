package com.luo90.nodecfg.service.impl.scheduling;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.luo90.nodecfg.service.scheduling.CampaignSchedulingServiceI;
import org.jeecgframework.core.common.service.impl.CommonServiceImpl;

@Service("campaignSchedulingService")
@Transactional
public class CampaignSchedulingServiceImpl extends CommonServiceImpl implements CampaignSchedulingServiceI {
	
}