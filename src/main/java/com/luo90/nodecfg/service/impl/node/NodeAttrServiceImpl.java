package com.luo90.nodecfg.service.impl.node;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.luo90.nodecfg.service.node.NodeAttrServiceI;
import org.jeecgframework.core.common.service.impl.CommonServiceImpl;

@Service("nodeAttrService")
@Transactional
public class NodeAttrServiceImpl extends CommonServiceImpl implements NodeAttrServiceI {
	
}