package com.onestop.ost.cls.atlectcancel.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.onestop.core.function.service.ComFunctionService;
import com.onestop.core.main.service.MainService;
import com.onestop.core.resolver.ParamMap;
import com.onestop.core.util.IUtility;
import com.onestop.core.util.controller.CommonController;
import com.onestop.ost.cls.atlectcancel.service.AtlectCancelService;

/**
 * <pre>
 * Class Name: AtlectCancelController.java
 * Description:  수강취소 Controller Class
 * </pre>
 * 
 * @author 김수민
 * @since 2022. 03. 02.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@RequestMapping(value = "/ost/cls/atlectcancel/AtlectCancel")

@RestController
public class AtlectCancelController extends CommonController {

    @Autowired
    MessageSource localeMessageSource;
    
	@Autowired
    private ComFunctionService comFunctionService;
	
    @Autowired
    private AtlectCancelService atlectCancelService;
    
    @Autowired
    private MainService mainService;
    
    /**
     * 기준학년도,학기, 학사학위추득 유예여부를 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/searchCurcStdtYear")
    public ModelAndView searchCurcStdtYear(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        Map<String, Object> params = (Map<String, Object>) paramMap.get("data");

        // 기준학년도 조회
        Map<String, Object> termInfo = mainService.selectOneShafYyShtm(params);
        
        params.put("SCH_SYEAR",  termInfo.get("SYEAR")); 
        params.put("SCH_TERM_GCD",  termInfo.get("TERM_GCD")); 
        
        // 학사학위취득 유예여부
        Map<String, Object> courConfFg = atlectCancelService.searchCurcStdtYear(params);

        view.addObject("data", courConfFg);
        return view;
    }
    
    /**
     * 수강신청학점, 수강신청과목수를 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/searchLecApplyCrdtCnt")
    public ModelAndView searchLecApplyCrdtCnt(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        
        // 기준학년도 조회
        Map<String, Object> termInfo = mainService.selectOneShafYyShtm(params);
        
        params.put("SCH_SYEAR",  termInfo.get("SYEAR")); 
        params.put("SCH_TERM_GCD",  termInfo.get("TERM_GCD"));
        
        // 수강신청학점, 수강신청과목수 조회
        Map<String, Object> applyCnt = atlectCancelService.searchLecApplyCrdtCnt(params);
        
        if(applyCnt != null) {
        	// 수강취소학점, 수강취소과목수 조회
            Map<String, Object> cancelCnt = atlectCancelService.searchLecCancelCrdtCnt(params);
            if(cancelCnt != null) {
            	applyCnt.put("CANCEL_CRDT", cancelCnt.get("CANCEL_CRDT"));
            	applyCnt.put("CANCEL_CNT", cancelCnt.get("CANCEL_CNT"));
            } else {
            	applyCnt.put("CANCEL_CRDT", '0');
            	applyCnt.put("CANCEL_CNT", '0');
            }
        } else {
        	applyCnt.put("CRDT", '0');
        	applyCnt.put("APPLY_CNT", '0');
        	applyCnt.put("CANCEL_CRDT", '0');
        	applyCnt.put("CANCEL_CNT", '0');
        }

        view.addObject("data", applyCnt);
        return view;
    }
    
    /**
     * 수강취소 및 환불일정 학사일정을 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/searchCancelSchdChk")
    public ModelAndView searchCancelSchdChk(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        
        // 기준학년도 조회
        //Map<String, Object> termInfo = mainService.selectOneShafYyShtm(params);
        
        //params.put("SCH_SYEAR",  termInfo.get("SYEAR")); 
        //params.put("SCH_TERM_GCD",  termInfo.get("TERM_GCD"));
        
        //System.out.println("paramss:: " + params);
        // 수강취소 학사일정 조회
        Map<String, Object> schdChk = atlectCancelService.searchCancelSchdChk(params);
        
        
        if(schdChk.get("CHK").equals("F")) {
        	schdChk.put("resultYn","N");
        	schdChk.put("msg", "수강취소신청기간이 아닙니다. 조회, 출력만 가능합니다.");
        } else if (schdChk.get("CHK").equals("T")){
        	schdChk.put("resultYn","Y");
        	schdChk.put("msg", "수강취소 기간입니다. 수강취소기간 : " + schdChk.get("SCHD_START_DT") + " ~ " + schdChk.get("SCHD_CLOSE_DT"));
        }
        view.addObject("data", schdChk);
        return view;
    }
    
    /**
     * 수강취소 및 환불일정 학사일정을 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/searchRefundSchdInfo")
    public ModelAndView searchRefundSchdInfo(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        
        // 수강취소 환불일정을 조회한다.
        Map<String, Object> refundSchd = atlectCancelService.searchRefundSchdInfo(params);

        view.addObject("data", refundSchd);
        return view;
    }
    
    /**
     * 수강취소 대상자를 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/searchCancelSubjectChk")
    public ModelAndView searchCancelSubjectChk(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        
        // 수강취소 대상자를 조회한다.
        Map<String, Object> subjectChk = atlectCancelService.searchCancelSubjectChk(params);

        view.addObject("data", subjectChk);
        return view;
    }
    
    /**
     * 수강신청과목 선택을 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/searchCancelSubjectChkList")
    public ModelAndView searchCancelSubjectChkList(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        Map<String, Object> params = (Map<String, Object>) paramMap.get("data");

        List<Map<String, Object>> list = atlectCancelService.searchCancelSubjectChkList(params);

    	view.addObject("data", list);
    	view.addObject("totalCnt", list.size());
    	view.addObject("pageInfo", IUtility.getPageInfo(params, list));
        view.addObject("pageList", IUtility.getPageInfoArr(params));
        return view;
    }
    
    /**
     * 수강취소신청과목을 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/searchCancelSubjectApplyList")
    public ModelAndView searchCancelSubjectApplyList(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        Map<String, Object> params = (Map<String, Object>) paramMap.get("data");

        List<Map<String, Object>> list = atlectCancelService.searchCancelSubjectApplyList(params);

    	view.addObject("data", list);
    	view.addObject("totalCnt", list.size());
        return view;
    }
    
    /**
     * 수강취소 및 환불처리 진행상황을 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/searchCancelRefundProgressList")
    public ModelAndView searchCancelRefundProgressList(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        Map<String, Object> params = (Map<String, Object>) paramMap.get("data");

        List<Map<String, Object>> list = atlectCancelService.searchCancelRefundProgressList(params);

    	view.addObject("data", list);
    	view.addObject("totalCnt", list.size());
        return view;
    }
    
    /**
     * 수강취소 및 환불처리 완료된 과목을 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/searchCancelRefundCompleteList")
    public ModelAndView searchCancelRefundCompleteList(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        Map<String, Object> params = (Map<String, Object>) paramMap.get("data");

        List<Map<String, Object>> list = atlectCancelService.searchCancelRefundCompleteList(params);

    	view.addObject("data", list);
    	view.addObject("totalCnt", list.size());
        return view;
    }
    
    /**
     * 수강신청한 학생의 학생구분코드를 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectStdtGcd")
    public ModelAndView selectStdtGcd(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        Map<String, Object> params = (Map<String, Object>) paramMap.get("data");

        Map<String, Object> stdtGcd = atlectCancelService.selectStdtGcd(params);

        view.addObject("data", stdtGcd);
        return view;
    }
    
    /**
     * 정규학기 수강취소 전 신청가능여부를 체크한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/selectRegularSubjectCancelChk")
    public ModelAndView selectRegularSubjectCancelChk(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        List<Map<String, Object>> list = (List<Map<String, Object>>)paramMap.get("data");

        Map<String, Object> chk = atlectCancelService.selectRegularSubjectCancelChk(list);

        view.addObject("data", chk);
        return view;
    }
    
    /**
     * 정규학기 수강취소신청을 저장한다.
     * 
     * @param paramList
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/saveRegularSubjectCancel")
    public ModelAndView saveRegularSubjectCancel(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        List<Map<String, Object>> list = (List<Map<String, Object>>)paramMap.get("data");
        view.addObject("data", atlectCancelService.saveRegularSubjectCancel(list));
        
        return view;
    }
    
    /**
     * 정규학기 학생 승인확인가능일시를 조회한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/searchApprConfDt")
    public ModelAndView searchApprConfDt(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        
        // 기준학년도 조회 (화면 오픈시 기준학년도학기 값 셋팅을 못함)
        Map<String, Object> termInfo = mainService.selectOneShafYyShtm(params);
        params.put("SCH_SYEAR",  termInfo.get("SYEAR")); 
        params.put("SCH_TERM_GCD",  termInfo.get("TERM_GCD"));

        Map<String, Object> apprConfDt = atlectCancelService.searchApprConfDt(params);

        view.addObject("data", apprConfDt);
        return view;
    }
    
    /**
     * 정규학기 수강취소신청을 삭제한다.
     * 
     * @param paramList
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/saveRegularCancelApplyDelete")
    public ModelAndView saveRegularCancelApplyDelete(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        view.addObject("data", atlectCancelService.saveRegularCancelApplyDelete(params));
        
        return view;
    }
    
    /**
     * 계절학기 수강취소 전 대상자인지 체크한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/searchSeasonCancelSubjectChk")
    public ModelAndView searchSeasonCancelSubjectChk(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        
        // 수강취소 대상자를 조회한다.
        Map<String, Object> subjectChk = atlectCancelService.searchSeasonCancelSubjectChk(params);

        view.addObject("data", subjectChk);
        return view;
    }
    
    /**
     * 계절학기 수강취소 삭제 전 대상자인지 체크한다.
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/searchSeasonCancelSubjectDeleteChk")
    public ModelAndView searchSeasonCancelSubjectDeleteChk(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        
        // 수강취소 대상자를 조회한다.
        Map<String, Object> subjectChk = atlectCancelService.searchSeasonCancelSubjectDeleteChk(params);

        view.addObject("data", subjectChk);
        return view;
    }
    /**
     * 출력전 체크
     * 
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/reportPreChk")
    public ModelAndView reportPreChk(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView view = new ModelAndView();
		view.setViewName("jsonView");

		//Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
		//List list = atlectManualService.selectLativeLangLectGcd(params);

		Map<String, Object> data = (Map<String, Object>) paramMap.get("data");
		String [] params = {
		"SCH_SYEAR",
		"SCH_TERM_GCD",
		"SCH_STDT_NO"
		};
		data.put("params", params);
		data.put("db", "OST");
		data.put("proc", "OST_수강취소_정규학기_대학원취소신청서_출력전체크");
		data.put("resultCnt", 1);

		
		List<Map<String, Object>> list = (List<Map<String, Object>>)comFunctionService.bindProc(data);
		
		view.addObject("data", list);
		return view;
    }
    
    /**
     * 계절학기 수강취소신청을 저장한다.
     * 
     * @param paramList
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/saveSeasonSubjectCancel")
    public ModelAndView saveSeasonSubjectCancel(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        List<Map<String, Object>> list = (List<Map<String, Object>>)paramMap.get("data");

        view.addObject("data", atlectCancelService.saveSeasonSubjectCancel(list));
        
        return view;
    }
    
    /**
     * 계절학기 수강취소신청을 삭제한다.
     * 
     * @param paramList
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping(value = "/saveSeasonCancelApplyDelete")
    public ModelAndView saveSeasonCancelApplyDelete(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView view = new ModelAndView();
        view.setViewName("jsonView");

        Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
        view.addObject("data", atlectCancelService.saveSeasonCancelApplyDelete(params));
        
        return view;
    }
}
