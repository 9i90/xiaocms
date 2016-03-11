package com.luo90.nodecfg.service.impl.campaign;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.luo90.nodecfg.service.campaign.CSqlInfoServiceI;
import org.jeecgframework.core.common.service.impl.CommonServiceImpl;

@Service("cSqlInfoService")
@Transactional
public class CSqlInfoServiceImpl extends CommonServiceImpl implements CSqlInfoServiceI {
	
}