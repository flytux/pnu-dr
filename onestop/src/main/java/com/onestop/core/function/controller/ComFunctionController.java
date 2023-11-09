package com.onestop.core.function.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.onestop.core.function.service.ComFunctionService;
import com.onestop.core.resolver.ParamMap;
import com.onestop.core.util.IUtility;
import com.onestop.core.util.ProjectConstant;
import com.onestop.core.util.controller.CommonController;

import WiseAccess.SSO;

@RequestMapping(value = "/core/function")
@RestController
public class ComFunctionController extends CommonController {

	@Autowired
	MessageSource localeMessageSource;

	@Autowired
	private ComFunctionService comFunctionService;

	/**
	 * 공통코드관리 공통코드 데이터를 조회한다.
	 * 
	 * @param paramMap
	 * @param request
	 * @param response
	 * @return Map<String, Object>
	 * @throws Exception
	 */
	@RequestMapping(value = "/getCode")
	public Map<String, Object> getCode(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		Map<String, Object> param = (Map<String, Object>) paramMap.get("data");

		setSuccess(result, comFunctionService.getCode(param));
		return result;
	}

	/**
	 * 공통코드관리 공통코드 데이터를 조건별 조회한다.
	 * 
	 * @param paramMap
	 * @param request
	 * @param response
	 * @return Map<String, Object>
	 * @throws Exception
	 */
	@RequestMapping(value = "/getCodeByEtcParam")
	public ModelAndView getCodeByEtcParam(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView view = new ModelAndView();
		view.setViewName("jsonView");
		Map<String, Object> result = new HashMap<String, Object>();
		Map<String, Object> param = (Map<String, Object>) paramMap.get("data");

		view.addObject("data", comFunctionService.getCodeByEtcParam(param));
		return view;
	}

	@RequestMapping(value = "/getEmpUserInfo")
	public Map<String, Object> getEmpUserInfo(ParamMap paramMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		Map<String, Object> param = (Map<String, Object>) paramMap.get("data");

		setSuccess(result, comFunctionService.getEmpUserInfo(param));
		return result;
	}

	@RequestMapping(value = "/getAssignComboGradGcdInfo")
	public Map<String, Object> getAssignComboGradGcdInfo(ParamMap paramMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		Map<String, Object> param = (Map<String, Object>) paramMap.get("data");

		setSuccess(result, comFunctionService.getAssignComboGradGcdInfo(param));
		return result;
	}

	@RequestMapping(value = "/getAssignComboCollCdInfo")
	public Map<String, Object> getAssignComboCollCdInfo(ParamMap paramMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		Map<String, Object> param = (Map<String, Object>) paramMap.get("data");

		setSuccess(result, comFunctionService.getAssignComboCollCdInfo(param));
		return result;
	}
	
	@RequestMapping(value = "/getAssignComboDeptCdInfo")
	public Map<String, Object> getAssignComboDeptCdInfo(ParamMap paramMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		Map<String, Object> param = (Map<String, Object>) paramMap.get("data");

		setSuccess(result, comFunctionService.getAssignComboDeptCdInfo(param));
		return result;
	}

	@RequestMapping(value = "/getAssignComboMajorCdInfo")
	public Map<String, Object> getAssignComboMajorCdInfo(ParamMap paramMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		Map<String, Object> param = (Map<String, Object>) paramMap.get("data");

		setSuccess(result, comFunctionService.getAssignComboMajorCdInfo(param));
		return result;
	}

	@RequestMapping(value = "/getAssignComboDeptMajorCdInfo")
	public Map<String, Object> getAssignComboDeptMajorCdInfo(ParamMap paramMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		Map<String, Object> param = (Map<String, Object>) paramMap.get("data");

		setSuccess(result, comFunctionService.getAssignComboDeptMajorCdInfo(param));
		return result;
	}

	@RequestMapping(value = "/clauseDetailList")
	public Map<String, Object> clauseDetailList(ParamMap paramMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		Map<String, Object> param = (Map<String, Object>) paramMap.get("data");

		setSuccess(result, comFunctionService.clauseDetailList(param));
		return result;
	}

	@RequestMapping(value = "/chkClauseSave")
	public Map<String, Object> chkClauseSave(ParamMap paramMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		List<Map<String, Object>> param = (List<Map<String, Object>>) paramMap.get("data");

		return result;
	}

	@RequestMapping(value = "/accountchk/api")
	public Map<String, Object> cooconApi(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		Map<String, Object> apiResult = new HashMap<String, Object>();
		Map<String, Object> param = (Map<String, Object>) paramMap.get("data");

		String userip = IUtility.parseNull((String) param.get("SESSION_USER_IP"));
		String userid = IUtility.parseNull((String) param.get("USER_ID"));
		String nm = "";

		boolean apiChkFlag = false;

		if (userip != null && (userip.equals("127.0.0.1") || userip.equals("0:0:0:0:0:0:0:1"))) {
			param.clear();

			param.put("RSLT", "OK");
			param.put("RSLT_ACCT_NM", "로컬테스트");
			param.put("RSLT_CD", "0000");
			param.put("RSLT_MSG", "로컬 계좌검증 pass!!");

		} else {
			if (userid != null && !"".equals(userid)) {
				param.put("GBN", "ID");
				param.put("NM", "");
				param.put("CNDTN", "");
				List userList = comFunctionService.getUserInfo(param);
				if (userList != null && userList.size() > 0) {
					nm = IUtility.parseNull(((Map<String, Object>) userList.get(0)).get("NM"));
					apiResult = IUtility.accountChk(param);
					apiChkFlag = true;
				} else {
					param.clear();

					param.put("RSLT", "ERROR");
					param.put("RSLT_ACCT_NM", "");
					param.put("RSLT_CD", "");
					param.put("RSLT_MSG", "[" + userid + "]에 해당하는 사용자정보가 존재하지 않습니다.");
				}
			} else {
				apiResult = IUtility.accountChk(param);
				apiChkFlag = true;
			}

			if (apiChkFlag) {
				param.put("INFO_SEARCH_GCD", "0004");
				param.put("SEARCH_REASON_GCD", "0007");
				param.put("FILE_NM", ".");
				param.put("SEARCH_CONDTN_CONTENT", param.toString());
				param.put("PERSON_INFO_INCLUDE_FG", "N");
				param.put("REMARK", apiResult.toString());
				comFunctionService.infoSearchInsert(param);

				param.clear();

				param.put("RSLT_CD", apiResult.get("RSLT_CD"));
				param.put("RSLT_MSG", apiResult.get("RSLT_MSG"));

				if (apiResult != null && apiResult.get("RSLT_CD") != null && "0000".equals(apiResult.get("RSLT_CD"))) {
					List list = (List) apiResult.get("RESP_DATA");
					if (list != null && list.size() > 0) {
						param.put("RSLT_ACCT_NM", IUtility.parseNull(((Map) list.get(0)).get("ACCT_NM")));
					}
					if (!"".equals(nm)) {
						if (nm.equals(((String) param.get("RSLT_ACCT_NM")).replaceAll("　", ""))) {
							param.put("RSLT", "OK");
						} else {
							param.put("RSLT", "ERROR");
							param.put("RSLT_CD", "_");
							param.put("RSLT_MSG", "예금주 정보가 일치하지 않습니다.");
							param.put("RSLT_INPUT_USERNM", nm);
							param.put("RSLT_OUTPUT_USERNM", ((String) param.get("RSLT_ACCT_NM")).replaceAll("　", ""));
						}
					} else {
						param.put("RSLT", "OK");
					}
				} else {
					param.put("RSLT", "ERROR");
				}
			}
		}
		setSuccess(result, param);
		return result;
	}

	@RequestMapping(value = "/getNoticePopupInfo")
	public ModelAndView getNoticePopupInfo(ParamMap paramMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView view = new ModelAndView();
		view.setViewName("jsonView");
		Map<String, Object> result = new HashMap<String, Object>();
		Map<String, Object> param = (Map<String, Object>) paramMap.get("data");

		comFunctionService.getNoticePopupInfo(param,view);
		
		return view;
	}

	@RequestMapping(value = "/infoSearchInsert")
	public Map<String, Object> infoSearchInsert(ParamMap paramMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		Map<String, Object> param = (Map<String, Object>) paramMap.get("data");

		comFunctionService.infoSearchInsert(param);
		setSuccess(result, param);
		return result;
	}
	
	@RequestMapping(value = "/encData")
    public Map<String, Object> encData(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {

        Map<String, Object> result = new HashMap<String, Object>();
        Map<String, Object> param = (Map<String, Object>) paramMap.get("data");
        
        IUtility.removeSystemAttrData(param);
        for(String obj : param.keySet()) {
            result.put("enc" + obj, IUtility.getEncStr(IUtility.parseNull(param.get(obj)),ProjectConstant.SECURITY_KEY) );
        }
        return result;
    }
	
	@RequestMapping(value = "/sTokenUnreg")
    public Map<String, Object> sTokenUnreg(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {

        Map<String, Object> result = new HashMap<String, Object>();

        HttpSession session = request.getSession();
        String sToken = IUtility.parseNull(session.getAttribute("_sToken"));
        
        if(!"".equals(sToken)) {
            String cIp = IUtility.getRemoteAddr(request);
            SSO sso = IUtility.ssoGet(cIp);
            sso.unregUserSession( sToken );
            session.setAttribute("_sToken", sToken);
        }
        return result;
    }
    
    @RequestMapping(value = "/sTokenValid")
    public Map<String, Object> sTokenValid(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {

        Map<String, Object> result = new HashMap<String, Object>();

        HttpSession session = request.getSession();
        String sToken = IUtility.parseNull(session.getAttribute("_sToken"));
        
        if(!"".equals(sToken)) {
            String cIp = IUtility.getRemoteAddr(request);
            SSO sso = IUtility.ssoGet(cIp);

            if( sso.verifyToken( sToken, cIp ) >= 0 ) {
                result.put("sTokenValid", true);
            } else {
                result.put("sTokenValid", false);
                session.setAttribute("_sToken", "");
                session.setAttribute("_sTokenChk", false);
            }   
        } else {
            result.put("sTokenValid", false);
            session.setAttribute("_sToken", "");
            session.setAttribute("_sTokenChk", false);
        }
        return result;
    }
    
    
    /**
     * 공통코드관리 공통코드 데이터를 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/bindProc")
    public Map<String, Object> bindProc(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        Map<String, Object> result = new HashMap<String, Object>();
        @SuppressWarnings("unchecked")
        Object data = paramMap.get("data");
        if (data != null) {
            if ((data.getClass().getName()).contains("Map")) {
                setSuccess(result, comFunctionService.bindProc((Map) data));
            } else if ((data.getClass().getName()).contains("List")) {
                setSuccess(result, comFunctionService.bindProcList((List) data));
            }
        }
        return result;
    }   
    
}
