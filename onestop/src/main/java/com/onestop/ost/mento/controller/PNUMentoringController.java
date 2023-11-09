package com.onestop.ost.mento.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/ost/pnuMentoring/mentoring")
public class PNUMentoringController {
    /*
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="pnuMentoringService")
    private PNUMentoringService pnuMentoringService;
	
	@RequestMapping(value="mentoringInfoChk", method = RequestMethod.POST) //통합과제_교육연구학생지도_멘토링_학생지원시스템_대상여부체크
	public @ResponseBody Object getJSON1(
			@RequestParam("STDT_CD") String stdt_cd,
			Map<String, Object> commandMap) throws Exception {
		HashMap<String, Object> hmJson = new HashMap<String, Object>();
		
		commandMap.put("STDT_CD", stdt_cd);
        List<List<Map<String, Object>>> list = pnuMentoringService.InfoChk(commandMap);
        
        hmJson.put("dataset1", list);
        
        if (log.isInfoEnabled()) {
        	log.info("list : " + list.size());
        	log.info("list tostring : " + list.toString());
        	log.info("hmJson : tostring : " + hmJson.toString());
		}
        
        return hmJson;
    }
	
	@RequestMapping(value="mentoringSearch", method = RequestMethod.POST) //통합과제_교육연구학생지도_멘토링_학생지원시스템_분류목록
	public @ResponseBody Object getJSON2(
			Map<String, Object> commandMap) throws Exception {
		LinkedHashMap<String, Object> hmJson = new LinkedHashMap<String, Object>();
        
        List<List<Map<String, Object>>> list = pnuMentoringService.ProgramList(commandMap);
               
        hmJson.put("dataset1", list);
                 
                 
        return hmJson;
    }
	
	@RequestMapping(value="mentoringDetailSearch", method = RequestMethod.POST) //통합과제_교육연구학생지도_멘토링_학생지원시스템_분류별멘토목록
	public @ResponseBody Object getJSON3(
			@RequestParam("YEAR") String year,
			@RequestParam("TERM_CD") String term,
			@RequestParam("ITEM_CD") String item,
			Map<String, Object> commandMap) throws Exception {
		LinkedHashMap<String, Object> hmJson = new LinkedHashMap<String, Object>();
    	
    	commandMap.put("YEAR", year);
    	commandMap.put("TERM_CD", term);
    	commandMap.put("ITEM_CD", item);
        
        List<List<Map<String, Object>>> list = pnuMentoringService.ProgramListDetail(commandMap);
               
        hmJson.put("dataset1", list);
                 
                 
        return hmJson;
    }
	
	@RequestMapping(value="applySearch", method = RequestMethod.POST) //통합과제_교육연구학생지도_멘토링_학생지원시스템_멘토신청_조회
	public @ResponseBody Object getJSON4(
			@RequestParam("YEAR") String year,
			@RequestParam("TERM_CD") String term,
			@RequestParam("PROJ_CD") String proj_cd,
			@RequestParam("STDT_CD") String stdt_cd,
			Map<String, Object> commandMap) throws Exception {
		LinkedHashMap<String, Object> hmJson = new LinkedHashMap<String, Object>();
    	
    	commandMap.put("YEAR", year);
    	commandMap.put("TERM_CD", term);
    	commandMap.put("PROJ_CD", proj_cd);
    	commandMap.put("STDT_CD", stdt_cd);
        
        List<List<Map<String, Object>>> list = pnuMentoringService.ApplySearch(commandMap);
               
        hmJson.put("dataset1", list);
                 
                 
        return hmJson;
    }
	
	@RequestMapping(value="applyInsert", method = RequestMethod.POST) //통합과제_교육연구학생지도_멘토링_학생지원시스템_멘토신청_입력
	public @ResponseBody Object getJSON5(
			@RequestParam("YEAR") String year,
			@RequestParam("TERM_CD") String term,
			@RequestParam("PROJ_CD") String proj_cd,
			@RequestParam("STDT_CD") String stdt_cd,
			@RequestParam("IP") String ip,
			Map<String, Object> commandMap) throws Exception {
		LinkedHashMap<String, Object> hmJson = new LinkedHashMap<String, Object>();
    	
    	commandMap.put("YEAR", year);
    	commandMap.put("TERM_CD", term);
    	commandMap.put("PROJ_CD", proj_cd);
    	commandMap.put("STDT_CD", stdt_cd);
    	commandMap.put("IP", ip);
        
        List<List<Map<String, Object>>> list = pnuMentoringService.ApplyInsert(commandMap);
               
        hmJson.put("dataset1", list);
                 
                 
        return hmJson;
    }
	
	@RequestMapping(value="applyDelete", method = RequestMethod.POST) //통합과제_교육연구학생지도_멘토링_학생지원시스템_멘토신청_삭제
	public @ResponseBody Object getJSON6(
			@RequestParam("YEAR") String year,
			@RequestParam("TERM_CD") String term,
			@RequestParam("PROJ_CD") String proj_cd,
			@RequestParam("STDT_CD") String stdt_cd,
			@RequestParam("IP") String ip,
			Map<String, Object> commandMap) throws Exception {
		LinkedHashMap<String, Object> hmJson = new LinkedHashMap<String, Object>();
    	
    	commandMap.put("YEAR", year);
    	commandMap.put("TERM_CD", term);
    	commandMap.put("PROJ_CD", proj_cd);
    	commandMap.put("STDT_CD", stdt_cd);
    	commandMap.put("IP", ip);
        
        List<List<Map<String, Object>>> list = pnuMentoringService.ApplyDelete(commandMap);
               
        hmJson.put("dataset1", list);
                 
                 
        return hmJson;
    }
	
	@RequestMapping(value="mentoringInfoChkForeign", method = RequestMethod.POST) //통합과제_교육연구학생지도_멘토링외국인_학생지원시스템_대상여부체크
	public @ResponseBody Object getJSON7(
			@RequestParam("STDT_CD") String stdt_cd,
			Map<String, Object> commandMap) throws Exception {
		LinkedHashMap<String, Object> hmJson = new LinkedHashMap<String, Object>();
		
		commandMap.put("STDT_CD", stdt_cd);
        
        List<List<Map<String, Object>>> list = pnuMentoringService.InfoChkForeign(commandMap);
        
        hmJson.put("dataset1", list);
                 
                 
        return hmJson;
    }
	
	@RequestMapping(value="mentoringSearchForeign", method = RequestMethod.POST) //통합과제_교육연구학생지도_멘토링외국인_학생지원시스템_분류목록
	public @ResponseBody Object getJSON8(
			Map<String, Object> commandMap) throws Exception {
		LinkedHashMap<String, Object> hmJson = new LinkedHashMap<String, Object>();
        
        List<List<Map<String, Object>>> list = pnuMentoringService.ProgramListForeign(commandMap);
               
        hmJson.put("dataset1", list);
                 
                 
        return hmJson;
    }
	
	@RequestMapping(value="mentoringDetailSearchForeign", method = RequestMethod.POST) //통합과제_교육연구학생지도_멘토링외국인_학생지원시스템_분류별멘토목록
	public @ResponseBody Object getJSON9(
			@RequestParam("YEAR") String year,
			@RequestParam("TERM_CD") String term,
			@RequestParam("ITEM_CD") String item,
			Map<String, Object> commandMap) throws Exception {
		LinkedHashMap<String, Object> hmJson = new LinkedHashMap<String, Object>();
    	
    	commandMap.put("YEAR", year);
    	commandMap.put("TERM_CD", term);
    	commandMap.put("ITEM_CD", item);
        
        List<List<Map<String, Object>>> list = pnuMentoringService.ProgramListDetailForeign(commandMap);
               
        hmJson.put("dataset1", list);
                 
                 
        return hmJson;
    }
	
	@RequestMapping(value="applySearchForeign", method = RequestMethod.POST) //통합과제_교육연구학생지도_멘토링외국인_학생지원시스템_멘토신청_조회
	public @ResponseBody Object getJSON10(
			@RequestParam("YEAR") String year,
			@RequestParam("TERM_CD") String term,
			@RequestParam("PROJ_CD") String proj_cd,
			@RequestParam("STDT_CD") String stdt_cd,
			Map<String, Object> commandMap) throws Exception {
		LinkedHashMap<String, Object> hmJson = new LinkedHashMap<String, Object>();
    	
    	commandMap.put("YEAR", year);
    	commandMap.put("TERM_CD", term);
    	commandMap.put("PROJ_CD", proj_cd);
    	commandMap.put("STDT_CD", stdt_cd);
        
        List<List<Map<String, Object>>> list = pnuMentoringService.ApplySearchForeign(commandMap);
               
        hmJson.put("dataset1", list);
                 
                 
        return hmJson;
    }
	
	@RequestMapping(value="applyInsertForeign", method = RequestMethod.POST) //통합과제_교육연구학생지도_멘토링외국인_학생지원시스템_멘토신청_입력
	public @ResponseBody Object getJSON11(
			@RequestParam("YEAR") String year,
			@RequestParam("TERM_CD") String term,
			@RequestParam("PROJ_CD") String proj_cd,
			@RequestParam("STDT_CD") String stdt_cd,
			@RequestParam("IP") String ip,
			Map<String, Object> commandMap) throws Exception {
		LinkedHashMap<String, Object> hmJson = new LinkedHashMap<String, Object>();
    	
    	commandMap.put("YEAR", year);
    	commandMap.put("TERM_CD", term);
    	commandMap.put("PROJ_CD", proj_cd);
    	commandMap.put("STDT_CD", stdt_cd);
    	commandMap.put("IP", ip);
        
        List<List<Map<String, Object>>> list = pnuMentoringService.ApplyInsertForeign(commandMap);
               
        hmJson.put("dataset1", list);
                 
                 
        return hmJson;
    }
	
	@RequestMapping(value="applyDeleteForeign", method = RequestMethod.POST) //통합과제_교육연구학생지도_멘토링외국인_학생지원시스템_멘토신청_삭제
	public @ResponseBody Object getJSON12(
			@RequestParam("YEAR") String year,
			@RequestParam("TERM_CD") String term,
			@RequestParam("PROJ_CD") String proj_cd,
			@RequestParam("STDT_CD") String stdt_cd,
			@RequestParam("IP") String ip,
			Map<String, Object> commandMap) throws Exception {
		LinkedHashMap<String, Object> hmJson = new LinkedHashMap<String, Object>();
    	
    	commandMap.put("YEAR", year);
    	commandMap.put("TERM_CD", term);
    	commandMap.put("PROJ_CD", proj_cd);
    	commandMap.put("STDT_CD", stdt_cd);
    	commandMap.put("IP", ip);
        
        List<List<Map<String, Object>>> list = pnuMentoringService.ApplyDeleteForeign(commandMap);
               
        hmJson.put("dataset1", list);
                 
                 
        return hmJson;
    }
    */
}