package com.liheng.util;

import java.util.UUID;

/**
 * 生成32位随机的字符串
 * @author 李恒
 *
 */
public class UUIDUtil {
	
	public static String getUUID(){
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
}
