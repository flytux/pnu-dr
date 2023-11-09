package com.onestop.core.security.exception;

import org.springframework.security.core.AuthenticationException;

public class LoginFailNumberException extends AuthenticationException {
    // ~ Constructors
    // ===================================================================================================

    /**
     * Constructs a <code>BadCredentialsException</code> with the specified message.
     *
     * @param msg the detail message
     */
    public LoginFailNumberException(String msg) {
        super(msg);
    }

    /**
     * Constructs a <code>BadCredentialsException</code> with the specified message and
     * root cause.
     *
     * @param msg the detail message
     * @param t root cause
     */
    public LoginFailNumberException(String msg, Throwable t) {
        super(msg, t);
    }
}
