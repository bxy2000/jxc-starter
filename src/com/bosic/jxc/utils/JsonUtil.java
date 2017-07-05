package com.bosic.jxc.utils;

import java.util.HashMap;
import java.util.Map;

public class JsonUtil {
	public static final String RESULT_SUCCESS = "success";
	public static final String RESULT_MESSAGE = "message";
	
	public static Map<String, Object> getResult(String message, boolean success){
		Map<String, Object> result = new HashMap<String, Object>();
		result.put(RESULT_SUCCESS, success);
		result.put(RESULT_MESSAGE, message);
		return result;
	}
}
