package com.onestop.core.security.exception;

import org.springframework.security.core.AuthenticationException;

public class IPNotPermitedException extends AuthenticationException {
    // ~ Constructors
    // ===================================================================================================

    /**
     * Constructs a <code>BadCredentialsException</code> with the specified message.
     *
     * @param msg the detail message
     */
    public IPNotPermitedException(String msg) {
        super(msg);
    }

    /**
     * Constructs a <code>BadCredentialsException</code> with the specified message and
     * root cause.
     *
     * @param msg the detail message
     * @param t root cause
     */
    public IPNotPermitedException(String msg, Throwable t) {
        super(msg, t);
    }
}
