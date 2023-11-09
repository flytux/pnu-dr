package com.onestop.core.messagesource;

import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.context.support.AbstractMessageSource;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

import com.onestop.core.util.IUtility;

/**
 * Reading of messages using data in databases. It must be provided with a
 * datasource and sql code which must be passed 2 jdbc parameters which will be
 * respectively filled with the code and the string representation of the
 * locale. <BR>
 * TODO: improve the caching part, either switching to a real cache (but isn't
 * it too heavy to ask in the configuration to specify something like EHCache
 * etc..) or caching per entry (it is not much useful to cache depending on the
 * date of the last query whatever it is) <BR>
 * TODO: check that synchronization isn't needed on the cache part
 * 
 * @author Olivier Jolly
 */
public class JdbcMessageSource extends AbstractMessageSource implements
        InitializingBean {

	private static final Logger LOG = LogManager.getLogger(JdbcMessageSource.class.getName());

	private String CacheKey(String code, Locale locale) {
		String rtn = "";
		if(!"".equals(code) && code != null && locale != null) rtn = IUtility.parseNull(code) + "/" + locale.getLanguage();
		return rtn;
	}

    private static final Map<String, Object> CACHED_MESSAGES = new HashMap<String, Object>();

    //private long cachedMilliSecond = 0;
    private long cachedTerm = 0;//(60 * 1000);
    private static final long CACHED_PRIOR = 60 * 1000;

    private long lastQuery = 0;

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.springframework.context.support.AbstractMessageSource#resolveCode(java.
	 * lang.String, java.util.Locale)
	 */
	protected MessageFormat resolveCode(String code, Locale locale) {
		MessageFormat result = null;
		result = (MessageFormat) CACHED_MESSAGES.get(CacheKey(code, locale));
		if (cachedTerm == 0
				|| (result  == null)
				|| lastQuery + (cachedTerm * CACHED_PRIOR) < System.currentTimeMillis()) {
			result = resolveCodeInternal(code, locale);
			CACHED_MESSAGES.put(CacheKey(code, locale), result);
		}

		if (result != null)
			return result;

		return resolveCodeInternal(code, locale);
	}

    /**
     * Check in base the message associated with the given code and locale
     * 
     * @param code
     *            the code of the message to solve
     * @param locale
     *            the locale to check against
     * @return a MessageFormat if one were found, either for the given locale or
     *         for the default on, or null if nothing could be found
     */
    protected MessageFormat resolveCodeInternal(String code, Locale locale) {
        String result = IUtility.parseNull(code);

        lastQuery = System.currentTimeMillis();

        try {
        	WebApplicationContext context = ContextLoader.getCurrentWebApplicationContext();
        	/*
			CommCmsp001Service commCmsp001Service = (CommCmsp001Service)context.getBean("commCmsp001Service");
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("code", code);
			paramMap.put("locale", locale.toString());
			
			
			List<Map<String, Object>> resultList = commCmsp001Service.getMessageSource(paramMap);
			if(resultList == null) resultList = new ArrayList<Map<String, Object>>();
			if(resultList.size() > 0) {
				result = IUtility.parseNull(resultList.get(0).get("MTILANG_MSSAGE"));
			} else {
				resultList = commCmsp001Service.selectList(paramMap);
				if(resultList == null) resultList = new ArrayList<Map<String, Object>>();
				
				if(resultList.size() > 0) {
					result = IUtility.parseNull(resultList.get(0).get("MTILANG_MSSAGE"));
				}
			}
			*/
			
			List<Map<String, Object>> resultList = new ArrayList<Map<String, Object>>();
        } catch (Exception e) {
        	LOG.error(e);
        }

        return new MessageFormat(result, locale);
    }

    public void setCachedTerm(long cachedTerm) {
        this.cachedTerm = cachedTerm;
    }

    
    public void afterPropertiesSet() throws Exception {
    	/*
         * (non-Javadoc)
         * 
         * @see org.springframework.beans.factory.InitializingBean#afterPropertiesSet()
         */
    }

    /**
     * Empty the cache so that all future message resolving request ends in
     * database queries
     */
    public void clearCache() {
    	CACHED_MESSAGES.clear();
    }

}
