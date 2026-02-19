package com.zeus.common.security;

import java.io.IOException;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CustomAccessDeniedHandler implements AccessDeniedHandler {
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response,
			AccessDeniedException accessDeniedException) throws IOException, ServletException {
		// 접근이 금지된 페이지를 요청하는 회원의 정보를 저장한다.
		log.info("Access Denied Handler");
		log.info("Access Denied Handler request" + request);
		log.info("Access Denied Handler reponse" + response);
		log.info("Access Denied Handler accessDeniedException" + accessDeniedException);
		log.info("Redirect.... ");
		response.sendRedirect("/accessError");
	}
}
