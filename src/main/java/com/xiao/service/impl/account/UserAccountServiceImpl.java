package com.xiao.service.impl.account;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xiao.service.account.UserAccountServiceI;
import org.jeecgframework.core.common.service.impl.CommonServiceImpl;

@Service("userAccountService")
@Transactional
public class UserAccountServiceImpl extends CommonServiceImpl implements UserAccountServiceI {
	
}