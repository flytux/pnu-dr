package com.onestop.core.file.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.onestop.core.file.dao.FilesDao;
import com.onestop.core.file.service.FilesService;
import com.onestop.core.util.IUtility;
import com.onestop.core.util.ProjectConstant;
import com.onestop.core.util.service.CommonServiceImpl;

/**
 * <pre>
 * Class Name: FilesServiceImpl.java
 * Description: 첨부파일 업로드를 위한 service클래스
 * </pre>
 * 
 * @author 서혁성
 * @since 2021. 8. 2.
 * @version 1.0
 * @see
 *
 * Copyright (C) by IDINO All rights reserved.
 */
@Service("filesService")
public class FilesServiceImpl extends CommonServiceImpl implements FilesService{

    @Autowired
    MessageSource localeMessageSource;

    @Autowired
    private FilesDao filesDao;

    @Override
    @Transactional
    public void saveAttachFileInfo(Map<String, Object> map) throws Exception {
    	if(!"".equals(IUtility.parseNull(map.get("SYSTEM_GCD"))) && !(IUtility.parseNull(map.get("SESSION_SYSTEM_GCD"))).equals(IUtility.parseNull(map.get("SYSTEM_GCD")))) {
        	map.put("SESSION_SYSTEM_GCD", map.get("SYSTEM_GCD"));
        }
        List list = (List) map.get("files");
        map.remove("files");
        if(list != null && list.size() > 0) {
            for(int idx = 0 ; idx < list.size(); idx++) {
                Map map2 = (Map)list.get(idx);
                map2.putAll(map);

                map2.put("ATTACH_FILE_GRP_CD", ((String)map2.get("key")).split("\\^")[0]);
                map2.put("ATTACH_FILE_GCD", ((String)map2.get("key")).split("\\^")[1]);
                map2.put("ORIGIN_FILE_NM", ((String)map2.get("localFile")).split("\\^")[0]);
                map2.put("ATTACH_FILE_NM", ((String)map2.get("file")).split("\\^")[1] );
                map2.put("FILE_EXTENSION_CONTENT", ((String)map2.get("localFile")).split("\\^")[1]);
                map2.put("ATTACH_FILE_SENIOR_CONTENT", ((String)map2.get("file")).split("\\^")[0] );
                map2.put("FILE_SIZE", map2.get("size"));
                
                filesDao.saveAttachFileInfo(map2);
            }
        }
    }

    public List<Map<String, Object>> selectList(Map<String, Object> map) throws Exception {
        map.put("ATTACH_FILE_SEQ_NO", 0);
        if(!"".equals(IUtility.parseNull(map.get("SYSTEM_GCD"))) && !(IUtility.parseNull(map.get("SESSION_SYSTEM_GCD"))).equals(IUtility.parseNull(map.get("SYSTEM_GCD")))) {
        	map.put("SESSION_SYSTEM_GCD", map.get("SYSTEM_GCD"));
        }
        List<Map<String, Object>> resultList = filesDao.selectList(map);
        for (Map<String, Object> map2 : resultList) {
        	String systemGcd = IUtility.parseNull(map2.get("SYSTEM_GCD"));
            String attachFileGrpCd = IUtility.parseNull(map2.get("ATTACH_FILE_GRP_CD"));
            String attachFileGcd =    IUtility.parseNull(map2.get("ATTACH_FILE_GCD"));
            String attachFileSeqNo =     IUtility.parseNull(map2.get("ATTACH_FILE_SEQ_NO"));
            String paramCode = systemGcd+"^"+attachFileGrpCd+"^"+attachFileGcd+"^"+attachFileSeqNo+"^"+IUtility.parseNull(map.get("SESSION_MENU_CD"),".") ;
            map2.put("PARAM_CODE", IUtility.getEncStr(paramCode,ProjectConstant.SECURITY_KEY));  
		}
        return resultList;
    }
    
    public List<Map<String, Object>> selectDetail(Map<String, Object> map) throws Exception {
        return filesDao.selectList(map);
    }
    
    public void deleteAttachFileInfo(Map<String, Object> map) throws Exception {
        filesDao.deleteAttachFileInfo(map);
    }
    
    public void fileTransComplete(Map<String, Object> map) throws Exception {
    	
    	List<String> fileList = (List<String>)map.get("file_list");
    	if(fileList != null ) {
	    	for (String fileInfo : fileList) {
	    		
	    		String[] fileArr = fileInfo.split("\\^");
	    		
	    		String attachFileSeqNo = fileInfo.split("\\^")[0];
	    		String fileTagContent = "";
	    		if(fileArr.length ==2) fileTagContent = fileInfo.split("\\^")[1];
	    		Map<String, Object> map2 = new HashMap<String, Object>();
	    		map2.put("SESSION_SYSTEM_GCD", map.get("SESSION_SYSTEM_GCD"));
	    		map2.put("SESSION_MENU_CD", map.get("SESSION_MENU_CD"));
	    		map2.put("ATTACH_FILE_GRP_CD", map.get("ATTACH_FILE_GRP_CD"));
	    		map2.put("ATTACH_FILE_SEQ_NO", attachFileSeqNo);
	    		map2.put("FILE_TAG_CONTENT", fileTagContent);
	    		map2.put("SESSION_USER_ID", map.get("SESSION_USER_ID"));
	    		map2.put("SESSION_USER_IP", map.get("SESSION_USER_IP"));
	
	    		filesDao.saveAttachFileContentInfo(map2);
			}
    	}
        filesDao.fileTransComplete(map);
    }
    
    public void fileInfoDelete(Map<String, Object> map) throws Exception {
        filesDao.fileInfoDelete(map);
    }
    
    public void saveAttachFileInfoCKEDITOR(Map<String, Object> map) throws Exception {
        filesDao.saveAttachFileInfo(map);
    }
}
