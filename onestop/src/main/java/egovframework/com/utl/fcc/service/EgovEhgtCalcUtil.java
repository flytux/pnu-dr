/**
 * @Class Name : EgovEhgtCalcUtil.java
 * @Description : 대한민국, 미국,유럽연합, 일본, 중국연합 사이의 환율계산기능을
 * 제공하는  Business Interface class
 * @Modification Information
 * @
 * @  수정일         수정자                   수정내용
 * @ -------    --------    ---------------------------
 * @ 2009.01.13    박정규          최초 생성
 *
 *  @author 공통 서비스 개발팀 박정규
 *  @since 2009. 01. 13
 *  @version 1.0
 *  @see
 *
 */

package egovframework.com.utl.fcc.service;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import javax.swing.text.html.HTMLEditorKit;
import javax.swing.text.html.parser.ParserDelegator;

import org.apache.logging.log4j.LogManager;

public class EgovEhgtCalcUtil {

	// 환율....
    static final char EGHT_USD     = 'U';    // 미국
    static final char EGHT_JPY     = 'J';    // 일본
    static final char EGHT_EUR     = 'E';    // 유럽연합
    static final char EGHT_CNY     = 'C';    // 중국연합

    static final char EGHT_KWR     = 'K';    // 대한민국


    static	StringBuffer sb = new StringBuffer();




//파서는 콜백 형식으로 되어 있다. 각 태그가 들어 올때 적절한 메소드가 호출됨
private class CallbackHandler extends HTMLEditorKit.ParserCallback	{

    public void handleText(char[] data, int pos)	{

    	String	srcStr = new String(data);

   	  	srcStr = EgovStringUtil.strip(srcStr," ");

   	  	sb.append(srcStr).append("/");

    }

}

}