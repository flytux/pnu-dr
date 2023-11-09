package com.onestop.ost.cls.atlectcancel.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.NoTransactionException;
import org.springframework.transaction.annotation.Transactional;

import com.onestop.core.exception.ExecuteException;
import com.onestop.core.util.service.CommonServiceImpl;
import com.onestop.ost.cls.atlectcancel.dao.AtlectCancelDao;
import com.onestop.ost.cls.atlectcancel.service.AtlectCancelService;

/**
 * <pre>
 * Class Name: AtlectSearchServiceImpl.java
 * Description: 수강확인 ServiceImpl
 * </pre>
 * 
 * @author 김수민
 * @since 2022. 02. 23.
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@Service("atlectCancelService")
public class AtlectCancelServiceImpl extends CommonServiceImpl implements AtlectCancelService {
    @Autowired
    MessageSource localeMessageSource;

    @Autowired
    private AtlectCancelDao atlectCancelDao;
    
    /**
     * 기준학년도,학기, 학사학위추득 유예여부를 조회한다.
     * 
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    public Map<String, Object> searchCurcStdtYear(Map<String, Object> param) throws Exception {
        return atlectCancelDao.searchCurcStdtYear(param);
    }
    
    /**
     * 수강신청학점, 수강신청과목수를 조회한다.
     * 
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    public Map<String, Object> searchLecApplyCrdtCnt(Map<String, Object> param) throws Exception {
        return atlectCancelDao.searchLecApplyCrdtCnt(param);
    }
    
    /**
     * 수강취소학점, 수강취소과목수를 조회한다.
     * 
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    public Map<String, Object> searchLecCancelCrdtCnt(Map<String, Object> param) throws Exception {
        return atlectCancelDao.searchLecCancelCrdtCnt(param);
    }
    
    /**
     * 수강취소 및 환불일정 학사일정을 조회한다.
     * 
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    public Map<String, Object> searchCancelSchdChk(Map<String, Object> param) throws Exception {
    	String termGcd = (String) param.get("SCH_TERM_GCD");

    	if(termGcd.equals("0010") || termGcd.equals("0020")) {
    		return atlectCancelDao.searchCancelSchdChk(param);
    	} else {
    		return atlectCancelDao.searchCancelSeaSchdChk(param);
    	}
    }
    
    /**
     * 수강취소 환불일정을 조회한다.
     * 
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    public Map<String, Object> searchRefundSchdInfo(Map<String, Object> param) throws Exception {
        return atlectCancelDao.searchRefundSchdInfo(param);
    }
    
    /**
     * 수강취소 대상자를 조회한다.
     * 
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    public Map<String, Object> searchCancelSubjectChk(Map<String, Object> param) throws Exception {
        return atlectCancelDao.searchCancelSubjectChk(param);
    }
    
    /**
     * 수강신청과목 선택을 조회한다. 관련된 정보를 DAO에서 호출하여 Controller에 List로 전달한다.
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> searchCancelSubjectChkList(Map<String, Object> param) throws Exception {
    	String termGcd = (String) param.get("SCH_TERM_GCD");

    	if(termGcd.equals("0010") || termGcd.equals("0020")) {
    		return atlectCancelDao.searchCancelSubjectChkRegularList(param);
    	} else {
    		return atlectCancelDao.searchCancelSubjectChkSeasonList(param);
    	}
    }
    
    /**
     * 수강취소신청과목을 조회한다. 관련된 정보를 DAO에서 호출하여 Controller에 List로 전달한다.
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> searchCancelSubjectApplyList(Map<String, Object> param) throws Exception {
    	String termGcd = (String) param.get("SCH_TERM_GCD");

    	if(termGcd.equals("0010") || termGcd.equals("0020")) {
    		return atlectCancelDao.searchCancelRefundProgressRegularList(param);
    	} else {
    		return atlectCancelDao.searchCancelSubjectApplySeasonList(param);
    	}
    }
    
    /**
     * 수강취소 및 환불처리 진행상황을 조회한다.관련된 정보를 DAO에서 호출하여 Controller에 List로 전달한다.
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> searchCancelRefundProgressList(Map<String, Object> param) throws Exception {
    	String termGcd = (String) param.get("SCH_TERM_GCD");
    	
    	if(termGcd.equals("0010") || termGcd.equals("0020")) {
    		return atlectCancelDao.searchCancelRefundProgressRegularList(param);
    	} else {
    		return atlectCancelDao.searchCancelRefundProgressSeasonList(param);
    	}
    }
    
    /**
     * 수강취소 및 환불처리 완료된 과목을 조회한다. 관련된 정보를 DAO에서 호출하여 Controller에 List로 전달한다.
     * 
     * @param param
     * @return List<Map<String, Object>>
     * @throws Exception
     */
    @Override
    public List<Map<String, Object>> searchCancelRefundCompleteList(Map<String, Object> param) throws Exception {
		return atlectCancelDao.searchCancelRefundCompleteList(param);
    }
    
    /**
     * 수강신청한 학생의 학생구분코드를 조회한다.
     * 
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    public Map<String, Object> selectStdtGcd(Map<String, Object> param) throws Exception {
        return atlectCancelDao.selectStdtGcd(param);
    }
    
    /**
     * 정규학기 수강취소 전 신청가능여부를 체크한다.
     * 
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    public Map<String, Object> selectRegularSubjectCancelChk(List<Map<String, Object>> list) throws Exception {
    	
    	Map<String, Object> data = null;
    	Map<String, Object> chk = null;
    	
    	for(int i=0; i<list.size(); i++) {
    		data = list.get(i);
    		chk = atlectCancelDao.selectRegularSubjectCancelChk(data);
    		
    		if(chk.get("O_RSLT").equals("E")) {
    			return chk;
    		}
    	}
    	
    	chk.put("O_RSLT", "OK");
    	chk.put("O_MSG", "");
        return chk;
    }
    
    /**
     * 정규학기 수강취소신청을 저장한다.
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    @Transactional
    public Map<String, Object> saveRegularSubjectCancel(List<Map<String, Object>> list) throws Exception {

        Map<String, Object> map = null;
        Map<String, Object> saveRslt = null;
        Map<String, Object> param = new HashMap<String, Object>();
        
        if(list.size() <= 0) {
        	param.put("msg", "저장 데이터가 없습니다.");
        	return param;
        } else {
    		for(int i=0; i<list.size(); i++){ 
				map = list.get(i);
        		saveRslt = atlectCancelDao.saveRegularSubjectCancel(map); 
        		if(saveRslt.get("O_RSLT").equals("E")) {
        			throw new ExecuteException((String) saveRslt.get("O_MSG"));
        		}
    		}
        	param.put("O_RSLT", "I");
        	param.put("STDT_GCD", list.get(0).get("STDT_GCD"));
        	param.put("O_MSG", "수강취소신청이 완료되었습니다.");
        	
            return param;
        }
    }
    
    /**
     * 정규학기 학생 승인확인가능일시를 조회한다.
     * 
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    public Map<String, Object> searchApprConfDt(Map<String, Object> param) throws Exception {
        return atlectCancelDao.searchApprConfDt(param);
    }
    
    /**
     * 정규학기 수강취소신청을 삭제한다.
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    @Transactional
    public Map<String, Object> saveRegularCancelApplyDelete(Map<String, Object> param) throws Exception {
    	Map<String, Object> saveRslt = null;
    	
		try {
			saveRslt = atlectCancelDao.saveRegularCancelApplyDelete(param); 
    		if(saveRslt.get("O_RSLT").equals("W")) {
    			throw new ExecuteException((String) saveRslt.get("O_MSG"));
    		}
		} catch (NoTransactionException ntex) {
    		return saveRslt;
    	}

        return saveRslt;
    }
    
    /**
     * 계절학기 수강취소 전 대상자인지 체크한다.
     * 
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    public Map<String, Object> searchSeasonCancelSubjectChk(Map<String, Object> param) throws Exception {
        return atlectCancelDao.searchSeasonCancelSubjectChk(param);
    }
    
    /**
     * 계절학기 수강취소 삭제 전 대상자인지 체크한다.
     * 
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    public Map<String, Object> searchSeasonCancelSubjectDeleteChk(Map<String, Object> param) throws Exception {
        return atlectCancelDao.searchSeasonCancelSubjectDeleteChk(param);
    }
    
    /**
     * 계절학기 수강취소신청을 저장한다.
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    @Transactional
    public Map<String, Object> saveSeasonSubjectCancel(List<Map<String, Object>> list) throws Exception {

        Map<String, Object> map = null;
        Map<String, Object> saveRslt = null;
        Map<String, Object> param = new HashMap<String, Object>();
        
        if(list.size() <= 0) {
        	param.put("msg", "저장 데이터가 없습니다.");
        	return param;
        } else {
    		for(int i=0; i<list.size(); i++){ 
    			try {
    				map = list.get(i);
            		saveRslt = atlectCancelDao.saveSeasonSubjectCancel(map); 
            		if(saveRslt.get("O_RSLT").equals("W")) {
            			throw new ExecuteException((String) saveRslt.get("O_MSG"));
            		}
    			} catch (NoTransactionException ntex) {
            		return saveRslt;
            	}
    		}
        	param.put("O_RSLT", "I");
        	param.put("O_MSG", "수강취소신청이 완료되었습니다.");
        	
            return param;
        }
    }
    
    /**
     * 계절학기 수강취소신청을 삭제한다.
     * @param param
     * @return Map<String, Object>
     * @throws Exception
     */
    @Override
    @Transactional
    public Map<String, Object> saveSeasonCancelApplyDelete(Map<String, Object> param) throws Exception {
    	Map<String, Object> saveRslt = null;
    	
		try {
			saveRslt = atlectCancelDao.saveSeasonCancelApplyDelete(param); 
    		if(saveRslt.get("O_RSLT").equals("W")) {
    			throw new ExecuteException((String) saveRslt.get("O_MSG"));
    		}
		} catch (NoTransactionException ntex) {
    		return saveRslt;
    	}

        return saveRslt;
    }
}
