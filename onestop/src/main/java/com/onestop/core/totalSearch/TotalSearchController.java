package com.onestop.core.totalSearch;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;

import org.springframework.http.client.BufferingClientHttpRequestFactory;
import org.springframework.http.client.ClientHttpRequestInterceptor;
import org.springframework.http.client.SimpleClientHttpRequestFactory;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.xml.Jaxb2RootElementHttpMessageConverter;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.ibm.icu.text.SimpleDateFormat;
import com.onestop.core.main.service.MainService;
import com.onestop.core.resolver.ParamMap;
import com.onestop.core.security.user.CustomUserDetail;
import com.onestop.core.util.IUtility;
import com.onestop.core.util.controller.CommonController;


@RestController
@RequestMapping("/TotalSearch")
public class TotalSearchController extends CommonController {

	//@Value("${TotalSearch.url}")
	//private String totalsearchUrl;


	//@Value("${TotalSearch.rankingword.url}")
	//private String TOTALSEARCH_RANKINGWORD_URL;

	@Resource(name = "mainService")
	private MainService mainService;

	@RequestMapping(value="search")
	public ModelAndView totalSearch( ParamMap paramMap,ModelMap model, HttpServletRequest request ) throws Exception {
		 ModelAndView view = new ModelAndView();
		 view.setViewName("jsonView");
		 
		 /*** 데이터 바인딩 ***/
    	 Map<String, Object> paramer = (Map<String, Object>) paramMap.get("data");
		 String tabCode = IUtility.parseNull( paramer.get( "tab_code" ), "" );
	     String keyword = IUtility.parseNull( paramer.get( "keyword" ), "" );
	     String keywordInKeyword = IUtility.parseNull( paramer.get( "keyword" ), "keyword_in_keyword" );
	     int pageIndex = IUtility.parseInt( paramer.get( "pageIndex" ), 0 );
	        
		String isDevelopMode = "N";
		String totalsearchUrl;

		if(IUtility.parseNull(IUtility.getRemoteAddr(request)).equals("0:0:0:0:0:0:0:1")
				|| IUtility.parseNull(IUtility.getRemoteAddr(request)).equals("127.0.0.1")) {
			tabCode = IUtility.parseNull( paramer.get( "tabCode" ), "" );
			isDevelopMode = "Y";
			totalsearchUrl = "http://localhost:9090/xml/srch_resultxml.xml?base64=no&w=E_ONESTOP";
			paramMap.put("keyword", "test");
			if(keyword.equals("")) {
				keyword = "test";
			}
			if(tabCode.equals("CONT_INFO")) {
				if(pageIndex ==0) {
					totalsearchUrl = "http://localhost:9090/xml/srch_resultxml_cont.xml?base64=no&w=E_ONESTOP";
				}else {
					totalsearchUrl = "http://localhost:9090/xml/srch_resultxml_cont2.xml?base64=no&w=E_ONESTOP";
				}
			}
			
			if(tabCode.equals("MENU_INFO")) {
				totalsearchUrl = "http://localhost:9090/xml/srch_resultxml_menu.xml?base64=no&w=E_ONESTOP";
			}
			
			if(tabCode.equals("BBS_INFO")) {
				totalsearchUrl = "http://localhost:9090/xml/srch_resultxml_bbs.xml?base64=no&w=E_ONESTOP";
			}
			
		}else {
			isDevelopMode = "N";
			totalsearchUrl = "https://search.pusan.ac.kr/srch_resultxml?base64=no&w=E_ONESTOP";
		}
		
		

		
    	// Xml데이터를 response받을 API주소
    	StringBuffer url = new StringBuffer( totalsearchUrl );
    	//StringBuffer y_url = new StringBuffer( TOTALSEARCH_RANKINGWORD_URL );
        
        // 검색 탭 메뉴 클릭 이벤트 처리
        String outCnt = "10";
        
        if( "".equals( tabCode ) ){
        	pageIndex = 0;
        	outCnt = "4";
        }else{
        	outCnt = "10";
        }
        url.append( "&outmax=" );
        url.append( outCnt );
        url.append( "&pg=");
        url.append( (pageIndex +1));
        url.append( "&q=" );
        url.append( keyword );
        if( !"".equals( keywordInKeyword ) ) {
        	url.append( "&sq=" );
        	url.append( keywordInKeyword );
        }
        if( !"".equals( tabCode ) ) {
        	url.append( "&section=");
        	url.append( tabCode );
        }
        
        // RestTemplate 생성
        RestTemplate restTemplate = new RestTemplate();
        
        if( "Y".equals( isDevelopMode ) ){ // 개발모드에서 실행, 디버깅용
        	ClientHttpRequestInterceptor ri = new interceptorRestTemplate();
            List<ClientHttpRequestInterceptor> ris = new ArrayList<ClientHttpRequestInterceptor>();
            ris.add(ri);
            restTemplate.setInterceptors(ris);
            restTemplate.setRequestFactory(new BufferingClientHttpRequestFactory(new SimpleClientHttpRequestFactory() ) );
        }
        
        List<HttpMessageConverter<?>> messageConverters = new ArrayList<HttpMessageConverter<?>>();
        Jaxb2RootElementHttpMessageConverter jaxbMessageConverter = new Jaxb2RootElementHttpMessageConverter();
        //List<MediaType> mediaTypes = new ArrayList<MediaType>();
        //mediaTypes.add(MediaType.TEXT_HTML);
        jaxbMessageConverter.setSupportedMediaTypes(Collections.singletonList(MediaType.ALL));
        messageConverters.add(jaxbMessageConverter);
        restTemplate.setMessageConverters(messageConverters);
        

        // 오브젝트로 결과값 받아오기
        TotalSearch_A_RootVo t = new TotalSearch_A_RootVo();
        
        try{
        		if( !"".equals( keyword ) ) {

        			t = restTemplate.getForObject( url.toString(), TotalSearch_A_RootVo.class );

        		}
        }catch( Exception e ){
        	logger.info(e);
        }

        //SearchWordRank_A_RootVo y = new SearchWordRank_A_RootVo();
        
        RestTemplate restTemplateY = new RestTemplate();
        
        if( "Y".equals( isDevelopMode ) ){ // 개발모드에서 실행, 디버깅용
        	ClientHttpRequestInterceptor ri = new interceptorRestTemplate();
            List<ClientHttpRequestInterceptor> ris = new ArrayList<ClientHttpRequestInterceptor>();
            ris.add(ri);
            restTemplateY.setInterceptors(ris);
            restTemplateY.setRequestFactory(new BufferingClientHttpRequestFactory(new SimpleClientHttpRequestFactory() ) );
        }
        
        List<HttpMessageConverter<?>> messageConvertersY = new ArrayList<HttpMessageConverter<?>>();
        Jaxb2RootElementHttpMessageConverter jaxbMessageConverterY = new Jaxb2RootElementHttpMessageConverter();
        List<MediaType> mediaTypesY = new ArrayList<MediaType>();
        mediaTypesY.add(MediaType.TEXT_XML);
        jaxbMessageConverterY.setSupportedMediaTypes(mediaTypesY);
        messageConvertersY.add(jaxbMessageConverterY);
        restTemplateY.setMessageConverters(messageConvertersY);
        

	

		Map<String, Object> param = new HashMap<String, Object>();
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		if ("anonymousUser".equals(IUtility.getLoginInfo())) {
			list = (List<Map<String, Object>>) mainService.selectAllMenu(param);
		} else {
			param.put("USER_ID", ((CustomUserDetail) IUtility.getLoginInfo()).getUserId());
			list = (List<Map<String, Object>>) mainService.selectMenu(param);
		}
		
		List<Map<String, Object>> docList = new ArrayList<Map<String, Object>>();
		
		for (TotalSearch_B_SectionVo sectionInfo : t.getSection() ) {  //section1, section2
			Map<String, Object> docInfo = new HashMap<String, Object>();
			

			List<TotalSearch_C_DocVo> newDocList = new ArrayList<TotalSearch_C_DocVo>();

			for (TotalSearch_C_DocVo tcd : sectionInfo.getDoc()) { //doc1, doc2
				docInfo.put("doc_info", tcd);
				docInfo.put("TOT_CNT", sectionInfo.getTotcnt());

				String menuUrl = tcd.get("^MENU_URL:");
				String menuCd = menuUrl.substring( menuUrl.indexOf("=")+1,menuUrl.length());
				
				
				boolean auth = false;
				for (Map<String, Object> map : list) {
					if(IUtility.parseNull(map.get("MENU_CD")).equals(menuCd)) {
						newDocList.add(tcd);
						auth = true;
						break;
					}
				}
				
				if(!auth) {
					List<TotalSearch_D_AttVo> attList = new ArrayList<TotalSearch_D_AttVo>();
					TotalSearch_D_AttVo attInfo = new TotalSearch_D_AttVo();

					TotalSearch_C_DocVo docInfo2 = new TotalSearch_C_DocVo();
					attInfo.setName("^MENU_NM:");
					attInfo.setAtt(tcd.get("^MENU_NM:"));//attInfo.setAtt("권한이 없는 메뉴입니다.");
					attList.add(0,attInfo);
					docInfo2.setAtt(attList);
					attInfo = new TotalSearch_D_AttVo();
					attInfo.setName("^CONTENTS:");
					attInfo.setAtt("...");
					attList.add(1,attInfo);
					docInfo2.setAtt(attList);
					attInfo = new TotalSearch_D_AttVo();
					attInfo.setName("^MENU_URL:");
					attInfo.setAtt("");
					attList.add(2,attInfo);
					docInfo2.setAtt(attList);
					attInfo = new TotalSearch_D_AttVo();
					attInfo.setName("^TITLE:");
					attInfo.setAtt(tcd.get("^TITLE:"));//attInfo.setAtt("권한이 없는 메뉴입니다.");
					attList.add(3,attInfo);
					docInfo2.setAtt(attList);

					
					newDocList.add(docInfo2);
				}

			}
			sectionInfo.setDoc(newDocList);
			docList.add(docInfo);
		}
		
		view.addObject( "search_rs_root", t );


        // 전체 검색 결과 카운트
        int totalSearchCnt = 0;
        if( t.getSection() != null && t.getSection().size() > 0 ){
        	for( TotalSearch_B_SectionVo s  : t.getSection() ){
        		totalSearchCnt += IUtility.parseInt( s.getTotcnt(), 0 );
        	}
        }
        view.addObject( "total_search_cnt", totalSearchCnt );
        view.addObject("pageInfo", IUtility.getPageInfo(paramer, docList));
   
        return view;
	}
	
	
		
}
