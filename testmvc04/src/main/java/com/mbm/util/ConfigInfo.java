package com.mbm.util;

import java.util.Properties;

public class ConfigInfo {
	
	private static Properties cache = new Properties();
	
	static{
		try {
			cache.load(ConfigInfo.class.getClassLoader().getResourceAsStream("merchantInfo.properties"));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 获取指定key的值
	 * @param key
	 * @return
	 */
	public static String getValue(String key){
		return cache.getProperty(key);
	}

}
