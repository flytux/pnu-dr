package com.onestop.core.util;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;

public class configEncrypt {
	protected final static Log LOGGER = LogFactory.getLog(configEncrypt.class);
	
	public static void main(String argc[]) {

		StandardPBEStringEncryptor aPBEstringEnc = new StandardPBEStringEncryptor();
		aPBEstringEnc.setPassword("a12345");
		LOGGER.info( "\r\n# unit_db mssql "  );
		// 암호화 텍스트
		String url = aPBEstringEnc.encrypt("jdbc:sqlserver://192.168.2.169:1433;databaseName=unit_db");
		String username = aPBEstringEnc.encrypt("onestopuser");
		String userpassword = aPBEstringEnc.encrypt("onestopuser!@#");
		
		// 암호화 텍스트
		String deusername = aPBEstringEnc.encrypt("sesdbuser");
		String deuserpw = aPBEstringEnc.encrypt("ses@dbuser12#");
		
		// 복호화 텍스트
		String devonestopurl = aPBEstringEnc.decrypt("WxvskNic+NoBd5C/QSfsMI6DigGeEkEuq9n4GaX/BVb5xOgm896pUcK1svAZlu+GSFIyjLkZwYGbGKifcEL17A==");
		String devonestopusername = aPBEstringEnc.decrypt("gVCSzbU4MAduAjbikS9VnsnLtrJUagfQ==");
		String devonestopuserpassword = aPBEstringEnc.decrypt("PEWkFAjRDX0C4LuGMSANIaRefGSxgxZy==");
		
		String edeusername = aPBEstringEnc.decrypt("yDQXeqeACjig0FgoIJYz9E+s5fDbawCD");
		String edeuserpw = aPBEstringEnc.decrypt("38ndUHTvRf8/8SBWCBXRWKNL1leZrarV");
		
		String devuser = aPBEstringEnc.decrypt("gVCSzbU4MAduAjbikS9VnsnLtrJUagfQ");
		String devpw = aPBEstringEnc.decrypt("B3ku0Yah8QIHfnswgSFLfVBoHt+jbq1t");
		
		// 복호화 결과값
		LOGGER.info("복호 교육 "+deusername+"//"+deuserpw);
		LOGGER.info("복호 학생지원 "+edeusername+"//"+edeuserpw);
		LOGGER.info("복호 개발교육 "+devuser+"//"+devpw);
		
		// 복호화 결과값
		LOGGER.info("jdbc.unit.url=ENC(" + devonestopurl + ")");
		LOGGER.info("jdbc.unit.username=ENC(" + deusername + ")");
		LOGGER.info("jdbc.unit.password=ENC(" + deuserpw + ")");
		
	}
}
