package com.luo90.nodecfg.service.impl.node;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.luo90.nodecfg.service.node.NodeServiceI;
import org.jeecgframework.core.common.service.impl.CommonServiceImpl;

@Service("nodeService")
@Transactional
public class NodeServiceImpl extends CommonServiceImpl implements NodeServiceI {
	
}