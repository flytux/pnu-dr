package com.onestop.ost.vote.controller;
import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSocketFactory;
import javax.net.ssl.TrustManager;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("/vote/external")
public class VoteExternalController {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public static void main(String[] args) throws Exception{
	  try {
	     try{
	        javax.net.ssl.TrustManager[] trustAllCerts = new javax.net.ssl.TrustManager[1];
	        javax.net.ssl.TrustManager tm = new miTM();
	        trustAllCerts[0] = tm;
	        
	        final SSLContext sslContext = SSLContext.getInstance( "SSL" );
	sslContext.init( null, trustAllCerts, new java.security.SecureRandom() );
	
	final SSLSocketFactory sslSocketFactory = sslContext.getSocketFactory();
	
	URL url = new URL("https://vote.pusan.ac.kr/statistics/v1/external/2018/1/real_time/?format=json");
	HttpsURLConnection conn = (HttpsURLConnection)url.openConnection();
	((HttpsURLConnection) conn).setSSLSocketFactory(sslSocketFactory);
	
	BufferedReader in = null;
	    in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	    
	    String inputLine;
	    while((inputLine = in.readLine()) != null) {
	       System.out.println(inputLine);}
	} catch(Exception e) {
	   System.out.println("E 1="+e.getMessage()+", E 2="+e.toString());
	            e.printStackTrace();
	        }
	  }catch(Exception e) {
	     System.out.println("E1="+e.getMessage()+", E 2="+e.toString());
	         e.printStackTrace();
	  }
	}
	
    private static void trustAllHttpsCertificates() throws Exception{
    	TrustManager[] trustAllCerts = new javax.net.ssl.TrustManager[1];
    	TrustManager tm = new miTM();
    	trustAllCerts[0] = tm;
    	javax.net.ssl.SSLContext sc =javax.net.ssl.SSLContext.getInstance("SSL");
    	sc.init(null, trustAllCerts, null);
    	javax.net.ssl.HttpsURLConnection.setDefaultSSLSocketFactory(sc.getSocketFactory());
    }
	
	public static class miTM implements javax.net.ssl.TrustManager, javax.net.ssl.X509TrustManager {
	   public java.security.cert.X509Certificate[] getAcceptedIssuers(){
	        return null;
	    }
	    public boolean isServerTrusted(java.security.cert.X509Certificate[] certs){            
	       return true;
	    }
	    public boolean isClientTrusted(java.security.cert.X509Certificate[] certs){
	       return true;
	    }
	    public void checkServerTrusted(java.security.cert.X509Certificate[] certs, String authType) throws java.security.cert.CertificateException{
	       return;
	    }
	    public void checkClientTrusted(java.security.cert.X509Certificate[] certs, String authType) throws java.security.cert.CertificateException{
	       return;
	    }
	}
    
	private String VOTE_API_URL = "https://vote.pusan.ac.kr/statistics/v1/external";
    
	/**
	 * 홈페이지 통합시스템 - 학생선거 목록
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/list", produces = "application/json;charset=UTF-8", method = RequestMethod.GET)
	public @ResponseBody Object getVoteData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		javax.net.ssl.TrustManager[] trustAllCerts = new javax.net.ssl.TrustManager[1];
        javax.net.ssl.TrustManager tm = new miTM();
        trustAllCerts[0] = tm;
        
        final SSLContext sslContext = SSLContext.getInstance( "SSL" );
        sslContext.init( null, trustAllCerts, new java.security.SecureRandom() );
        
        final SSLSocketFactory sslSocketFactory = sslContext.getSocketFactory();
        /*
        URL url = new URL("https://vote.pusan.ac.kr/statistics/v1/external/2018/1/real_time/?format=json");
        HttpsURLConnection conn = (HttpsURLConnection)url.openConnection();
        ((HttpsURLConnection) conn).setSSLSocketFactory(sslSocketFactory);
        
        BufferedReader in = null;
            in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            
            String inputLine;
            while((inputLine = in.readLine()) != null) {
               System.out.println(inputLine);
            }
		*/
        	/**
	        Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
	        String year = IUtility.parseNull(params.get("year"));
			String term = IUtility.parseNull(params.get("term"));
			String parameter = "";
			*/
        
            String year = request.getParameter("year");
    		String term = request.getParameter("term");
    		String parameter = "";
    		
    		try {
    			parameter = "/" + year +"/" + term + "/real_time/?format=json";
    		} catch (Exception e) {
    			logger.error("Method: getZipData - URLEncoder, Error: {}", e.getMessage());
    		}
    		StringBuilder inputStringBuilder = null;
    		BufferedReader bufferedReader = null;
    		
    		try {
    			URL url = new URL(VOTE_API_URL + parameter);
    			HttpsURLConnection conn = (HttpsURLConnection)url.openConnection();
    	        ((HttpsURLConnection) conn).setSSLSocketFactory(sslSocketFactory);
    	        
    			conn.setRequestProperty("accept-language", "ko");
    			conn.setConnectTimeout(5000);
    			conn.setReadTimeout(5000);
    			
    			// InputStream in = url.openStream();
    			inputStringBuilder = new StringBuilder();
    			bufferedReader = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
    			
    			String line = bufferedReader.readLine();
    			while (line != null) {
    				inputStringBuilder.append(line);
    				if (logger.isInfoEnabled()) {
    					logger.info(" line :" + line.toString());
    				}
    				line = bufferedReader.readLine();
    			}
    			if (logger.isInfoEnabled()) {
    				logger.info("url :" + url);
    				logger.info("inputStringBuilder :" + inputStringBuilder.toString());
    			}
    		} catch (Exception e) {
    			logger.error("Method: getZipData - OPEN_API_URL, Error: {}", e.getMessage());
    		} finally {
    			if (bufferedReader != null) {
    				bufferedReader.close();
    			}
    		}
    		
    		System.out.println(inputStringBuilder.toString());

		return inputStringBuilder.toString();
	}
	

	
}