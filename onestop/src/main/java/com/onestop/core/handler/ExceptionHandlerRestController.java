package com.onestop.core.handler;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.ProcessingException;

import org.apache.commons.lang3.exception.ExceptionUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.codehaus.jackson.JsonParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.NoHandlerFoundException;

import com.fasterxml.jackson.databind.JsonMappingException;
import com.onestop.core.util.IUtility;

@RestControllerAdvice
public class ExceptionHandlerRestController {
	
	@Autowired
	MessageSource localeMessageSource;
	
	protected final Log logger = LogFactory.getLog(getClass());
	
	public ErrorResponse getErrorResponse(int errorCode, String msg, Exception exception, String errorType, Map<String, Object> data) {
		return new ErrorResponse(errorCode, msg, exception, errorType, data);
	}
	
	@ExceptionHandler(CustomException.class)
	protected ModelAndView handleCustomDataAccessException(CustomException e, HttpServletRequest request) throws Exception {
		Exception exception = e.getException();
		int errorCode = 0;
		String msg = IUtility.getCommonMessage(request, localeMessageSource, "fail.common.msg");
		String errorType = "";
		HttpStatus status = HttpStatus.INTERNAL_SERVER_ERROR;
		Map<String, Object> data = e.getData();
		if(data == null) data = new HashMap<String, Object>();
		
		ErrorResponse errorResponse = null;//new ErrorResponse(errorCode, msg, exception, "Exception");
		
		if (ExceptionUtils.hasCause(exception, DataAccessException.class)) {
			DataAccessException dataAccessException = (DataAccessException) exception;
			
			if(dataAccessException.contains(SQLException.class)) {
				SQLException sqlException = (SQLException)dataAccessException.getCause();
				errorCode = sqlException.getErrorCode();
				if(dataAccessException.contains(DuplicateKeyException.class)) {
					msg = IUtility.getCommonMessage(request, localeMessageSource, "errors.db.duplication");
				} else {
					msg = IUtility.getCommonMessage(request, localeMessageSource, "errors.db.default");					
				}
			}
			errorType = "DataAccessException";
		} else if (ExceptionUtils.hasCause(exception, AccessDeniedException.class)) {
			status = HttpStatus.FORBIDDEN;
			errorCode = 403;
			msg = e.getLocalizedMessage();
			if("".equals(msg)) msg = IUtility.getCommonMessage(request, localeMessageSource, "access.dinied");
			errorType = "AccessDeniedException";
			/*
		} else if (ExceptionUtils.hasCause(exception, CustomRullCheckException.class)) {
			status = HttpStatus.BAD_REQUEST;
			errorCode = status.value();
			msg = e.getLocalizedMessage();
			errorType = "CustomRullCheckException";
			*/	
		} else {
			//msg = e.getLocalizedMessage();
			errorType = "OtherException";
		}
		
		if(data != null && !data.isEmpty()) {
			data.put("O_RSLT", "N");
			data.put("O_MSG", msg);
		}
		errorResponse = getErrorResponse(errorCode, msg, exception, errorType, data);

		//return new ResponseEntity(errorResponse, status);
		ModelAndView view = new ModelAndView();
		view.setViewName("error/error500");
		return view;
	}
	
	@ExceptionHandler(DataAccessException.class)
	protected ModelAndView handleDataAccessException(DataAccessException e, HttpServletRequest request) throws Exception {
		logger.info("============= handleDataAccessException =============");
		int errorCode = 0;
		String msg = IUtility.getCommonMessage(request, localeMessageSource, "fail.common.msg");
		HttpStatus status = HttpStatus.INTERNAL_SERVER_ERROR;
		ErrorResponse errorResponse = new ErrorResponse(errorCode, msg, e, "DataAccessException");
		
		// 키 중복 오류
		if(e.contains(DuplicateKeyException.class)) {
			errorCode = 1;
			msg = IUtility.getCommonMessage(request, localeMessageSource, "errors.db.duplication");
		} else if(e.contains(SQLException.class)) {
			SQLException ex = (SQLException)e.getCause();
			errorCode = ex.getErrorCode();
			//msg = ex.getLocalizedMessage();
		}
		
		errorResponse.setStatus(errorCode);
		errorResponse.setMessage(msg);

		//return new ResponseEntity(errorResponse, status);
		ModelAndView view = new ModelAndView();
		view.setViewName("error/error500");
		return view;
	}

	@ExceptionHandler(AccessDeniedException.class)
	protected ModelAndView handleDataAccessException(AccessDeniedException e, HttpServletRequest request) throws Exception {
		int errorCode = 403;
		String msg = e.getLocalizedMessage();
		HttpStatus status = HttpStatus.FORBIDDEN;
		ErrorResponse errorResponse = new ErrorResponse(errorCode, msg, e, "AccessDeniedException");
		
		if("".equals(msg)) msg = IUtility.getCommonMessage(request, localeMessageSource, "access.dinied");
		
		errorResponse.setStatus(errorCode);
		errorResponse.setMessage(msg);

		//return new ResponseEntity(errorResponse, status);
		ModelAndView view = new ModelAndView();
		view.setViewName("error/error500");
		return view;
	}
	
	@ExceptionHandler(NoHandlerFoundException.class)
	protected ModelAndView handleNoHandlerFoundException(NoHandlerFoundException e, HttpServletRequest request) throws Exception {
		logger.info("NoHandlerFoundException = " + e.getMessage());
		int errorCode = 404;
		String url = e.getRequestURL();
		String msg = IUtility.getCommonMessage(request, localeMessageSource, "errors.notfound", url);
		HttpStatus status = HttpStatus.NOT_FOUND;
		ErrorResponse errorResponse = new ErrorResponse(errorCode, msg, e, "NoHandlerFoundException");
		
		errorResponse.setStatus(errorCode);
		errorResponse.setMessage(msg);

		//return new ResponseEntity(errorResponse, status);
		ModelAndView view = new ModelAndView();
		view.setViewName("error/error500");
		return view;
	}
	
	@ExceptionHandler({ IOException.class, ParseException.class, ProcessingException.class, JsonParseException.class, JsonMappingException.class })
	protected ModelAndView handleParseException(Exception e, HttpServletRequest request) throws Exception {
		String msg = e.getLocalizedMessage();
		HttpStatus status = HttpStatus.BAD_REQUEST;
		ErrorResponse errorResponse = new ErrorResponse(500, msg, e);
		
		//return new ResponseEntity(errorResponse, status);
		ModelAndView view = new ModelAndView();
		view.setViewName("error/error500");
		return view;
	}
	
	@ExceptionHandler(Exception.class)
	protected ResponseEntity<ErrorResponse> handleException(Exception e, HttpServletRequest request) throws Exception {
		String msg = e.getLocalizedMessage();
		HttpStatus status = HttpStatus.INTERNAL_SERVER_ERROR;
		ErrorResponse errorResponse = new ErrorResponse(500, msg, e);
		
		return new ResponseEntity(errorResponse, status);
	}
}
