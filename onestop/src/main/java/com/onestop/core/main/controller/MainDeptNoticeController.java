package com.onestop.core.main.controller;

import java.net.URI;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.jdom.input.SAXBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import com.onestop.core.main.service.MainDeptNoticeService;
import com.onestop.core.resolver.ParamMap;
import com.onestop.core.util.IUtility;
import com.onestop.core.util.controller.CommonController;
import com.sun.syndication.feed.atom.Feed;
import com.sun.syndication.feed.synd.SyndEntry;
import com.sun.syndication.feed.synd.SyndFeed;
import com.sun.syndication.io.SyndFeedInput;
import com.sun.syndication.io.XmlReader;


/**
 * @Class Name : MainDeptNoticeController.java
 * @Description : 학과공지 Controller Class
 * @Modification Information
 * @ @ 작성일 작성자
 *   2022.04.04 김우영
 */
@RequestMapping(value = "/core/main/middleware")
@RestController
public class MainDeptNoticeController extends CommonController {

	@Autowired MainDeptNoticeService mainDeptNoticeService;
	
	@RequestMapping(value = "/departConfigSearch")
	public Map<String, Object> departConfigSearch(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		Map<String, Object> result = new HashMap<String, Object>();
		Map<String, Object> param = (Map<String, Object>) paramMap.get("data");
		setSuccess(result, mainDeptNoticeService.departConfigSearch(param));
		return result;
	}
	
	@RequestMapping(value = "/departConfigUpdate")
	public ModelAndView departConfigUpdate(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ModelAndView view = new ModelAndView();
		view.setViewName("jsonView");
		Map<String, Object> param = (Map<String, Object>) paramMap.get("data");
		//int result = mainDeptNoticeService.departConfigUpdate(param);
		view.addObject("result", mainDeptNoticeService.departConfigUpdate(param));
		return view;
	}
	
	
	
	@RequestMapping(value = "/rssSearch")
	public ModelAndView rssSearch3(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		logger.info("------------ rssSearch start ------------");
		Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
		ModelAndView view = new ModelAndView();
		view.setViewName("jsonView");
		List<Map<String, Object>> xmlList = new ArrayList<Map<String,Object>>();
		
		SAXBuilder parser = new SAXBuilder();
		parser.setValidation(false);
		parser.setIgnoringElementContentWhitespace(true);

		String parameter = "/bbs/"+params.get("siteId")+"/"+params.get("boardId")+"/rssList.do?row=10";
		String rssBoardUrl = "http://his.pusan.ac.kr";
		String rssUrl = "";
		
		if(IUtility.parseNull(params.get("SESSION_USER_IP")).equals("0:0:0:0:0:0:0:1")
				|| IUtility.parseNull(params.get("SESSION_USER_IP")).equals("127.0.0.1")) {
			rssUrl = "http://localhost:9090/xml/rss.xml";
		}else {
			rssUrl = rssBoardUrl + parameter;
		}
		
		URL url = new URL(rssUrl);
		
		InputSource is = new InputSource(url.openStream());
		org.jdom.Document doc = parser.build(is);
		org.jdom.Element root = doc.getRootElement();
		org.jdom.Element channel = root.getChild("channel");
		xmlList = channel.getChildren("item");
		
		List<Map<String, Object>> rssBbsList = new ArrayList<Map<String,Object>>();
		for(int i=0, j=xmlList.size(); i<j ; i++) {
			org.jdom.Element el = (org.jdom.Element) xmlList.get(i);

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("TITLE", el.getChildText("title"));
			map.put("AUTHOR", el.getChildText("author"));
			if( !IUtility.parseNull(el.getChildText("pubDate")).equals("")) {
				map.put("REG_DATE2", IUtility.parseNull(el.getChildText("pubDate")).replaceAll(" ", "").replaceAll("\n", ""));
				map.put("REG_DATE2", IUtility.parseNull(map.get("REG_DATE2")).replaceAll(" ", "").substring(0,10));
			}
			
			map.put("LINK", el.getChildText("link"));
			map.put("CATEGORY", IUtility.parseNull(el.getChildText("category")).replaceAll(" ", "").replaceAll("\n", ""));
			rssBbsList.add(map);
		}
		
	
		 view.addObject("rssBbsList", rssBbsList);
		return view;
	}
	
	
	@RequestMapping(value = "/pnuHisSiteInfo")
	public ModelAndView pnuHisSiteInfo(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		logger.info("------------ pnuHisSiteInfo start ------------");
		Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
		List<Map<String, Object>> result = new ArrayList<Map<String,Object>>();
		ModelAndView view = new ModelAndView();
		view.setViewName("jsonView");
		
		result = mainDeptNoticeService.departSiteInfo(params);
		view.addObject("rssDeptList", result);
		return view;
	}
	
	@RequestMapping(value = "/pnuHisBoardInfo")
	public ModelAndView pnuHisBoardInfo(ParamMap paramMap, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		logger.info("------------ pnuHisBoardInfo start ------------");
		Map<String, Object> params = (Map<String, Object>) paramMap.get("data");
		List<Map<String, Object>> result = new ArrayList<Map<String,Object>>();
		ModelAndView view = new ModelAndView();
		view.setViewName("jsonView");
		
		result = mainDeptNoticeService.departSiteBoardInfo(params);
		view.addObject("rssDeptBoardList", result);
		return view;
	}
	
	public String getValue(Element parent, String nodeName) {    
	      return parent.getElementsByTagName(nodeName).item(0).getFirstChild().getNodeValue();    
	}    

	
}
