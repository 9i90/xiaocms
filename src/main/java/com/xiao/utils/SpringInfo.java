package com.xiao.utils;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.jdbc.core.JdbcTemplate;

public class SpringInfo implements ApplicationContextAware {
	private static ApplicationContext applicationContext;
	
	public void setApplicationContext(ApplicationContext arg0)
			throws BeansException {
		applicationContext = arg0;
	}
	public static void setAppContext(ApplicationContext arg0)
			throws BeansException {
		applicationContext = arg0;
	}
	public static Object getBean(String name){
		return applicationContext.getBean(name);
	}
	public static JdbcTemplate getJDBC() {
		return (JdbcTemplate)getBean("jdbcTemplate");
	}
}
