package com.resolver;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import com.exception.AccessForbiddenException;

@ControllerAdvice
public class ExceptionResolver {

	@ExceptionHandler(value = AccessForbiddenException.class)
	public String exceptionResolver(HttpServletRequest request,AccessForbiddenException exception,HttpServletResponse response) throws IOException{

		
		return "redirect:/login.do";
	}
	
}
