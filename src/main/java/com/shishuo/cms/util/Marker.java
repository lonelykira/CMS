package com.shishuo.cms.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Marker {
	public String dateFormat(Date date, String format) {
		try {
			SimpleDateFormat dateFormat = new SimpleDateFormat(format);
			return dateFormat.format(date);
		} catch (Exception e) {
			System.out.println("转换异常");
			return "";
		}
	}
}
