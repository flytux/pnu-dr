package com.onestop.core.main.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.servlet.ModelAndView;

import com.onestop.core.bbs.service.BbsService;
import com.onestop.core.function.service.ComFunctionService;
import com.onestop.core.main.service.MainService;
import com.onestop.core.main.service.OstServiceMngService;
import com.onestop.core.resolver.ParamMap;
import com.onestop.core.security.service.UserLoginCheckService;
import com.onestop.core.security.user.CustomUserDetail;
import com.onestop.core.util.IUtility;
import com.onestop.core.util.ProjectConstant;
import com.onestop.core.util.controller.CommonController;
import com.onestop.ost.cls.lecaplycheck.service.AtlectSearchService;
import com.onestop.ost.hj.stdtinfo.service.StdtInfoUpdService;

import egovframework.com.utl.cas.service.EgovSessionCookieUtil;

/**
 * @Class Name : LoginController.java
 * @Description : 로그인 Controller Class
 * @Modification Information
 * @ @ 수정일 수정자 수정내용 @ --------- --------- ------------------------------- @
 *   2018.05.17 서대영 최초생성
 */
@RequestMapping(value = "/core/main")
@RestController
public class MainController extends CommonController {

	@Autowired
	MessageSource localeMessageSource;

	@Resource(name = "mainService")
	private MainService mainService;

	@Autowired
	UserLoginCheckService userLoginCheckService;

	@Autowired
	UserDetailsService customUserDetailsService;
	
	@Autowired
    private OstServiceMngService ostServiceMngService;
	
	
	@Autowired
    private AtlectSearchService atlectSearchService;
	
	@Autowired
    private BbsService bbsService;
	
	@Autowired
    private ComFunctionService comFunctionService;

	@RequestMapping(value = "/selectMenu")
	public Map<String, Object> selectMenu(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		Map<String, Object> param = (Map<String, Object>) paramMap.get("data");
		if ("".equals(param.get("MENU_KOR_NM")) || param.get("MENU_KOR_NM") == null) {
			param.put("MENU_KOR_NM", "");
		}
		setSuccess(result, mainService.selectMenu(param));
		return result;
	}
	
	@RequestMapping(value = "/selectListUser")
    public Map<String, Object> selectListUser(ParamMap paramMap, HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        Map<String, Object> result = new HashMap<String, Object>();
        Map<String, Object> param = (Map<String, Object>) paramMap.get("data");

        setSuccess(result, mainService.selectListUser(param));
        return result;
    }

	@RequestMapping(value = "/logout")
	public Map<String, Object> logout(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		Map<String, Object> map = new HashMap<String, Object>();

		HttpSession session = request.getSession();
		RequestContextHolder.getRequestAttributes().removeAttribute("SESSION_USER_ID", RequestAttributes.SCOPE_SESSION);
		RequestContextHolder.getRequestAttributes().removeAttribute("SESSION_USER_IP", RequestAttributes.SCOPE_SESSION);
		RequestContextHolder.getRequestAttributes().removeAttribute("SESSION_CHG_PWD", RequestAttributes.SCOPE_SESSION);
		RequestContextHolder.getRequestAttributes().removeAttribute("SESSION_GIGWAN", RequestAttributes.SCOPE_SESSION);
		RequestContextHolder.getRequestAttributes().removeAttribute("SESSION_USER_NM", RequestAttributes.SCOPE_SESSION);
		RequestContextHolder.getRequestAttributes().removeAttribute("SESSION_BIRTH_DT", RequestAttributes.SCOPE_SESSION);
		RequestContextHolder.getRequestAttributes().removeAttribute("SESSION_GEN_FG", RequestAttributes.SCOPE_SESSION);
		RequestContextHolder.getRequestAttributes().removeAttribute("SESSION_BUSEO_CD", RequestAttributes.SCOPE_SESSION);
		RequestContextHolder.getRequestAttributes().removeAttribute("SESSION_BUSEO_NM", RequestAttributes.SCOPE_SESSION);
		RequestContextHolder.getRequestAttributes().removeAttribute("SESSION_JK_FG", RequestAttributes.SCOPE_SESSION);
		RequestContextHolder.getRequestAttributes().removeAttribute("SESSION_LOGIN_MAP", RequestAttributes.SCOPE_SESSION);

		session.invalidate();

		map.put("O_RSLT", "Y");
		map.put("O_MSG", "");
		setSuccess(result, map);
		return result;
	}
	
	
	/**
     * 즐겨찾기 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectListBookMark")
    public ModelAndView selectListBookMark(ParamMap paramMap, HttpServletRequest request,HttpServletResponse response) throws Exception {
    	ModelAndView view = new ModelAndView();
    	view.setViewName("jsonView");
     
        Map<String, Object> param = (Map<String, Object>) paramMap.get("data");
        
        HttpSession session = request.getSession();
        List<Map<String, Object>> favList = new ArrayList<Map<String,Object>>();
        if(IUtility.parseNull(session.getAttribute("favList")) =="") {
        	favList = mainService.selectListBookMark(param);
        	session.setAttribute("favList", favList);
        }else {
        	favList = (List<Map<String, Object>>) session.getAttribute("favList");
        }
        view.addObject("favList", favList);
        return view;
    }
    
    /**
     * 즐겨찾기 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/resetSelectListBookMark")
    public ModelAndView resetSelectListBookMark(ParamMap paramMap, HttpServletRequest request,HttpServletResponse response) throws Exception {
    	ModelAndView view = new ModelAndView();
    	view.setViewName("jsonView");
     
        Map<String, Object> param = (Map<String, Object>) paramMap.get("data");
        HttpSession session = request.getSession();
        List<Map<String, Object>> favList = mainService.selectListBookMark(param);
        session.setAttribute("favList", favList);
        view.addObject("favList", favList);
        return view;
    }
	
	/**
     * 즐겨찾기 추가 및 삭제- 츨겨찾기를 추가 및 삭제한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/excuteBookMark")
    public Map<String, Object> excuteBookMark(ParamMap paramMap, HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        Map<String, Object> result = new HashMap<String, Object>();
        Map<String, Object> map = new HashMap<String, Object>();

        Map<String, Object> param = (Map<String, Object>) paramMap.get("data");

        setSuccess(result, mainService.excuteBookMark(param));
        return result;
    }
    
    
    /**
     * 즐겨찾기 순서변경 - 츨겨찾기 순서를 변경한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/excutePositionBookMark")
    public Map<String, Object> excutePositionBookMark(ParamMap paramMap, HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        Map<String, Object> result = new HashMap<String, Object>();
        @SuppressWarnings("unchecked")
        List<Map<String, Object>> datas= (List<Map<String, Object>>) paramMap.get("data");
        for (int i = 0; i < datas.size(); i++) {
    		String [] params = {
    				"SESSION_SYSTEM_GCD",
    				"SESSION_USER_ID",
    				"MENU_CD",
    				"LINEUP_SEQ_NO",
    				"SESSION_USER_ID",
    				"SESSION_USER_IP",
    				"SESSION_SYSTEM_GCD",
    				"SESSION_MENU_CD"
    		};
    		
    		datas.get(i).put("params", params);
    		datas.get(i).put("db", "SYS");
    		datas.get(i).put("proc", "SYS_공통_즐겨찾기_위치변경_저장");
    		datas.get(i).put("resultCnt", 1);
		}

		Map<String, Object> resultMap = (Map<String, Object>)comFunctionService.bindProcList(datas);
		

        
        setSuccess(result, resultMap);

        return result;
    }
    
    /**
     * 대학공지 게시글 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectPnuNoticeList")
    public ModelAndView selectPnuNoticeList(ParamMap paramMap, HttpServletRequest request,HttpServletResponse response) throws Exception {
    	ModelAndView view = new ModelAndView();
    	view.setViewName("jsonView");
     
        Map<String, Object> param = (Map<String, Object>) paramMap.get("data");
        view.addObject("PnuNoticeList", mainService.selectPnuNoticeList(param));
        return view;
    }
    
    
    /**
     * 학사일정 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectScheduleListPop")
    public ModelAndView selectScheduleListPop(ParamMap paramMap, HttpServletRequest request,HttpServletResponse response) throws Exception {
    	ModelAndView view = new ModelAndView();
    	view.setViewName("jsonView");

        Map<String, Object> param = (Map<String, Object>) paramMap.get("data");
        
        param.put("SYSTEM_GCD", param.get("SESSION_SYSTEM_GCD"));
		param.put("MENU_CD", "000000000000000");
		
		Map<String, Object> termInfo = mainService.selectOneShafYyShtm(param);
        param.put("P_SYSTEM_GCD", "");
        if(!IUtility.parseNull(param.get("SCH_SYEAR")).equals("")) {
        	param.put("P_SYEAR", IUtility.parseNull(param.get("SCH_SYEAR")));
        }else {
        	param.put("P_SYEAR", termInfo.get("SYEAR"));
        }
        if(!IUtility.parseNull(param.get("SCH_TERM_GCD")).equals("")) {
        	param.put("P_TERM_GCD", IUtility.parseNull(param.get("SCH_TERM_GCD")));
        }else {
        	param.put("P_TERM_GCD", termInfo.get("TERM_GCD"));
        }
		
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
		param.put("P_DOING_FG", "");
        //일정목록 조회
        List<Map<String, Object>> scheduleList = ostServiceMngService.selectListSchedulePopMng(param);
        view.addObject("scheduleList", scheduleList);
        view.addObject("pageInfo", IUtility.getPageInfo(param, scheduleList));
        view.addObject("params", param);
        view.setViewName("common/mainPopup/SchedulePop");
        
        return view;
    }
    
    /**
     * 학사일정 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectScheduleList")
    public ModelAndView selectScheduleList(ParamMap paramMap, HttpServletRequest request,HttpServletResponse response) throws Exception {
    	ModelAndView view = new ModelAndView();
    	view.setViewName("jsonView");

        Map<String, Object> param = (Map<String, Object>) paramMap.get("data");
  
        param.put("SYSTEM_GCD", param.get("SESSION_SYSTEM_GCD"));
		param.put("MENU_CD", "000000000000000");

		Map<String, Object> termInfo = mainService.selectOneShafYyShtm(param);
        param.put("P_SYSTEM_GCD", "");
        if(!IUtility.parseNull(param.get("SCH_SYEAR")).equals("")) {
        	param.put("P_SYEAR", IUtility.parseNull(param.get("SCH_SYEAR")));
        }else {
        	param.put("P_SYEAR", termInfo.get("SYEAR"));
        }
        if(!IUtility.parseNull(param.get("SCH_TERM_GCD")).equals("")) {
        	param.put("P_TERM_GCD", IUtility.parseNull(param.get("SCH_TERM_GCD")));
        }else {
        	param.put("P_TERM_GCD", termInfo.get("TERM_GCD"));
        }
		
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
		param.put("P_DOING_FG", "");
        //일정목록 조회
        List<Map<String, Object>> scheduleList = ostServiceMngService.selectListScheduleMng(param);
        view.addObject("data", scheduleList);
        view.addObject("pageInfo", IUtility.getPageInfo(param, scheduleList));
        view.addObject("params", param);
        return view;
    }
    
    
    /**
     * 학생 개인정보수정 팝업 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/stdtMyInfoPop")
    public ModelAndView stdtMyInfoPop(ParamMap paramMap, HttpServletRequest request,HttpServletResponse response) throws Exception {
    	ModelAndView view = new ModelAndView();
    	Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
    	view.setViewName("jsonView");
    	view.setViewName("common/mainPopup/stdtMyInfoPop");
    	view.addObject("params", params);
        return view;
    }	
  
    /**
     * 학생 개인정보및동의 저장
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/excuteStdtInfo")
    public ModelAndView excuteStdtInfo(ParamMap paramMap, HttpServletRequest request,HttpServletResponse response) throws Exception {
    	ModelAndView view = new ModelAndView();
    	view.setViewName("jsonView");
    	Map<String, Object> params = (Map<String, Object>) paramMap.get("data");

    	mainService.excuteStdtInfo(params , request);

        return view;
    }
    
    /**
     * 학기 수강학점 조회
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return ModelAndView
     * @throws Exception
     */
    @RequestMapping(value = "/AtlectList")
    public ModelAndView AtlectList(ParamMap paramMap, HttpServletRequest request,HttpServletResponse response) throws Exception {
    	ModelAndView view = new ModelAndView();
    	Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
    	view.setViewName("jsonView");
    	
    	/*** 학기 수강학점 ***/ 
		List<Map<String, Object>> list = atlectSearchService.searchAtlectSearchList(params);
		float crdt = 0;
		for (Map<String, Object> map : list) {
			//crdt += IUtility.parseInt(df_0.format(map.get("CRDT")));
			crdt += Float.parseFloat(IUtility.parseNull(map.get("CRDT")));
		}
		view.addObject("TERM_TOT_CRDT", crdt);
		
		Map<String, Object> _map = atlectSearchService.searchAtlectTotSearch(params);
		float _crdt = 0;
		if(_map != null) {
			_crdt += Float.parseFloat(IUtility.parseNull(_map.get("PSBL_CRDT")));
		}
		view.addObject("TERM_TOTAL_CRDT", _crdt);
		
        return view;
    }	
    
    /**
     * 학기 수강학점 조회
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return ModelAndView
     * @throws Exception
     */
    @RequestMapping(value = "/selectMainBbsList")
    public ModelAndView selectMainBbsList(ParamMap paramMap, HttpServletRequest request,HttpServletResponse response) throws Exception {
    	ModelAndView view = new ModelAndView();
    	Map<String, Object> params = (Map<String, Object>) paramMap.get("data");

    	view.setViewName("jsonView");
    	params.put("SESSION_MENU_CD", params.get("menuCd"));
    	params.put("pageSize", params.get("bbsPageSize"));
    	bbsService.setMainBbsListConstructor(params,view );

        return view;
    }
    /**
     * 세션시간 갱신
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return ModelAndView
     * @throws Exception
     */
    @RequestMapping(value = "/reSession")
    public ModelAndView reSession(ParamMap paramMap, HttpServletRequest request,HttpServletResponse response) throws Exception {
    	ModelAndView view = new ModelAndView();
    	Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
    	view.setViewName("jsonView");
        return view;
    }
    
    @RequestMapping(value = "/saveChgPwd")
    public Map<String, Object> saveChgPwd(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> result = new HashMap<String, Object>();
        Map<String, Object> map = new HashMap<String, Object>();

        Map<String, Object> param = (Map<String, Object>) paramMap.get("data");

        setSuccess(result, mainService.saveChgPwd(param));
        return result;
    }
    
    /**
     * 서식다운로드 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectListFormDownload")
    public ModelAndView selectListFormDownload(ParamMap paramMap, HttpServletRequest request,HttpServletResponse response) throws Exception {
    	Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
    	
    	String [] params = {};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_공통_서식다운로드_조회");
		data.put("resultCnt", 1);
		comFunctionService.setPaging(data);
    	
    	List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
    	
    	for (Map<String, Object> item : list) {
    		item.put("PARAM_CODE", IUtility.getEncStr((String) item.get("RAW_PARAM_CODE"), ProjectConstant.SECURITY_KEY));
    		item.remove("RAW_PARAM_CODE");
    	}
    	
    	ModelAndView view = new ModelAndView();
    	view.setViewName("jsonView");
    	view.addObject("formDownloadList", list);
        return view;
    }
}