package com.onestop.core.main.controller;

import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.RSAPublicKeySpec;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ibm.icu.text.SimpleDateFormat;
import com.onestop.core.bbs.service.BbsService;
import com.onestop.core.file.service.FilesService;
import com.onestop.core.function.service.ComFunctionService;
import com.onestop.core.main.service.MainService;
import com.onestop.core.main.service.OstServiceMngService;
import com.onestop.core.resolver.ParamMap;
import com.onestop.core.security.user.CustomUserDetail;
import com.onestop.core.util.IUtility;
import com.onestop.core.util.ProjectConstant;
import com.onestop.core.util.controller.CommonController;
import com.onestop.ost.cls.timetablesearch.service.PersonTimetableSearchService;

import egovframework.com.utl.cas.service.EgovSessionCookieUtil;

@Controller
public class MainViewController extends CommonController {

	@Autowired
	MessageSource localeMessageSource;

	@Resource(name = "mainService")
	private MainService mainService;
	
	@Autowired
    private ComFunctionService comFunctionService;
	
	@Autowired
    private OstServiceMngService ostServiceMngService;

	@Autowired
	private PersonTimetableSearchService personTimetableSearchService;
	
	@Resource(name = "bbsService")
    private BbsService bbsService;
	
	@Autowired
	private FilesService filesService;

	private static final String SYSTEM_GCD = "0002";
	
	private String sessionLocale = "";

	public void checkLocale(HttpServletRequest request) throws Exception {
		sessionLocale = IUtility.parseNull(EgovSessionCookieUtil.getSessionAttribute(request, "SESSION_LOCALE"));
		if ("anonymousUser".equals(IUtility.getLoginInfo())) {
			if(sessionLocale.equals("")) {
				EgovSessionCookieUtil.setSessionAttribute(request, "SESSION_LOCALE", "0001");
			}
		} else {
			CustomUserDetail userInfo = (CustomUserDetail) IUtility.getLoginInfo();
			EgovSessionCookieUtil.setSessionAttribute(request, "SESSION_LOCALE",
					IUtility.parseNull(userInfo.getLangGcd(), "0001"));
		}
		
		String sessionSystemGcd = IUtility.parseNull(EgovSessionCookieUtil.getSessionAttribute(request, "SESSION_SYSTEM_GCD")); 
		
		if ("".equals(sessionSystemGcd)) {
			EgovSessionCookieUtil.setSessionAttribute(request, "SESSION_SYSTEM_GCD", "0002");
		}
		sessionLocale = IUtility.parseNull(EgovSessionCookieUtil.getSessionAttribute(request, "SESSION_LOCALE"));
	}
	
	private void checkRsa(HttpServletRequest request) throws Exception {
        HttpSession session = request.getSession();
        
        if(session.getAttribute(ProjectConstant.RSA_MODULUS) == null) {
            KeyPairGenerator generator;
            generator = KeyPairGenerator.getInstance(ProjectConstant.RSA_INSTANCE);
            generator.initialize(2048);

            KeyPair keyPair = generator.genKeyPair();
            KeyFactory keyFactory = KeyFactory.getInstance(ProjectConstant.RSA_INSTANCE);
            PublicKey publicKey = keyPair.getPublic();
            PrivateKey privateKey = keyPair.getPrivate();

            session.setAttribute(ProjectConstant.RSA_PRIVATE_KEY, privateKey);

            RSAPublicKeySpec publicSpec = (RSAPublicKeySpec) keyFactory.getKeySpec(publicKey, RSAPublicKeySpec.class);
            String publicKeyModulus = publicSpec.getModulus().toString(16);
            String publicKeyExponent = publicSpec.getPublicExponent().toString(16);

            session.setAttribute(ProjectConstant.RSA_MODULUS, publicKeyModulus);
            session.setAttribute(ProjectConstant.RSA_EXPONENT, publicKeyExponent);
        }
    }
	
	public void checkSiteInfo(HttpServletRequest request) throws Exception {
        HttpSession session = request.getSession();
        session.setAttribute("SITE_INFO", comFunctionService.getSiteInfo(SYSTEM_GCD));
    }

	public void mainProgram(ModelAndView view, HttpServletRequest request) throws Exception {
		//수강신청DB전환시
		//운영:0 개발:1
		String flag = "0";
		
		DecimalFormat df00 = new DecimalFormat("00");
		int loginOnBbsCnt = 0;
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("SYSTEM_GCD", SYSTEM_GCD);
		param.put("MENU_CD", "000000000000000");
		param.put("SESSION_LOCALE", sessionLocale);
		
		String [] params = {
				"SYSTEM_GCD",
				"MENU_CD"
		};

		param.put("params", params);
		param.put("db", "SYS");
		param.put("proc", "SP_기준년도_학기_조회");
		param.put("resultCnt", 1);
		Map<String, Object> termInfo = (Map<String, Object>)comFunctionService.bindProcMap(param);
		
		//Map<String, Object> termInfo = mainService.selectOneShafYyShtm(param);
		view.addObject("termInfo", termInfo);

		SimpleDateFormat todayfmtEng = new SimpleDateFormat("EEE, dd MMM",Locale.ENGLISH);
		SimpleDateFormat todayfmtKor = new SimpleDateFormat("MM월 dd일 E요일",Locale.KOREAN);
		SimpleDateFormat todayfmtChi = new SimpleDateFormat("EEE, dd MMM",Locale.CHINA);

		Calendar calendar = Calendar.getInstance();
		Date today = calendar.getTime();
		if(sessionLocale.equals("0002")) {
			view.addObject("today_str", todayfmtEng.format(today));
		}else if(sessionLocale.equals("0003")) {
			view.addObject("today_str", todayfmtChi.format(today));
		}else {
			view.addObject("today_str", todayfmtKor.format(today));
		}
		
		int dayOfWeek = calendar.get(Calendar.DAY_OF_WEEK);
		int year = calendar.get(Calendar.YEAR);
		int month = calendar.get(Calendar.MONTH)+1;
		int date = calendar.get(Calendar.DATE);
		int hour = calendar.get(Calendar.HOUR_OF_DAY);
		int minute = calendar.get(Calendar.MINUTE);
		view.addObject("year", year);
		view.addObject("month", month);
		view.addObject("date", date);
		String schDayGcd = "";
		
		switch (dayOfWeek) {
		case 1:
			view.addObject("dayOfWeek", "일요일");
			schDayGcd = "0007";
			break;
		case 2:
			view.addObject("dayOfWeek", "월요일");
			schDayGcd = "0001";
			break;
		case 3:
			view.addObject("dayOfWeek", "화요일");
			schDayGcd = "0002";
			break;
		case 4:
			view.addObject("dayOfWeek", "수요일");
			schDayGcd = "0003";
			break;
		case 5:
			view.addObject("dayOfWeek", "목요일");
			schDayGcd = "0004";
			break;
		case 6:
			view.addObject("dayOfWeek", "금요일");
			schDayGcd = "0005";
			break;
		case 7:
			view.addObject("dayOfWeek", "토요일");
			schDayGcd = "0006";
			break;
		default :
			break;
		}
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss",Locale.getDefault());
		/*** 학사일정 ***/
		param.put("P_SYSTEM_GCD", "");
		param.put("P_SYEAR", termInfo.get("SYEAR"));
		//param.put("P_TERM_GCD", termInfo.get("TERM_GCD")); //모든 학기들 다불러와서 FOR문 //
		param.put("P_TERM_GCD", "3"); //메인 학사일정 기준학년도, 학기 변경
		param.put("P_SCHD_TASK_GCD", "");
		param.put("P_SCHD_GCD", "");
		param.put("P_SCHD_START_DT", "");
		param.put("P_SCHD_CLOSE_DT", "");

		String schCollGradGcd = "";
		String schGradGcd = "";
		String schCollCd = "";
		String schDeptCd = "";
		String schMajorCd = "";
		if(!"anonymousUser".equals(IUtility.getLoginInfo()) ) {
			schCollGradGcd = IUtility.parseNull(((CustomUserDetail) IUtility.getLoginInfo()).getCollGradGcd());
			schGradGcd = IUtility.parseNull(((CustomUserDetail) IUtility.getLoginInfo()).getGradGcd());
			schCollCd = IUtility.parseNull(((CustomUserDetail) IUtility.getLoginInfo()).getCollCd());
			schDeptCd = IUtility.parseNull(((CustomUserDetail) IUtility.getLoginInfo()).getDeptCd());
			schMajorCd = IUtility.parseNull(((CustomUserDetail) IUtility.getLoginInfo()).getMajorCd());
		}
        param.put("SCH_COLL_GRAD_GCD", schCollGradGcd);  /*로그인 했을때 대학(0001)인지 대학원(0002)인지 */
		param.put("SCH_GRAD_GCD", schGradGcd);
		param.put("SCH_COLL_CD", schCollCd);
		param.put("SCH_DEPT_CD", schDeptCd);
		param.put("SCH_MAJOR_CD", schMajorCd);
		param.put("P_DOING_FG", "Y");

		/**** 서비스단계관련 일정구분의 일정목록 조회 ***/
		List<Map<String, Object>> scheduleList = ostServiceMngService.selectListScheduleMng(param);
		view.addObject("scheduleList", scheduleList);

		/*** STEP1 - 서비스업무구분관리_조회 ***/
		if(flag == "0") {
			List<Map<String, Object>> ostStep1List = ostServiceMngService.selectQueryServiceTask(param);
			view.addObject("ostStep1List", ostStep1List);
			
	
			/*** STEP2 - 서비스단계목록_조회 ***/
			param.put("USE_FG", "Y");
			List<Map<String, Object>> ostStep2List = ostServiceMngService.selectQueryServiceStep(param);
			view.addObject("ostStep2List", ostStep2List);
		}
		/*** 일정 목록 - 서비스단계관련일정구분_조회
		 *  서비스 일정목록에서 최초시작일, 최종종료일 날짜를 계산한다.
		***/
		List<Map<String, Object>> ostSchList = ostServiceMngService.selectQuerySchd(param);

		for (Map<String, Object> ostSchInfo : ostSchList) {
			
			if( scheduleList.size() > 0) {

				Date schdStartDt = null;
				Date schdCloseDt = null;
				for (Map<String, Object> scheduleInfo : scheduleList) {
					
					//onestop서비스의 일정업무구분 = 일정관리의 일정업무구분 
					// && onestop서비스의 일정구분 = 일정관리의 일정구분 
					if(IUtility.parseNull(ostSchInfo.get("CHAR_1_CONTENT")).equals(IUtility.parseNull(scheduleInfo.get("SCHD_TASK_GCD"))) 
							&& IUtility.parseNull(ostSchInfo.get("SCHD_GCD")).equals(IUtility.parseNull(scheduleInfo.get("SCHD_GCD")))) {
						//모든학기의 일정 OR 현재학기의 일정 이면
						if(IUtility.parseNull(scheduleInfo.get("TERM_GCD")).equals("0098") 
								|| ( (IUtility.parseNull(termInfo.get("TERM_GCD")).equals("0010") || IUtility.parseNull(termInfo.get("TERM_GCD")).equals("0020") ) 
										&&  IUtility.parseNull(scheduleInfo.get("TERM_GCD")).equals("0040") )  //현재학기가 1학기 OR 2학기 이면  TERM_GCD =0040(1,2학기) 일정도 포함 시킨다
								|| IUtility.parseNull(scheduleInfo.get("TERM_GCD")).equals(IUtility.parseNull(termInfo.get("TERM_GCD"))) ) {
							
							schdStartDt = dateFormat.parse(IUtility.parseNull(scheduleInfo.get("SCHD_START_DT")));
							schdCloseDt = dateFormat.parse(IUtility.parseNull(scheduleInfo.get("SCHD_CLOSE_DT")));

							//과거 
							if(today.compareTo(schdCloseDt) >0 ) {
								ostSchInfo.put("past", "true" );
								//past = "true";
							}
							//현재
							if(today.compareTo(schdStartDt) >=0
									&& schdCloseDt.compareTo(today) >=0){
								ostSchInfo.put("present", "true" ); 
								//present = "true";
							}
							//미래
							if(schdStartDt.compareTo(today) >0) {
								ostSchInfo.put("future", "true" );
								//future = "true";
							}
						}
					}
				}
			}
		}
		for (Map<String, Object> ostSchInfo : ostSchList) {
			for (Map<String, Object> ostSchInfo2 : ostSchList) {
				if(IUtility.parseNull(ostSchInfo.get("SERVICE_TASK_GCD")).equals(IUtility.parseNull(ostSchInfo2.get("SERVICE_TASK_GCD"))) 
						&& IUtility.parseNull(ostSchInfo.get("SERVICE_TASK_STEP_GCD")).equals(IUtility.parseNull(ostSchInfo2.get("SERVICE_TASK_STEP_GCD")))) {
					
					if(IUtility.parseNull(ostSchInfo2.get("past")).equals("true")) {
						ostSchInfo.put("past", "true");
					}
					if(IUtility.parseNull(ostSchInfo2.get("present")).equals("true")) {
						ostSchInfo.put("present", "true");
					}
					if(IUtility.parseNull(ostSchInfo2.get("future")).equals("true")) {
						ostSchInfo.put("future", "true");
					}
				}
			}
			String activeClass = "";
			String activeBoolean = "";
			String activeNm = "";
			if(IUtility.parseNull(ostSchInfo.get("present")).equals("true")) {
				activeClass = "flow-active";
				activeBoolean = "true";
				activeNm = "서비스 진행중";
			}else if(IUtility.parseNull(ostSchInfo.get("future")).equals("true")) {
				activeClass = "";
				activeBoolean = "false";
				activeNm = "서비스 대기중";
			}else if(IUtility.parseNull(ostSchInfo.get("past")).equals("true")) {
				activeClass = "flow-end";
				activeBoolean = "false";
				activeNm = "서비스 종료";
			}
			ostSchInfo.put("active_class", activeClass);
			ostSchInfo.put("active_boolean", activeBoolean );
			ostSchInfo.put("active_nm", activeNm);
		}
		view.addObject("ostSchList", ostSchList);

		/*** STEP3 - 서비스단계관련메뉴_조회 ***/
		if(flag == "0") {
			List<Map<String, Object>> ostStep3List = ostServiceMngService.selectQueryMenu(param);
			view.addObject("ostStep3List", ostStep3List);
		}

		if (!"anonymousUser".equals(IUtility.getLoginInfo())) {
			
			/*** 학기 수강학점 ***/ 
			Map<String, Object> tcParam = new HashMap<String, Object>();
			tcParam.put("SCH_SYEAR", termInfo.get("SYEAR")); //"2021"
			tcParam.put("SCH_TERM_GCD", termInfo.get("TERM_GCD")); // "0020"

			/*** 시간표 조회 가능 기간 조회 ***/
			Map<String, Object> ptValidYn = personTimetableSearchService.selectPersonTimetableValid(tcParam);
			view.addObject("ptValidYn", ptValidYn);
			
			List<Map<String, Object>> todayClassList = new ArrayList<Map<String,Object>>();
			List<Map<String, Object>> ptList = new ArrayList<Map<String,Object>>(); 
			if(IUtility.parseNull(ptValidYn.get("R_CHK")).equals("Y")) {
				
				/*** 오늘의 수업 ***/
				tcParam.put("SCH_DAY_GCD", schDayGcd); //"0002"
				tcParam.put("SESSION_USER_ID", ((CustomUserDetail) IUtility.getLoginInfo()).getUserId());
				todayClassList = mainService.selectTodayClass(tcParam);

				/*** 나의 시간표 - 요일별 목록***/
				tcParam.put("SCH_LTTM_YN_HID", "N");
				ptList = personTimetableSearchService.selectPersonTimetable(tcParam);
			}
			view.addObject("todayClassList", todayClassList);

			List<Map<String,Object>> subjList = new ArrayList<Map<String,Object>>();
			List<String> subjNoList = new ArrayList<String>();
			
			/** 나의 시간표 - 전체 목록  **/
			tcParam.put("SCH_DAY_GCD", ""); //요일 상관없이 가져오기  //SCH_DAY_GCD
			todayClassList = mainService.selectTodayClass(tcParam);
			
			for (Map<String, Object> map : todayClassList) {
				
				Map<String, Object> subjMap = new HashMap<String, Object>();
				subjMap.put("SUBJ_NO", IUtility.parseNull(map.get("SUBJ_NO")));
				
				subjMap.put("SUBJ_NM", IUtility.parseNull(map.get("SUBJ_NM")));
				subjMap.put("CLASS_NO", IUtility.parseNull(map.get("CLASS_NO")));
				subjMap.put("DEPT_KOR_NM", IUtility.parseNull(map.get("DEPT_KOR_NM")));
				subjMap.put("CLASS_CHARGE_TEL_NO", IUtility.parseNull(map.get("CLASS_CHARGE_TEL_NO")));
				subjMap.put("CYBER_CLASS_FG", IUtility.parseNull(map.get("CYBER_CLASS_FG")));
				subjMap.put("SUBJ_GCD_NM", IUtility.parseNull(map.get("SUBJ_GCD_NM")));
				subjMap.put("TIMETABLE_SUMMARY_INFO", IUtility.parseNull(map.get("TIMETABLE_SUMMARY_INFO")));
				subjMap.put("CRDT", IUtility.parseNull(map.get("CRDT")));
				subjMap.put("CLASS_TYPE_GCD_NM", IUtility.parseNull(map.get("CLASS_TYPE_GCD_NM")));
				subjMap.put("EDUCERT_GCD", IUtility.parseNull(map.get("EDUCERT_GCD")));
				subjList.add(subjMap);
				
				subjNoList.add(IUtility.parseNull(map.get("SUBJ_NO")));
			}
			
			/*** 강의 상세정보 list 중복제거 ***/
			Set<Map<String,Object>> subjSetList = new LinkedHashSet<Map<String,Object>>(subjList);
			
			/*** 중복 제거한 강의 상세정보 list 에서 강의시간 목록을 저장 ***/
			for (Map<String, Object> map : subjSetList) {

				List<Map<String, Object>> subjLectTimeList = new ArrayList<Map<String, Object>>();
				for (Map<String, Object> map2 : todayClassList) {
					if(IUtility.parseNull(map.get("SUBJ_NO")).equals(IUtility.parseNull(map2.get("SUBJ_NO")))) {
						Map<String, Object> subjLectTimeInfo = new HashMap<String, Object>();
						subjLectTimeInfo.put("BLD_CD",IUtility.parseNull(map2.get("BLD_CD")));
						subjLectTimeInfo.put("BLD_NM",IUtility.parseNull(map2.get("BLD_NM")));
						subjLectTimeInfo.put("PROF_NO",IUtility.parseNull(map2.get("PROF_NO")));
						subjLectTimeInfo.put("PROF_NM",IUtility.parseNull(map2.get("PROF_NM")));
						subjLectTimeInfo.put("FACILITY_NO",IUtility.parseNull(map2.get("FACILITY_NO")));
						subjLectTimeInfo.put("FACILITY_NM",IUtility.parseNull(map2.get("FACILITY_NM")));
						subjLectTimeInfo.put("DAY_GCD_NM",IUtility.parseNull(map2.get("DAY_GCD_NM")));
						subjLectTimeInfo.put("LECT_START_DATE",IUtility.parseNull(map2.get("LECT_START_DATE")));
						subjLectTimeInfo.put("LECT_CLOSE_DATE",IUtility.parseNull(map2.get("LECT_CLOSE_DATE")));
						subjLectTimeInfo.put("LECT_START_TIME",IUtility.parseNull(map2.get("LECT_START_TIME")));
						subjLectTimeInfo.put("LECT_CLOSE_TIME",IUtility.parseNull(map2.get("LECT_CLOSE_TIME")));
						subjLectTimeInfo.put("LECT_RUN_TIME",IUtility.parseNull(map2.get("LECT_RUN_TIME")));
						subjLectTimeList.add(subjLectTimeInfo);
					}
				}
				/*** 강의 상세정보의 강의시간 list 중복제거 ***/
				Set<Map<String,Object>> subjLectTimeSetList = new LinkedHashSet<Map<String,Object>>(subjLectTimeList);
				map.put("subjLectTimeList",subjLectTimeSetList);
			}
			view.addObject("subjSetList", subjSetList);

			Set<String> subjNoSetList = new LinkedHashSet<String>(subjNoList);
			
			int i=1;
			for (String subjNo : subjNoSetList) {
				for (Map<String, Object> map : ptList) {
				
					if(IUtility.parseNull(map.get("MON_SUBJ_NO")).equals(subjNo)) {
						map.put("MON_BG_COLOR", df00.format(i)); 
					}
					if(IUtility.parseNull(map.get("TUE_SUBJ_NO")).equals(subjNo)) {
						map.put("TUE_BG_COLOR", df00.format(i)); 
					}
					if(IUtility.parseNull(map.get("WED_SUBJ_NO")).equals(subjNo)) {
						map.put("WED_BG_COLOR", df00.format(i)); 
					}
					if(IUtility.parseNull(map.get("THU_SUBJ_NO")).equals(subjNo)) {
						map.put("THU_BG_COLOR", df00.format(i)); 
					}
					if(IUtility.parseNull(map.get("FRI_SUBJ_NO")).equals(subjNo)) {
						map.put("FRI_BG_COLOR", df00.format(i)); 
					}
					if(IUtility.parseNull(map.get("SAT_SUBJ_NO")).equals(subjNo)) {
						map.put("SAT_BG_COLOR", df00.format(i)); 
					}
				}
			i++;
			}
			
			/*** 게시판의 노출게시글 개수를 나의시간표 height 값과 같게 하기 위해 계산 ***/ 
			for (Map<String, Object> map : ptList) {
				if( !IUtility.parseNull(map.get("MON_LECT_SISU")).equals("")
						|| !IUtility.parseNull(map.get("TUE_LECT_SISU")).equals("")
						|| !IUtility.parseNull(map.get("WED_LECT_SISU")).equals("")
						|| !IUtility.parseNull(map.get("THU_LECT_SISU")).equals("")
						|| !IUtility.parseNull(map.get("FRI_LECT_SISU")).equals("")
						||( Integer.parseInt(IUtility.parseNull(map.get("START_TIME")).split(":")[0]) >=9
								&& Integer.parseInt(IUtility.parseNull(map.get("START_TIME")).split(":")[0]) < 19)
							) {
					loginOnBbsCnt ++;
					}
			}
			loginOnBbsCnt = (loginOnBbsCnt/2)+1;
			
			view.addObject("ptList", ptList);

		}else {
			/*** 오늘의 식단 ***/
			List<Map<String, Object>> mealMenuList = new ArrayList<Map<String,Object>>();
			List<Map<String, Object>> mealMenuBList = new ArrayList<Map<String,Object>>();
			List<Map<String, Object>> mealMenuLList = new ArrayList<Map<String,Object>>();
			List<Map<String, Object>> mealMenuDList = new ArrayList<Map<String,Object>>();
			
			Map<String, Object> mealParam = new HashMap<String, Object>();
			mealMenuList = mainService.selectMealMenu(mealParam);
			for (Map<String, Object> map : mealMenuList) {
				if(IUtility.parseNull(map.get("MENU_TYPE")).equals("B")) {
					mealMenuBList.add(map);
				}
				if(IUtility.parseNull(map.get("MENU_TYPE")).equals("L")) {
					mealMenuLList.add(map);
				}
				if(IUtility.parseNull(map.get("MENU_TYPE")).equals("D")) {
					mealMenuDList.add(map);
				}
			}

			if( hour <= 7 || ( hour == 8 && minute <= 30) ) { //00:00 ~ 8:30
				view.addObject("mealMenuActiveB", "true");
			}
			if( ( hour >=9 || (hour ==8 && minute > 30))
				&&	( hour <= 12 || ( hour == 13 && minute <= 30)) ) { //8:31 ~ 13:30
				view.addObject("mealMenuActiveL", "true");
			}
			if(  hour >=14 || (hour ==13 && minute > 30) ) {  //13:31 ~ 24:00
				view.addObject("mealMenuActiveD", "true");
			}
			
			view.addObject("mealMenuBList", mealMenuBList);
			view.addObject("mealMenuLList", mealMenuLList);
			view.addObject("mealMenuDList", mealMenuDList);
		}
		
		/*** 게시판
		 * 학생지원 공지사항
		***/
		Map<String, Object> bbsParam = new HashMap<String, Object>();
		bbsParam.put("SESSION_SYSTEM_GCD", SYSTEM_GCD);
		bbsParam.put("SESSION_MENU_CD", "000000000000386");
		bbsParam.put("SESSION_USER_IP", IUtility.getRemoteAddr(request));

		if (!"anonymousUser".equals(IUtility.getLoginInfo())) {
			CustomUserDetail userInfo = (CustomUserDetail) IUtility.getLoginInfo();
			bbsParam.put("SESSION_USER_ID", userInfo.getUserId()); 
		}

		if (!"anonymousUser".equals(IUtility.getLoginInfo())) {
			bbsParam.put("pageSize", loginOnBbsCnt);
		}else {
			bbsParam.put("pageSize", "10");
		}
		view.addObject("bbsPageSize", bbsParam.get("pageSize"));
		bbsService.setMainBbsListConstructor(bbsParam,view);
	}

	@RequestMapping(value = "/")
	public String IndexBase(HttpServletRequest request, Model model) throws Exception {
		checkLocale(request);
		if ("anonymousUser".equals(IUtility.getLoginInfo())) {
			return "redirect:/login";
		} else {
			return "redirect:/main";
		}
	}
	
	@RequestMapping(value = "/manual/online/view", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView manualOnlineView(HttpServletRequest request) throws Exception {
		checkLocale(request);
		checkSiteInfo(request);
		checkRsa(request);
		ModelAndView view = new ModelAndView();
		view.addObject("_host", request.getServerName());
		/* server정보 (Real / Dev / local) */
		view.addObject("_server",
				(IUtility.parseNull(IUtility.getLocalServerIp()).equals(ProjectConstant.REAL_WAS_SERVER)) ? "Real"
						: ((IUtility.parseNull(IUtility.getLocalServerIp()).equals(ProjectConstant.DEV_WAS_SERVER))
								? "Dev"
								: "local"));
		
		view.setViewName("common/mainPopup/userManual");
		
		return view;
	}

	@RequestMapping(value = "/page")
	public ModelAndView pageView(HttpServletRequest request, Model model) throws Exception {
		checkLocale(request);
		checkSiteInfo(request);
		checkRsa(request);
		ModelAndView view = new ModelAndView();
		view.addObject("_host", request.getServerName());
		/* server정보 (Real / Dev / local) */
		view.addObject("_server",
				(IUtility.parseNull(IUtility.getLocalServerIp()).equals(ProjectConstant.REAL_WAS_SERVER)) ? "Real"
						: ((IUtility.parseNull(IUtility.getLocalServerIp()).equals(ProjectConstant.DEV_WAS_SERVER))
								? "Dev"
								: "local"));

		/* 현재페이지 메뉴코드 */
		String menuCD = IUtility.parseNull(request.getParameter("menuCD"));
		view.addObject("menuCD", menuCD);

		/* 현재페이지 URL */
		if (menuCD != null && "".equals(menuCD)) {
			view.setViewName("common/main");
		} else {
			Map<String, Object> param = new HashMap<String, Object>();
			
			param.put("mode", IUtility.parseNull(request.getParameter("mode")));
			param.put("POSTING_SEQ_NO", IUtility.parseNull(request.getParameter("seq")));

			List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
			HttpSession session = request.getSession();
			param.put("MENU_CD", menuCD);
			if ("anonymousUser".equals(IUtility.getLoginInfo())) {
				List<Map<String, Object>> allMenuSessionList = (List<Map<String, Object>>) session.getAttribute("selectAllMenu");
				/* 웹접근성심사 중 적용(오픈 후 삭제대상) START
				param.put("USER_ID", "stdt01");
				if(allMenuSessionList == null ) {
						list = (List<Map<String, Object>>) mainService.selectMenu(param); //selectAllMenu
						session.setAttribute("selectAllMenu", list);
				}else {
					if ( IUtility.parseNull(menuCD).equals("") ||  IUtility.parseNull(menuCD).equals("000000000000000") ) {
						list = (List<Map<String, Object>>) mainService.selectMenu(param); //selectAllMenu
						session.setAttribute("selectAllMenu", list);
					}else {
						for (Map<String, Object> map : allMenuSessionList) {
							if(IUtility.parseNull(map.get("MENU_CD")).equals(menuCD)) {
								list.add(map);
							}
						}
					}
				}
				웹접근성심사 중 적용(오픈 후 삭제대상) END */
				
				/* 웹접근성 심사후 적용 */
				if(allMenuSessionList == null ) {
						list = (List<Map<String, Object>>) mainService.selectAllMenu(param);
						session.setAttribute("selectAllMenu", list);
				}else {
					if ( IUtility.parseNull(menuCD).equals("") ||  IUtility.parseNull(menuCD).equals("000000000000000") ) {
						list = (List<Map<String, Object>>) mainService.selectAllMenu(param);
						session.setAttribute("selectAllMenu", list);
					}else {
						for (Map<String, Object> map : allMenuSessionList) {
							if(IUtility.parseNull(map.get("MENU_CD")).equals(menuCD)) {
								list.add(map);
							}
						}
					}
				}
				
			} else {
				Map<String, Object> param2 = new HashMap<String, Object>();
				param2.put("USER_ID", ((CustomUserDetail) IUtility.getLoginInfo()).getUserId());
				List<Map<String, Object>> menuSessionList = (List<Map<String, Object>>) session.getAttribute("selectMenu");
				if(menuSessionList == null ) {
					menuSessionList = (List<Map<String, Object>>) mainService.selectMenu(param2);
					session.setAttribute("selectMenu", menuSessionList);
					if( !IUtility.parseNull(menuCD).equals("") &&  !IUtility.parseNull(menuCD).equals("000000000000000") ) {
						for (Map<String, Object> map : menuSessionList) {
							if(IUtility.parseNull(map.get("MENU_CD")).equals(menuCD)) {
								list.add(map);
							}
						}
					}
					
				}else {
					if( IUtility.parseNull(menuCD).equals("") ||  IUtility.parseNull(menuCD).equals("000000000000000") ) {
						
						list = (List<Map<String, Object>>) mainService.selectMenu(param2);
						session.setAttribute("selectMenu", list);
					}else {

						for (Map<String, Object> map : menuSessionList) {
							if(IUtility.parseNull(map.get("MENU_CD")).equals(menuCD)) {
								list.add(map);
							}
						}
					}
					
				}
				
			}

			param.put("SYSTEM_GCD", SYSTEM_GCD);
			
			if (list != null && list.size() > 0) {
				String str = "";
				String content = (String) ((Map) list.get(0)).get("MENU_CONTENT_GCD");
				if ("anonymousUser".equals(IUtility.getLoginInfo()) 
						&& !"0003".equals(IUtility.parseNull(content))
						&& !"0008".equals(IUtility.parseNull(content)) 
						&& !menuCD.equals("000000000000385") //FAQ
						&& !menuCD.equals("000000000000386") //학생지원공지사항
						&& !menuCD.equals("000000000000062") //장학공지
						&& !menuCD.equals("000000000000414") //서식다운로드
						) { // 비로그인시 ( 컨텐츠메뉴가 아닌 or 특정게시판 ) 메뉴들은 로그인필요
																														
					//view.addObject("menuCD", "000000000000000");
					//mainProgram(view, request);
					//view.addObject("_msg", "로그인 후 이용하세요.");
					//view.setViewName("common/login");
					view = new ModelAndView();
					session.setAttribute("_msg", "로그인 후 이용하세요.");
					session.setAttribute("returnMenuCD", menuCD);
					view.setViewName("redirect:/login");
					return view;
				}

				if (!IUtility.isEmpty(content) && "0002".equals(IUtility.parseNull(content))) {

					String bbsType = (String) ((Map) list.get(0)).get("BBS_TYPE_GCD");
					if (!IUtility.isEmpty(bbsType)) {

						view.addObject("BBS_TYPE_GCD", bbsType);
						view.addObject("BBS_TYPE_SEQ_NO", ((Map) list.get(0)).get("BBS_TYPE_SEQ_NO"));
						
						if("DETAIL".equals( param.get("mode") ) && !IUtility.isEmpty((String) param.get("POSTING_SEQ_NO"))) {
							// 게시판 상세
							str = "/common/bbs/common/detail";
							
							param.put("SESSION_USER_IP", IUtility.getRemoteAddr(request));
							param.put("SESSION_SYSTEM_GCD", "0002");
							param.put("SESSION_MENU_CD", menuCD);
							param.put("BBS_TYPE_GCD", bbsType);
							param.put("BBS_TYPE_SEQ_NO", ((Map) list.get(0)).get("BBS_TYPE_SEQ_NO"));
							
							CustomUserDetail userInfo = null;
							
							if (!"anonymousUser".equals(IUtility.getLoginInfo())) {
								userInfo = (CustomUserDetail) IUtility.getLoginInfo();
								param.put("SESSION_USER_ID", userInfo.getUserId());
								param.put("SESSION_USER_NM", userInfo.getUsername());
							}
							
							bbsService.setBbsConstructor(param, view);
							
							Map<String,Object> viewModel = view.getModel();
							Map<String,Object> bbsData = (Map<String, Object>) viewModel.get("bbsData");
							Map<String,Object> bbsMgrAuth = (Map<String, Object>) viewModel.get("bbsMgrAuth");
							
							if(bbsData.getOrDefault("TITLE_CONTENT","").equals("")) {
								view = new ModelAndView();
								session.setAttribute("_msg", "잘못된 경로로 접근하였습니다.");
								session.setAttribute("returnMenuCD", menuCD);
								view.setViewName("redirect:/login");
								return view;
							}
							
							// 답변글일 경우
							if(Integer.parseInt(String.valueOf(bbsData.getOrDefault("LEVEL", "0"))) > 0) {
								// 권한이 없으면 (원글 작성자 != 로그인한 사용자 &&  답글조회권한 없으면)
								if(!bbsData.getOrDefault("ORIGIN_POSTING_INS_USER_ID","").equals(userInfo.getUserId()) 
										&& !bbsData.getOrDefault("INS_USER_ID","").equals(userInfo.getUserId())
										&& "N".equals(bbsMgrAuth.getOrDefault("REPLY_SEARCH_AUTH_FG","N"))) {
									view = new ModelAndView();
									session.setAttribute("_msg", "조회 권한이 없습니다.");
									session.setAttribute("returnMenuCD", menuCD);
									view.setViewName("redirect:/login");
									return view;
								}
							}
							
							// 비밀글일때
							if("Y".equals(bbsData.getOrDefault("SECRET_FG", ""))) {
								// 비로그인인 경우
								if ("anonymousUser".equals(IUtility.getLoginInfo())
										|| (!(bbsData.getOrDefault("INS_USER_ID","").equals(userInfo.getUserId().trim()) || bbsData.getOrDefault("ORIGIN_POSTING_INS_USER_ID","").equals(userInfo.getUserId().trim()))
												&& "N".equals(bbsMgrAuth.getOrDefault("SECRET_POSTING_SEARCH_AUTH_FG","N"))) ) {
									view = new ModelAndView();
									session.setAttribute("_msg", "조회 권한이 없습니다.");
									session.setAttribute("returnMenuCD", menuCD);
									view.setViewName("redirect:/login");
									return view;
								}
							}
							
							
						}else {
							str = "/common/bbs/bbsType" + IUtility.parseNull(bbsType) + "/list";
						}
					}
				} else if (!IUtility.isEmpty(content) && "0003".equals(IUtility.parseNull(content))) {

					/** start: 컨텐츠 정보 셋팅 **/
					// 해당 메뉴의 첨부파일 코드값
					String attachFileGrpCd = IUtility.parseNull(((Map) list.get(0)).get("ATTACH_FILE_GRP_CD"));

					// 해당 메뉴의 첨부파일이 있으면 첨부파일 목록을 조회한다.
					if (attachFileGrpCd != null && !attachFileGrpCd.equals("")) {
						List<Map<String, Object>> menuFileList = new ArrayList<Map<String, Object>>();
						Map<String, Object> fileParam = new HashMap<String, Object>();
						fileParam.put("ATTACH_FILE_GCD", "");
						fileParam.put("ATTACH_FILE_GRP_CD", attachFileGrpCd);
						fileParam.put("ATTACH_FILE_SEQ_NO", 0);
						fileParam.put("SESSION_SYSTEM_GCD", SYSTEM_GCD);

						menuFileList = filesService.selectList(fileParam);

						Collections.sort(menuFileList, new Comparator<Map<String, Object>>() {
							@Override
							public int compare(Map<String, Object> o1, Map<String, Object> o2) {
								String fileTagContent1 = IUtility.parseNull(o1.get("FILE_TAG_CONTENT"));
								String fileTagContent2 = IUtility.parseNull(o2.get("FILE_TAG_CONTENT"));
								return fileTagContent1.compareTo(fileTagContent2);
							}
						});

						view.addObject("menuFileList", menuFileList);
					}

					// 해당 메뉴의 컨텐츠 목록을 조회한다.
					List<Map<String, Object>> contentList = mainService.selectContentMngList(param);
					for (Map<String, Object> map : contentList) {
						List<Map<String, Object>> contentFileList = new ArrayList<Map<String, Object>>();
						Map<String, Object> fileParam = new HashMap<String, Object>();
						// 해당 컨텐츠의 첨부파일 코드값
						attachFileGrpCd = IUtility.parseNull(map.get("ATTACH_FILE_GRP_CD"));
						// 해당 컨텐츠의 첨부파일이 있으면 첨부파일 목록을 조회한다.
						if (attachFileGrpCd != null && !attachFileGrpCd.equals("")) {
							fileParam.put("ATTACH_FILE_GCD", "");
							fileParam.put("ATTACH_FILE_GRP_CD", attachFileGrpCd);
							fileParam.put("ATTACH_FILE_SEQ_NO", 0);
							fileParam.put("SESSION_SYSTEM_GCD", SYSTEM_GCD);
							contentFileList = filesService.selectList(fileParam);
							Collections.sort(contentFileList, new Comparator<Map<String, Object>>() {
								@Override
								public int compare(Map<String, Object> o1, Map<String, Object> o2) {
									String fileTagContent1 = IUtility.parseNull(o1.get("FILE_TAG_CONTENT"));
									String fileTagContent2 = IUtility.parseNull(o2.get("FILE_TAG_CONTENT"));
									return fileTagContent1.compareTo(fileTagContent2);
								}
							});
							map.put("contentFileList", contentFileList);
						}

					}
					view.addObject("contentList", contentList);

					str = "/common/contents/contentspage";
				}

				if ("".equals(str)) {
					str = (String) ((Map) list.get(0)).get("URL_CONTENT");
				}

				if (!IUtility.isEmpty(str) && !IUtility.parseNull(str).equals("/")) {
					view.addObject("viewpage", ".." + str + ".jsp");
				} else {
					view.addObject("viewpage", "../common/inc/incEmpty.jsp"); // 페이지생성중
				}
			} else {
				if ("anonymousUser".equals(IUtility.getLoginInfo()) ) { 
					//view.addObject("_msg", "로그인 후 이용하세요.");
					//view.addObject("menuCD", "000000000000000");
					//mainProgram(view, request);
					//view.setViewName("common/login");
					view = new ModelAndView();
					session.setAttribute("_msg", "로그인 후 이용하세요.");
					session.setAttribute("returnMenuCD", menuCD);
					view.setViewName("redirect:/login");
				}else{
					//view.addObject("viewpage", "../error/error404.jsp"); // 404 not found page..
					//view.setViewName("common/main");
					view = new ModelAndView();
					session.setAttribute("_msg", "학생지원시스템 사용 권한이 없습니다.");
					view.setViewName("redirect:/main");
				}
				return view;

			}
			view.setViewName("common/pagewrap");
		}
		return view;
	}

	@RequestMapping(value = "/login")
	public ModelAndView loginView(HttpServletRequest request, Model model) throws Exception {
		checkLocale(request);
		checkSiteInfo(request);
		checkRsa(request);
		ModelAndView view = new ModelAndView();
		if (!"anonymousUser".equals(IUtility.getLoginInfo())) {
			CustomUserDetail userInfo = (CustomUserDetail) IUtility.getLoginInfo();
			
			if(!IUtility.parseNull(userInfo.getUserGcd()).equals("0003") || IUtility.parseNull(userInfo.getPersonInfoUseAgreeFg()).equals("Y")) {
				view.addObject("menuCD", "000000000000000");
				view.setViewName("redirect:/main");
				return view;
			}
		}
		view.addObject("_host", request.getServerName());
		view.addObject("_server",
				(IUtility.parseNull(IUtility.getLocalServerIp()).equals(ProjectConstant.REAL_WAS_SERVER)) ? "Real"
						: ((IUtility.parseNull(IUtility.getLocalServerIp()).equals(ProjectConstant.DEV_WAS_SERVER))
								? "Dev"
								: "local"));
		
		
		mainProgram(view, request);
		
		view.addObject("menuCD", "000000000000000");
		view.setViewName("common/login");

		return view;
	}
	
	@RequestMapping(value = "/intro")
	public ModelAndView intro(HttpServletRequest request, Model model) throws Exception {
		ModelAndView view = new ModelAndView();
		Map<String, Object> siteInfo = comFunctionService.getSiteInfo(SYSTEM_GCD);
		if(IUtility.parseNull(siteInfo.get("SYSTEM_EXAMINE_YN")).equals("Y")) {
			if (!"anonymousUser".equals(IUtility.getLoginInfo())) {
				view.addObject("mainLink", "/main");
			}else {
				view.addObject("mainLink", "/login");
			}
			view.addObject("SYSTEM_EXAMINE_CONTENT", siteInfo.get("SYSTEM_EXAMINE_CONTENT"));
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmm",Locale.getDefault());
			SimpleDateFormat newDateFormat = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분",Locale.getDefault());
			Date systemExamineCloseDt = dateFormat.parse(IUtility.parseNull(siteInfo.get("SYSTEM_EXAMINE_CLOSE_DT")).substring(0,12));
			view.addObject("SYSTEM_EXAMINE_CLOSE_DT", newDateFormat.format(systemExamineCloseDt));
			view.setViewName("common/intro");
		}else {
			view.setViewName("redirect:/main");
		}
		return view;
	}
	
	@RequestMapping(value = "/stuidsch")
	public ModelAndView stuidsch(HttpServletRequest request, Model model) throws Exception {
		ModelAndView view = new ModelAndView();
		view.addObject("menuCD", "000000000000000");
		view.setViewName("common/ForeginNewSearch");
		return view;
	}
	
	@RequestMapping(value = "/totalSearch")
	public ModelAndView totalSearch(ParamMap paramMap,HttpServletRequest request, Model model) throws Exception {
		checkLocale(request);
		checkSiteInfo(request);
		checkRsa(request);
		ModelAndView view = new ModelAndView();
		view.addObject("_host", request.getServerName());
		view.addObject("_server",
				(IUtility.parseNull(IUtility.getLocalServerIp()).equals(ProjectConstant.REAL_WAS_SERVER)) ? "Real"
						: ((IUtility.parseNull(IUtility.getLocalServerIp()).equals(ProjectConstant.DEV_WAS_SERVER))
								? "Dev"
								: "local"));
		
		
		view.addObject("menuCD", "000000000000000");
		view.addObject("keyword", IUtility.parseNull(request.getParameter("keyword")));
		view.setViewName("common/search");

		return view;
	}

	
	@RequestMapping(value = "/plogin")
	public ModelAndView plogin(HttpServletRequest request, Model model) throws Exception {
		checkLocale(request);
		checkSiteInfo(request);
		checkRsa(request);

		ModelAndView view = new ModelAndView();

		view.setViewName("common/plogin");
		
		return view;
	}
	
	@RequestMapping(value = "/{sToken}/plogin")
	public String plogin(@PathVariable("sToken") String sToken, HttpServletRequest request, Model model) throws Exception {

		HttpSession session = request.getSession();
		
		String sToken2 = IUtility.parseNull(sToken);

		if(!"".equals(sToken2)) {			
			session.setAttribute("_sToken", sToken2);
		} else {
			session.setAttribute("_sToken", "");
		}
		return "redirect:/plogin";
	}
	
	@RequestMapping(value = "/new_pass/exorgan/exidentify.asp")
	public ModelAndView exidentify(HttpServletRequest request, Model model, @RequestParam Map params) throws Exception {
		ModelAndView view = new ModelAndView();
		
		Map<String, Object> rtn = new HashMap<String, Object>();
		
		if(!"".equals(IUtility.parseNull(params.get("id"))) && !"".equals(IUtility.parseNull(params.get("pswd"))) && !"".equals(IUtility.parseNull(params.get("dest")))) {
			
			params.put("allFlag", "Y");
			List list = mainService.selectMatchedUserList(params);
			
			if (list != null && list.size() > 0) {
				rtn.put("gbn", "True");
				rtn.put("dest", IUtility.parseNull(params.get("dest")));
				rtn.put("sta", ((Map)list.get(0)).get("STA"));
				rtn.put("userid", ((Map)list.get(0)).get("USERID"));
				rtn.put("name", ((Map)list.get(0)).get("NAME"));
				rtn.put("deptcd", ((Map)list.get(0)).get("DEPT_CD"));
				rtn.put("dept", ((Map)list.get(0)).get("DEPT_NM"));
				rtn.put("majorcd", ((Map)list.get(0)).get("MAJOR_CD"));
				rtn.put("major", ((Map)list.get(0)).get("MAJOR_NM"));
				rtn.put("stdt_year", ((Map)list.get(0)).get("STDT_YEAR"));
				rtn.put("collcd", ((Map)list.get(0)).get("COLL_CD"));
				rtn.put("coll", ((Map)list.get(0)).get("COLL_NM"));
				rtn.put("gender", ((Map)list.get(0)).get("GENDER_GCD"));				
			} else {
				rtn.put("gbn", "False");
			}
		} else {
			rtn.put("gbn", "False");
		}

		view.addObject("rtn", rtn);
		view.setViewName("common/exidentify");
		return view;
	}

	@RequestMapping(value = "/main")
	public ModelAndView mainView(HttpServletRequest request, Model model) throws Exception {
		checkLocale(request);
		checkSiteInfo(request);
		checkRsa(request);
		ModelAndView view = new ModelAndView();
		
		CustomUserDetail userInfo = new CustomUserDetail(); 
		if (!"anonymousUser".equals(IUtility.getLoginInfo())) {
			userInfo = (CustomUserDetail) IUtility.getLoginInfo();
		}

		if ("anonymousUser".equals(IUtility.getLoginInfo())) {
			view.setViewName("redirect:/login");
			return view;
		}else {
			//학생 && 개인정보 활용 미동의자 && 사용자전환 아니면 로그아웃후 동의 팝업띄우기 위해 로그인페이지로 이동
			if( (IUtility.parseNull(userInfo.getUserGcd()).equals("0003") && !IUtility.parseNull(userInfo.getPersonInfoUseAgreeFg()).equals("Y") )
				&& IUtility.parseNull(userInfo.getOriginId()).equals("") 
					) {

				Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
				new SecurityContextLogoutHandler().logout(request, null, authentication); //로그아웃
				
				checkRsa(request);
				EgovSessionCookieUtil.setSessionAttribute(request, "SESSION_LOCALE",userInfo.getLangGcd());
				EgovSessionCookieUtil.setSessionAttribute(request, "sessionAuthStdtInfo",authentication);
				view.addObject("stdtInfo", IUtility.getClassToMap(userInfo));
				view.addObject("menuCD", "000000000000000");
				mainProgram(view, request);
				view.setViewName("common/login");
				return view;
			}
		}
		
		
		
		HttpSession session = request.getSession();
		String appRedirectUrl = IUtility.parseNull(session.getAttribute("appRedirectUrl"));
		if(!appRedirectUrl.equals("")) {
			view.setViewName("redirect:"+appRedirectUrl);
			session.setAttribute("appRedirectUrl", "");
			return view;
		}
		
		String returnMenuCD = IUtility.parseNull(session.getAttribute("returnMenuCD"));
		if(!returnMenuCD.equals("")) {
			view.setViewName("redirect:/page?menuCD="+returnMenuCD);
			session.setAttribute("returnMenuCD", "");
			return view;
		}
		
		view.addObject("_server",
				(IUtility.parseNull(IUtility.getLocalServerIp()).equals(ProjectConstant.REAL_WAS_SERVER)) ? "Real"
						: ((IUtility.parseNull(IUtility.getLocalServerIp()).equals(ProjectConstant.DEV_WAS_SERVER))
								? "Dev"
								: "local"));
		
		
		view.addObject("menuCD", "000000000000000");
		mainProgram(view, request);
		view.setViewName("common/main");

		return view;
	}

	@RequestMapping(value = "/global/info")
	public ModelAndView infoSelectList(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		
		checkLocale(request);
		ModelAndView view = new ModelAndView();
		Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
		
		view.setViewName("jsonView");

		HttpSession session = request.getSession();
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		Map<String, Object> param = new HashMap<String, Object>();
		if ("anonymousUser".equals(IUtility.getLoginInfo())) {
			List<Map<String, Object>> allMenuSessionList = (List<Map<String, Object>>) session.getAttribute("selectAllMenu");
			/* 웹접근성심사 중 적용(오픈 후 삭제대상) START
			param.put("USER_ID", "stdt01");
			if(allMenuSessionList == null ) {
					list = (List<Map<String, Object>>) mainService.selectMenu(param); //selectAllMenu
					session.setAttribute("selectAllMenu", list);
			}else {
				if ( IUtility.parseNull(params.get("menuCD")).equals("") ||  IUtility.parseNull(params.get("menuCD")).equals("000000000000000") ) {
					list = (List<Map<String, Object>>) mainService.selectMenu(param); //selectAllMenu
					session.setAttribute("selectAllMenu", list);
				}else {
					list = allMenuSessionList;
				}
			}
			웹접근성심사 중 적용(오픈 후 삭제대상) END */
			
			/* 웹접근성 심사후 적용 */
			if(allMenuSessionList == null ) {
					list = (List<Map<String, Object>>) mainService.selectAllMenu(param);
					session.setAttribute("selectAllMenu", list);
			}else {
				if ( IUtility.parseNull(params.get("menuCD")).equals("") ||  IUtility.parseNull(params.get("menuCD")).equals("000000000000000") ) {
					list = (List<Map<String, Object>>) mainService.selectAllMenu(param);
					session.setAttribute("selectAllMenu", list);
				}else {
					list = allMenuSessionList;
				}
			}
			
			view.addObject("_Menu", list);
			view.addObject("_locale",
					IUtility.parseNull(EgovSessionCookieUtil.getSessionAttribute(request, "SESSION_LOCALE"), "0001"));
		} else {
			
			CustomUserDetail userInfo = (CustomUserDetail) IUtility.getLoginInfo();
			param.put("USER_ID", userInfo.getUserId());
			List<Map<String, Object>> menuSessionList = (List<Map<String, Object>>) session.getAttribute("selectMenu");
			if(menuSessionList == null ) {
				list = (List<Map<String, Object>>) mainService.selectMenu(param);
				session.setAttribute("selectMenu", list);
			}else {
				if( IUtility.parseNull(params.get("menuCD")).equals("") ||  IUtility.parseNull(params.get("menuCD")).equals("000000000000000") ) {
					list = (List<Map<String, Object>>) mainService.selectMenu(param);
					session.setAttribute("selectMenu", list);
				}else {
					list = menuSessionList;
				}
			}
			
			
			view.addObject("_Menu", list);
			view.addObject("_LoginUser", IUtility.getClassToMap(userInfo));
			
			EgovSessionCookieUtil.setSessionAttribute(request, "loginUser",IUtility.getClassToMap(userInfo));
		}

		

		params.put("SYSTEM_GCD", SYSTEM_GCD);
		params.put("MENU_CD", params.get("menuCD"));
		params.put("SESSION_LOCALE", sessionLocale);
		Map<String, Object> termInfo = mainService.selectOneShafYyShtm(params);
		view.addObject("termInfo", termInfo);

		if ("anonymousUser".equals(IUtility.getLoginInfo())) {
			if (!"0001".equals(
					IUtility.parseNull(EgovSessionCookieUtil.getSessionAttribute(request, "SESSION_LOCALE"), "0001"))) {
				view.addObject("_i18n", mainService.selectLangList((Map<String, Object>) paramMap.get("data")));
			}
		}else {
			CustomUserDetail userInfo = (CustomUserDetail) IUtility.getLoginInfo();
			if (!"0001".equals(
					userInfo.getLangGcd())) {
				view.addObject("_i18n", mainService.selectLangList((Map<String, Object>) paramMap.get("data")));
			}
		}
		return view;
	}

	@RequestMapping(value = "/common/lang/langChange")
	public ModelAndView langChange(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		checkLocale(request);
		ModelAndView view = new ModelAndView();

		view.setViewName("jsonView");

		Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
		String locale = IUtility.parseNull(params.get("langGcd"), "0001");

		if (!"anonymousUser".equals(IUtility.getLoginInfo())) {
			((CustomUserDetail) IUtility.getLoginInfo()).setLangGcd(locale);
			mainService.updateLangGcd(params);
		}
		EgovSessionCookieUtil.setSessionAttribute(request, "SESSION_LOCALE", locale);

		return view;
	}

	@RequestMapping(value = "/common/lang/addLangInfo")
	public ModelAndView addLangInfo(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		checkLocale(request);
		ModelAndView view = new ModelAndView();

		view.setViewName("jsonView");

		List<Map<String, Object>> params = (List<Map<String, Object>>) paramMap.get("data");
		mainService.addLangInfo(params);

		return view;
	}

	@RequestMapping(value = "/error/accessdenied")
	public ModelAndView accessdenied(HttpServletRequest request, Model model) throws Exception {
		checkLocale(request);
		String execMain = IUtility.parseNull(request.getParameter("execMain"));
		ModelAndView view = new ModelAndView();
		view.setViewName("websquare/websquare");
		view.addObject("statusCode", 403);
		if (!"".equals(execMain)) {
			view.addObject("execMain", "Y");
		}
		view.addObject("movePage", "/html/error/accessDenied.xml");

		if ("Y".equals(request.getParameter("isi18n")))
			view.setViewName("websquare/i18n");

		return view;
	}

	@RequestMapping(value = "/error/invalidtocken")
	public ModelAndView invalidtocken(HttpServletRequest request, Model model) throws Exception {
		checkLocale(request);
		String execMain = IUtility.parseNull(request.getParameter("execMain"));
		ModelAndView view = new ModelAndView();
		view.setViewName("websquare/websquare");
		view.addObject("statusCode", 401);
		if (!"".equals(execMain)) {
			view.addObject("execMain", "Y");
		}
		view.addObject("movePage", "/html/error/invalidTocken.xml");

		if ("Y".equals(request.getParameter("isi18n")))
			view.setViewName("websquare/i18n");

		return view;
	}

	@RequestMapping(value = "/error/entrypoint")
	public ModelAndView entrypoint(HttpServletRequest request, Model model) throws Exception {
		checkLocale(request);
		String execMain = IUtility.parseNull(request.getParameter("execMain"));
		ModelAndView view = new ModelAndView();
		view.setViewName("websquare/websquare");
		view.addObject("statusCode", 440);
		if (!"".equals(execMain)) {
			view.addObject("execMain", "Y");
		}
		view.addObject("movePage", "/html/error/entryPoint.xml");

		if ("Y".equals(request.getParameter("isi18n")))
			view.setViewName("websquare/i18n");

		return view;
	}

	@RequestMapping(value = "/error/error404")
	public ModelAndView error404(HttpServletRequest request, Model model) throws Exception {
		checkLocale(request);
		ModelAndView view = new ModelAndView();
		String isAjax = IUtility.parseNull(request.getHeader("AJAX"));
		if (!"".equals(isAjax)) {
			// view.setViewName("jsonView");
			String url = "Not Found";
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("message", IUtility.getCommonMessage(request, localeMessageSource, "errors.notfound", url));
			map.put("status", 404);
			map.put("errorType", "NoHandlerFoundException");
			view.addAllObjects(map);
			view = new ModelAndView("jsonView", map);
		} else {
			view.setViewName("websquare/websquare");
			view.addObject("statusCode", 404);
			view.addObject("movePage", "/html/error/error404.xml");

			if ("Y".equals(request.getParameter("isi18n")))
				view.setViewName("websquare/i18n");
		}
		return view;
	}

	@RequestMapping(value = "/error/error450")
	public String error450(HttpServletRequest request, Model model) throws Exception {
		return "/error/error450";
	}
}
