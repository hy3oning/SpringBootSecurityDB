package com.zeus.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.zeus.common.security.CustomAccessDeniedHandler;
import com.zeus.common.security.CustomLoginSuccessHandler;

import jakarta.servlet.DispatcherType;
import lombok.extern.slf4j.Slf4j;

@Configuration	//2번설정
@EnableWebSecurity //1번설정
@Slf4j
public class SecurityConfig {

	@Bean
	SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
		http.csrf(csrf -> csrf.disable()).authorizeHttpRequests(auth -> auth
				// ✅ JSP forward + error 렌더링은 무조건 통과 (루프 방지 핵심)
				.dispatcherTypeMatchers(DispatcherType.FORWARD, DispatcherType.ERROR).permitAll()

				// ✅ 로그인/에러/정적 리소스 허용
				.requestMatchers("/", "/login", "/logout", "/error", "/accessError").permitAll()
				.requestMatchers("/css/**", "/js/**", "/images/**").permitAll()

				// ✅ 권한 규칙
				.requestMatchers("/notice/register/**").hasRole("ADMIN").requestMatchers("/board/register/**")
				.hasRole("MEMBER")

				.anyRequest().authenticated())
				.formLogin(form -> form.loginPage("/login").loginProcessingUrl("/login")
						.successHandler(createAuthenticationSuccessHandler()).failureUrl("/login?error=true")
						.permitAll())

				// ⭐ 로그아웃 설정 추가
				.logout(logout -> logout.logoutUrl("/logout") // POST /logout 요청 시 로그아웃
						.logoutSuccessUrl("/") // 로그아웃 성공 후 이동
						.invalidateHttpSession(true) // 세션 무효화
						.deleteCookies("JSESSIONID") // 세션 쿠키 삭제
						.permitAll())

				.exceptionHandling(ex -> ex.accessDeniedHandler(accessDeniedHandler()));

		return http.build();
	}

	// ✅ CustomLoginSuccessHandler를 빈으로 등록
	@Bean
	AuthenticationSuccessHandler createAuthenticationSuccessHandler() {
		return new CustomLoginSuccessHandler();
	}

	@Bean
	UserDetailsService userDetailsService() {
		UserDetails member = User.withUsername("member").password("{noop}1234").roles("MEMBER").build();

		UserDetails admin = User.withUsername("admin").password("{noop}1234").roles("ADMIN", "MEMBER").build();

		return new InMemoryUserDetailsManager(member, admin);
	}

	@Bean
	AccessDeniedHandler accessDeniedHandler() {
		return new CustomAccessDeniedHandler();

	}
}