package com.onestop.core.util;

public class ProjectConstant {

	// 시스템 호스트
	public static final String SYSTEM_HOST = "http://localhost:8080";

	public static final String FILE_SEPARATOR = System.getProperty("file.separator");

	/* parameter encrypt */
    public static final String RSA_PRIVATE_KEY = "_RSA_Private_Key_";
    public static final String RSA_INSTANCE = "RSA";
    public static final String RSA_MODULUS = "RSAModulus";
    public static final String RSA_EXPONENT = "RSAExponent";
    public static final String SECURITY_KEY = "f1290186a5d0b1ceab27f4e77c0c5d68ad57484016654da87125db86f4227ea34eae35f1b35977a00ebd8086c259d4c9eecba42edc3dce8d3ee1d9c2f033710cfe4c42e863b4c4c2746c923fd8dbea1dcebe5fe09a12eebd8a75d810687e1842add0a466a8bceb8f272318f286e705f6632cf21d738d961ef90d1a64642023a3e44094b4321aa5df7bd67275d3e16e0d195970fa60356f5e2fe3fe3813061a1d4b8b36c76360aec41e8a27364c7e4fd146c4d1c0f41efb2b7b8c23b367c82dac58c3aa879721585cd91218e2e5c6d5e77024281b16fa8e21e938dec262671312=";

    
	// Mail Send 설정
	public static final String SEND_MAIL_SERVER_HOST = "smtp.gmail.com";
	public static final String SEND_MAIL_SENDER = "idinoinhademo@gmail.com";
	public static final String SEND_MAIL_SENDER_ID = "idinoinhademo@gmail.com";
	public static final String SEND_MAIL_SENDER_PW = "idino@123";

	public static final String SEND_MAIL_SERVER_HOST_TEST = "smtp.gmail.com";
	public static final String SEND_MAIL_SENDER_TEST = "idinoinhademo@gmail.com";
	public static final String SEND_MAIL_SENDER_ID_TEST = "idinoinhademo@gmail.com";
	public static final String SEND_MAIL_SENDER_PW_TEST = "idino@123";

	public static final String REAL_WAS_SERVER = "192.168.2.145";
	public static final String DEV_WAS_SERVER = "164.125.6.5";
	public static final String DEV_USER_PC_IP_PREFIX = "192.168.23";
	
	/* PUSH 설정 */
	public static final String UMS_MSG_SEND_SERVICE_KEY = "PNU-UMS-API-004";
    public static final String UMS_MSG_SEND_API_KEY = "5269o246Fy8l5bl73H051u46o4b6XjhKK4nh";
    public static final String UMS_MSG_SEND_RESULT_TPYE = "json";

	/* 계좌검증(coocon) */
	public static final String COOCON_ACCT_API_URL = "https://gw.coocon.co.kr/sol/gateway/acctnm_rcms_wapi.jsp";
	public static final String COOCON_ACCT_API_SECR_KEY = "thUZ3jb67AAPo95gPk1f";
	public static final String COOCON_ACCT_API_KEY = "ACCTNM_RCMS_WAPI";
	
	/* SSO */
	public static final String SSO_API_KEY = "368B184727E89AB69FAF";
	public static final int SSO_ENGINE_PORT = 7001;
    public static final String SSO_PORTAL_DOMAIN = "https://login.pusan.ac.kr";
    public static final String SSO_ONESTOP_SUB_DOMAIN = "dses2";
}