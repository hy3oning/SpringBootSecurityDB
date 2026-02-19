package com.zeus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class LoginController {
	// 에러 메시지와 로그아웃 메시지를 파라미터로 사용한다.
	@GetMapping("/login")
	public String getMethodName(@RequestParam(required = false) String error,
			@RequestParam(required = false) String logout, Model model) {
		log.info("error: " + error);
		log.info("logout: " + logout);
		if (error != null) {
			model.addAttribute("error", "로그인 에러!!!");
		}
		if (logout != null) {
			model.addAttribute("logout", "로그아웃!!!");
		}
		return "loginForm";
	}

	@GetMapping("/logoutForm")
	public String logoutForm() {
		return "logoutForm"; // /WEB-INF/views/logoutForm.jsp
	}
}
