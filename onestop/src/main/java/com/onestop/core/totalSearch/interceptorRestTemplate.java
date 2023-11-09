package com.onestop.core.totalSearch;

import java.io.IOException;
import java.io.InputStream;
import java.net.URI;
import java.nio.charset.StandardCharsets;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpRequest;
import org.springframework.http.client.ClientHttpRequestExecution;
import org.springframework.http.client.ClientHttpRequestInterceptor;
import org.springframework.http.client.ClientHttpResponse;

public class interceptorRestTemplate implements ClientHttpRequestInterceptor {

	private final Logger LOGGER = LoggerFactory.getLogger(getClass().getName());
	@Override
	public ClientHttpResponse intercept(HttpRequest request, byte[] body, ClientHttpRequestExecution execution) throws IOException {
		// 사용자 정보 추출
		//String userId = "aaaa";

		// request log
		URI uri = request.getURI();
		traceRequest(request, body);

		// execute
		ClientHttpResponse response = execution.execute(request, body);

		// response log
		traceResponse(response, uri);
		return response;
	}
	
	/**
	 * <pre>
	 * traceRequest
	 *
	 * <pre>
	 * @param request
	 * @param body
	 * @param userId
	 * @throws IOException
	 */
	private void traceRequest(HttpRequest request, byte[] body) throws IOException {
		
		LOGGER.info("[REQUEST] ");
		LOGGER.info("Uri : " + request.getURI());
		LOGGER.info(", Method : " + request.getMethod());
		LOGGER.info(", Request Body : " + new String(body, StandardCharsets.UTF_8));
		
	}

	/**
	 * <pre>
	 * traceResponse
	 *
	 * <pre>
	 * @param response
	 * @param userId
	 * @throws IOException
	 */
	private void traceResponse(ClientHttpResponse response, URI uri) throws IOException {
		InputStream is = response.getBody();
		byte[] bodyData = IOUtils.toByteArray(is);

		
		LOGGER.info("[RESPONSE] ");
		LOGGER.info("Uri : " + uri);
		LOGGER.info(", Status code : " + response.getStatusCode());
		LOGGER.info(", Response Body : " + new String(bodyData, StandardCharsets.UTF_8));

	}

}
