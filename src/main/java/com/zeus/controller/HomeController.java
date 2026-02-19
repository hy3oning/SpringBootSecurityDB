package com.zeus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {
	@GetMapping("/")
	public String home( Model model) {
	log.info("home 의 방문을 환영합니다.");
	model.addAttribute("serverTime" ,"2026-02-19");
	return "home";
	}
}