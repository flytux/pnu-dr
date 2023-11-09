package com.onestop.core.function.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections4.ListUtils;
import org.apache.commons.collections4.Predicate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import com.onestop.core.exception.ExecuteException;
import com.onestop.core.file.service.FilesService;
import com.onestop.core.function.dao.ComFunctionDao;
import com.onestop.core.function.service.ComFunctionService;
import com.onestop.core.util.IUtility;
import com.onestop.core.util.ProjectConstant;
import com.onestop.core.util.service.CommonServiceImpl;

/**
 * @Class Name : ComnSys001ServiceImpl.java
 * @Description : 공통코드관리 ServiceImpl Class
 * @Modification Information
 * @since : 2020-02-06
 * @author : 정원빈
 * @version 1.0
 * @see
 *
 *      Copyright (C) by IDINO All rights reserved.
 */
@Service("comFunctionService")
public class ComFunctionServiceImpl extends CommonServiceImpl implements ComFunctionService {

	@Autowired
	MessageSource localeMessageSource;

	@Autowired
	private ComFunctionDao comFunctionDao;
	
	@Autowired
	private FilesService filesService;

	public Map<String, Object> getCode(Map<String, Object> map) throws Exception {

		List<Map<String, Object>> list = comFunctionDao.getCode(map);
		Map<String, Object> data = new HashMap<String, Object>();

		if (list == null)
			list = new ArrayList<Map<String, Object>>();

		String codes = IUtility.parseNull(map.get("CODES"));
		String[] codeArr = codes.split(",");

		for (int i = 0, x = codeArr.length; i < x; i++) {
			String code = IUtility.parseNull(codeArr[i]);
			List<Map<String, Object>> findList = ListUtils.select(list, new Predicate<Map<String, Object>>() {
				@Override
				public boolean evaluate(Map<String, Object> arg0) {
					return code.equals(arg0.get("SYSTEM_GCD") + "_" + arg0.get("COMMON_CD"));
				}
			});
			if (findList != null && findList.size() > 0)
				data.put(code, findList);
		}

		return data;
	}

	/**
	 * 공통코드관리 공통코드 데이터를 조건별 조회한다.
	 * 
	 * @param map
	 * @return List<Map<String, Object>>
	 * @throws Exception
	 */
	public List<Map<String, Object>> getCodeByEtcParam(Map<String, Object> map) throws Exception {
		return comFunctionDao.getCodeByEtcParam(map);
	}

	public List<Map<String, Object>> getEmpUserInfo(Map<String, Object> map) throws Exception {
		return comFunctionDao.getEmpUserInfo(map);
	}

	public List<Map<String, Object>> getAssignComboGradGcdInfo(Map<String, Object> map) throws Exception {
		return comFunctionDao.getAssignComboGradGcdInfo(map);
	}

	public List<Map<String, Object>> getAssignComboCollCdInfo(Map<String, Object> map) throws Exception {
		return comFunctionDao.getAssignComboCollCdInfo(map);
	}

	public List<Map<String, Object>> getAssignComboDeptCdInfo(Map<String, Object> map) throws Exception {
		return comFunctionDao.getAssignComboDeptCdInfo(map);
	}

	public List<Map<String, Object>> getAssignComboMajorCdInfo(Map<String, Object> map) throws Exception {
		return comFunctionDao.getAssignComboMajorCdInfo(map);
	}

	public List<Map<String, Object>> getAssignComboDeptMajorCdInfo(Map<String, Object> map) throws Exception {
		return comFunctionDao.getAssignComboDeptMajorCdInfo(map);
	}

	public List<Map<String, Object>> clauseDetailList(Map<String, Object> map) throws Exception {
		return comFunctionDao.clauseDetailList(map);
	}

	public Map<String, Object> insertAgreeDltInfo(List<Map<String, Object>> list) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		for (int i = 0; i < list.size(); i++) {
			map = comFunctionDao.insertAgreeDltInfo(list.get(i));
		}
		return map;
	}

	public void getNoticePopupInfo(Map<String, Object> map,ModelAndView view) throws Exception {
		List<Map<String, Object>> noticeList = comFunctionDao.getNoticePopupInfo(map);
		
		for (Map<String, Object> map2 : noticeList) {
			map.put("ATTACH_FILE_GRP_CD", map2.get("ATTACH_FILE_GRP_CD"));
			map.put("SESSION_SYSTEM_GCD", "0001");
			map2.put("noticefileList", filesService.selectList(map));
		}
		view.addObject("data", noticeList);
		
	}

	public List<Map<String, Object>> getUserInfo(Map<String, Object> map) throws Exception {
		return comFunctionDao.getUserInfo(map);
	}

	public void infoSearchInsert(Map<String, Object> map) throws Exception {
		comFunctionDao.infoSearchInsert(map);
	}
	
	public Map<String, Object> getSiteInfo(String systemGcd) throws Exception {
        return comFunctionDao.getSiteInfo(systemGcd);
    }
	
	public void insertSystemLog(Map<String, Object> map) throws Exception {
        comFunctionDao.insertSystemLog(map);
    }
	
	public void setPaging(Map<String, Object> map) throws Exception{
		int iPageIndex = IUtility.parseInt(map.get("pageIndex"));
		int iPageSize = IUtility.parseInt(map.get("pageSize"));
		int iSkip = (iPageIndex * iPageSize);

		map.put("FIRSTINDEX", iSkip + 1);
		map.put("LASTINDEX", iSkip + iPageSize);
	}
	
	public Object bindProc(Map<String, Object> map) throws Exception {
        procParamsStr(map);
        Object rtn = null;
        
        if((int) map.get("resultCnt") > 1) {
            rtn = comFunctionDao.bindProc(map, Integer.toString((int) map.get("resultCnt")));
        } else {
            rtn = comFunctionDao.bindProc(map);
            
            List<Map<String, Object>> resultList = (List<Map<String, Object>>)rtn;
            for (Map<String, Object> resultMap : resultList) {
                String systemGcd = IUtility.parseNull(resultMap.get("SYSTEM_GCD"));
                String attachFileGrpCd = IUtility.parseNull(resultMap.get("ATTACH_FILE_GRP_CD"));
                String attachFileGcd =    IUtility.parseNull(resultMap.get("ATTACH_FILE_GCD"));
                String attachFileSeqNo =     IUtility.parseNull(resultMap.get("ATTACH_FILE_SEQ_NO"));
                String paramCode = systemGcd+"^"+attachFileGrpCd+"^"+attachFileGcd+"^"+attachFileSeqNo ;
                if(systemGcd !="" && attachFileGrpCd !="" && attachFileGcd != "" && attachFileSeqNo !="") {
                	resultMap.put("PARAM_CODE", IUtility.getEncStr(paramCode,ProjectConstant.SECURITY_KEY));
                }else {
                	resultMap.put("PARAM_CODE", "");
                }
                
            }
            
            rtn = resultList;
        }
        if(map.get("proc") != null && (((String)map.get("proc")).endsWith("저장") || ((String)map.get("proc")).endsWith("수정"))) {
            if (rtn instanceof List && ((List)rtn).size() == 0) {
                rtn = map;
            }
        }
        return rtn;
    }
	
	public Object bindProcMap(Map<String, Object> map) throws Exception {
        procParamsStr(map);
        Object rtn = null;
        
        if((int) map.get("resultCnt") > 1) {
            rtn = comFunctionDao.bindProcMap(map, Integer.toString((int) map.get("resultCnt")));
        } else {
            rtn = comFunctionDao.bindProcMap(map);
        }
        if(map.get("proc") != null && (((String)map.get("proc")).endsWith("저장") || ((String)map.get("proc")).endsWith("수정") || ((String)map.get("proc")).endsWith("승인"))) {
            if (rtn == null) {
                rtn = map;
            }
        }
        return rtn;
    }

    @Transactional
    public Object bindProcList(List<Map<String, Object>> list) throws Exception {
        Map<String, Object> result = new HashMap();
        int execCnt = 0;
        for (int i = 0; i < list.size(); i++) {
            procParamsStr(list.get(i));
            result = (Map<String, Object>) comFunctionDao.bindProcMap(list.get(i));
            execCnt++;
            if(result != null && result.get("O_RSLT") != null && "N".equals(IUtility.parseNull(result.get("O_RSLT"),""))) {
                throw new ExecuteException((String) result.get("O_MSG"));
            }
        }
        if(result == null) {
            result = new HashMap();
        }
        result.put("O_CNT", execCnt);
        return result;
    }
    
    private void procParamsStr(Map<String, Object> map) throws Exception {
        //List<String> list = (List) map.get("params");
        String [] list = (String[]) map.get("params");
        String params = "";
        
        if (list != null && list.length > 0) {
            for (String str : list) {
            	if("".equals(IUtility.parseNull(map.get(str)))) {
                    params += (("".equals(params)) ? "" : ",") + "null";
                } else {
                    params += (("".equals(params)) ? "" : ",") + "'" + (IUtility.parseNull(map.get(str))).replaceAll("'", "''''") + "'";
                }
            }
        }
        map.put("params", params);
    }
}
