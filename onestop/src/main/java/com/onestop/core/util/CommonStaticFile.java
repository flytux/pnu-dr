package com.onestop.core.util;

import java.io.File;

public class CommonStaticFile {
	
	public static final String ROOTPATH = CommonStaticFile.class.getResource("").getPath().substring(0, CommonStaticFile.class.getResource("").getPath().lastIndexOf("WEB-INF"));
	public static String makeVersion(String path) {
		
		File file = new File(ROOTPATH+path);
		
		long lastModifiedTime = file.lastModified();
		
		return IUtility.parseNull(lastModifiedTime);
	}

}
