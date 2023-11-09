/**
 * @Class Name  : EgovNumberUtil.java
 * @Description : 숫자 데이터 처리 관련 유틸리티
 * @Modification Information
 *
 *     수정일         수정자                   수정내용
 *     -------          --------        ---------------------------
 *   2009.02.13       이삼섭                  최초 생성
 *
 * @author 공통 서비스 개발팀 이삼섭
 * @since 2009. 02. 13
 * @version 1.0
 * @see
 *
 */

package egovframework.com.utl.fcc.service;

import java.security.SecureRandom;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class EgovNumberUtil {

   

    /**
     * 특정 숫자 집합에서 특정 숫자가 있는지 체크하는 기능 12345678에서 7이 있는지 없는지 체크하는 기능을 제공함
     *
     * @param sourceInt - 특정숫자집합
     * @param searchInt - 검색숫자
     * @return 존재여부
     * @exception MyException
     * @see
     */
    public static Boolean getNumSearchCheck(int sourceInt, int searchInt) {
	String sourceStr = String.valueOf(sourceInt);
	String searchStr = String.valueOf(searchInt);

	// 특정숫자가 존재하는지 하여 위치값을 리턴한다. 없을 시 -1
	if (sourceStr.indexOf(searchStr) == -1) {
	    return false;
	} else {
	    return true;
	}
    }




    /**
     * 특정숫자가 실수인지, 정수인지, 음수인지 체크하는 기능 123이 실수인지, 정수인지, 음수인지 체크하는 기능을 제공함
     *
     * @param srcNumber - 숫자집합
     * @return -1(음수), 0(정수), 1(실수)
     * @exception MyException
     * @see
     */
    public static int checkRlnoInteger(double srcNumber) {

	// byte 1바이트 		▶소수점이 없는 숫자로, 범위 -2^7 ~ 2^7 -1
	// short 2바이트		▶소수점이 없는 숫자로, 범위 -2^15 ~ 2^15 -1
	// int 4바이트 		▶소수점이 없는 숫자로, 범위 -2^31 ~ 2^31 - 1
	// long 8바이트 		▶소수점이 없는 숫자로, 범위 -2^63 ~ 2^63-1

	// float 4바이트		▶소수점이 있는 숫자로, 끝에 F 또는 f 가 붙는 숫자 (예:3.14f)
	// double 8바이트	▶소수점이 있는 숫자로, 끝에 아무것도 붙지 않는 숫자 (예:3.14)
	//			▶소수점이 있는 숫자로, 끝에 D 또는 d 가 붙는 숫자(예:3.14d)

	String cnvrString = null;

	if (srcNumber < 0) {
	    return -1;
	} else {
	    cnvrString = String.valueOf(srcNumber);

	    if (cnvrString.indexOf(".") == -1) {
		return 0;
	    } else {
		return 1;
	    }
	}
    }
}
