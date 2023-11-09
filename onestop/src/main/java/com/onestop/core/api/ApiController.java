package com.onestop.core.api;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.onestop.core.util.IUtility;
import com.onestop.core.util.ProjectConstant;
import com.onestop.core.util.controller.CommonController;


@RequestMapping(value = "/appLoginApi")
@RestController
public class ApiController extends CommonController  {
	
	@Autowired
	MessageSource localeMessageSource;
	
	@RequestMapping(value = "/check")
	public ModelAndView check(HttpServletRequest request, Model model) throws Exception {

		ModelAndView view = new ModelAndView();
		
		//String userId = IUtility.parseNull(request.getParameter("userId"));
		String menuCD = IUtility.parseNull(request.getParameter("menuCD"));
		String token = IUtility.parseNull(request.getParameter("token"));
		
		
		String userId = IUtility.getDecStr(token, ProjectConstant.SECURITY_KEY);
		
		HttpSession session = request.getSession();
		
		logger.info("gCsrfTokenHeaderName::"+session.getAttribute("_csrf.headerName"));
		logger.info("gCsrfTokenParameterName::"+session.getAttribute("_csrf.parameterName"));
		logger.info("gCsrfToken::"+session.getAttribute("_csrf.token"));
		
		//session.setAttribute("appLoginId", userId);
		view.addObject("userId", userId);
		view.addObject("menuCD", menuCD);
		view.setViewName("common/appLogin");
		
		return view;
	}

}
