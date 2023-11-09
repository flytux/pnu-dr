package com.onestop.core.file.controller;


import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.onestop.core.file.service.StdtPhotoService;
import com.onestop.core.security.user.CustomUserDetail;
import com.onestop.core.util.Function;
import com.onestop.core.util.IUtility;
import com.onestop.core.util.controller.CommonController;
import com.onestop.ost.bus.service.BusApplyService;

@RestController
@RequestMapping("/file/photo")
public class StdtPhotoController extends CommonController{
	
	private final Logger LOGGER = LoggerFactory.getLogger(getClass().getName());
	
    @Autowired
    private StdtPhotoService stdtPhotoService;
    
    @Autowired
    private BusApplyService busApplyService;
    
    @Autowired
    ServletContext context;
    
    /**
    * 학생사진 사진 저장을 한다.
    * @param paramMap
    * @param request
    * @param response
    * @return Map<String, Object>
    * @throws Exception
    */    
    @RequestMapping("/saveStdtPhoto")    
    public void saveStdtPhoto(@RequestParam HashMap<String, Object> reqParam, MultipartHttpServletRequest request, HttpServletResponse response) throws Exception {
        
        response.setContentType("text/html;charset=UTF-8");       
        
        String strStdtNo = Function.parseNull(reqParam.get("STDT_NO"));
        
        PrintWriter out = response.getWriter();
        reqParam.put("STDT_NO",            strStdtNo );
        reqParam.put("SESSION_MENU_CD",    Function.parseNull(reqParam.get("SESSION_MENU_CD")) );
        reqParam.put("SESSION_USER_ID",    Function.parseNull(reqParam.get("SESSION_USER_ID")) );
        reqParam.put("SESSION_USER_IP",    Function.parseNull(reqParam.get("SESSION_USER_IP")) );   
        reqParam.put("SESSION_SYSTEM_GCD", Function.parseNull(reqParam.get("SESSION_SYSTEM_GCD")) );
        
        String callbackFn    =  reqParam.get("callbackFunction")==null?"":(String)reqParam.get("callbackFunction");
        
        try {

            Iterator<String> fileNames = request.getFileNames();
            while(fileNames.hasNext()) {
                String fileName = fileNames.next();
                List<MultipartFile> files = request.getFiles(fileName);
                
                for (MultipartFile file : files) {
                    if(file != null) {
                        reqParam.put("PIC", file.getBytes());
                        reqParam.put("SCH_GUBUN", "STDT_NO");
                        reqParam.put("SCH_ADMS_YEAR", "");                        
                    }            
                    stdtPhotoService.saveStdtPhoto(reqParam);  
                }
            }
            out.print("<script>window.onload = doInit;function doInit() {parent." + callbackFn + "('<ret><STDT_NO>" + strStdtNo  + "</STDT_NO><O_RSLT>Y</O_RSLT><O_MSG></O_MSG></ret>');}</script>");
          
        }catch(Exception ex) {            
            out.print("<script>window.onload = doInit;function doInit() {parent." + callbackFn + "('<ret><O_RSLT>N</O_RSLT><O_MSG>" + ex.getMessage() + "</O_MSG></ret>');}</script>");
        }       
    }
    
    /**
     * 통학버스 이용신청 학생의 사진을 저장한다.
     * @param paramMap
     * @param request
     * @param response
     * @return Map<String, Object>
     * @throws Exception
     */
    @RequestMapping("busapplySaveStdtPhoto")    
    public Map<String, Object> busapplySaveStdtPhoto(@RequestParam HashMap<String, Object> reqParam, MultipartHttpServletRequest request, HttpServletResponse response) throws Exception {
        
        
        CustomUserDetail userInfo = (CustomUserDetail)IUtility.getLoginInfo();
        
        
        //String strStdtNo = Function.parseNull(reqParam.get("STDT_NO"));
        
        reqParam.put("STDT_NO",            userInfo.getUserId() );
        reqParam.put("SESSION_MENU_CD",    Function.parseNull(reqParam.get("MENU_CD")) );
        reqParam.put("SESSION_USER_ID",    userInfo.getUserId() );
        reqParam.put("SESSION_USER_IP",    userInfo.getUserIp() );   
        reqParam.put("SESSION_SYSTEM_GCD", Function.parseNull(reqParam.get("SYSTEM_GCD")) );
        
        Map<String, Object> result = new HashMap<String, Object>();
        try {

            Iterator<String> fileNames = request.getFileNames();
            while(fileNames.hasNext()) {
                String fileName = fileNames.next();
                List<MultipartFile> files = request.getFiles(fileName);
                
                for (MultipartFile file : files) {
                    if(file != null) {
                        reqParam.put("PIC", file.getBytes());
                        reqParam.put("SCH_GUBUN", "STDT_NO");
                        reqParam.put("SCH_ADMS_YEAR", "");                        
                    }            
                    busApplyService.saveStdtPhoto(reqParam);  
                }
            }
            result.put("result", "ok");
            return result;
        }catch(Exception ex) {            
        	result.put("result", "fail");
            return result;
        }      
    }
    
    /**
    * 학생사진 사진 저장을 한다.
    * @param paramMap
    * @param request
    * @param response
    * @return Map<String, Object>
    * @throws Exception
    */    
    @RequestMapping("/saveMultiStdtPhoto")    
    public void saveMultiStdtPhoto(MultipartHttpServletRequest request, HttpServletResponse response) throws Exception {
        
        Map<String, Object> parameter = new HashMap<String, Object>();
        
        Enumeration<String> paramNames = request.getParameterNames();
        
        while(paramNames.hasMoreElements()) {
            String key = paramNames.nextElement();
            parameter.put(key, request.getParameter(key));
        }
        
        String schGubun = Function.parseNull(parameter.get("SCH_GUBUN"));
        String schAmdsYear = Function.parseNull(parameter.get("SCH_ADMS_YEAR"));
        String callbackFn =  Function.parseNull(parameter.get("callbackFunction"));
        
        List resultArray = new ArrayList();
        Map<String, Object> params = new HashMap<String, Object>();
        try {

            Iterator<String> fileNames = request.getFileNames();
            while(fileNames.hasNext()) {
                String fileName = fileNames.next();
                List<MultipartFile> files = request.getFiles(fileName);
                
                for (MultipartFile file : files) {
                    if(file != null) {
                        parameter.put("STDT_NO", Function.removeExt(file.getOriginalFilename()));
                        parameter.put("PIC", file.getBytes());
                        parameter.put("SCH_GUBUN", schGubun);
                        parameter.put("SCH_ADMS_YEAR", schAmdsYear);
                        parameter.put("SESSION_MENU_CD",    Function.parseNull(parameter.get("SESSION_MENU_CD")) );
                        parameter.put("SESSION_USER_ID",    Function.parseNull(parameter.get("SESSION_USER_ID")) );
                        parameter.put("SESSION_USER_IP",    Function.parseNull(parameter.get("SESSION_USER_IP")) );   
                        parameter.put("SESSION_SYSTEM_GCD", Function.parseNull(parameter.get("SESSION_SYSTEM_GCD")) );
                    }
                    
                    stdtPhotoService.saveStdtPhoto(parameter);

                    params.put("STDT_NO", Function.removeExt(file.getOriginalFilename()));
                    resultArray.add(params);

                }
            }
          
        }catch(Exception e) {            
        	LOGGER.error(e.getMessage());
        }       
        
        StringBuilder rtnStr = new StringBuilder();
        
        rtnStr.append("<script>");
        rtnStr.append("debugger;window.onload = doInit; function doInit() {debugger; parent.");
        rtnStr.append(callbackFn);
        rtnStr.append("(\"");
        rtnStr.append("<ret>");
        
        if(resultArray != null && resultArray.size() > 0) {
            Map result = (Map)resultArray.get(0);

            rtnStr.append("<key>"); 
            rtnStr.append(Function.parseNull(result.get("STDT_NO")));
            rtnStr.append("</key>");
            rtnStr.append("<storedFileList></storedFileList>");
            rtnStr.append("<localfileList></localfileList>");
            rtnStr.append("<fileSizeList></fileSizeList>");
            rtnStr.append("<maxUploadSize></maxUploadSize>");
            rtnStr.append("<deniedList></deniedList>");
            rtnStr.append("<deniedCodeList></deniedCodeList>");
            rtnStr.append("<message></message>");            
        } else {
            rtnStr.append("<key></key>");
            rtnStr.append("<storedFileList></storedFileList>");
            rtnStr.append("<localfileList></localfileList>");
            rtnStr.append("<fileSizeList></fileSizeList>");
            rtnStr.append("<maxUploadSize></maxUploadSize>");
            rtnStr.append("<deniedList></deniedList>");
            rtnStr.append("<deniedCodeList>999:</deniedCodeList>");
            rtnStr.append("<message>파일업로드가 정상적으로 실행 되지 않았습니다.</message>");
        }
        rtnStr.append("</ret>");
        rtnStr.append("\");}");
        rtnStr.append("</script>");
        
        HttpServletResponseWrapper wrapper = new HttpServletResponseWrapper(response);
        wrapper.setContentType("text/html;charset=UTF-8");
        
        response.getWriter().print(rtnStr);
        
    }         
}
