package com.zeus.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;

import com.zeus.common.security.CustomAccessDeniedHandler;
import com.zeus.common.security.CustomLoginSuccessHandler;
import com.zeus.common.security.CustomUserDetailsService;

import jakarta.servlet.DispatcherType;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

	@Autowired
	DataSource dataSource;

	@Bean
	AuthenticationSuccessHandler authenticationSuccessHandler() {
		return new CustomLoginSuccessHandler();
	}

	@Bean
	AccessDeniedHandler accessDeniedHandler() {
		return new CustomAccessDeniedHandler();
	}

	@Bean
	PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

	@Bean
	DaoAuthenticationProvider daoAuthenticationProvider(CustomUserDetailsService userDetailsService,
			PasswordEncoder passwordEncoder) {
		DaoAuthenticationProvider provider = new DaoAuthenticationProvider(userDetailsService);
		provider.setPasswordEncoder(passwordEncoder);
		return provider;
	}

	@Bean
	SecurityFilterChain filterChain(HttpSecurity http, DaoAuthenticationProvider provider) throws Exception {

		http.authenticationProvider(provider).csrf(csrf -> csrf.disable())

				.authorizeHttpRequests(auth -> auth.dispatcherTypeMatchers(DispatcherType.FORWARD, DispatcherType.ERROR)
						.permitAll().requestMatchers("/", "/login", "/logout", "/error", "/accessError").permitAll()
						.requestMatchers("/css/**", "/js/**", "/images/**").permitAll()
						.requestMatchers("/notice/register/**").hasRole("ADMIN").requestMatchers("/board/register/**")
						.hasRole("MEMBER").anyRequest().authenticated())

				.formLogin(form -> form.loginPage("/login").loginProcessingUrl("/login")
						.successHandler(authenticationSuccessHandler()).failureUrl("/login?error=true").permitAll())

				.logout(logout -> logout.logoutUrl("/logout").logoutSuccessUrl("/").invalidateHttpSession(true)
						.deleteCookies("JSESSIONID").permitAll())

				.rememberMe(
						rm -> rm.key("zeus").tokenRepository(createJDBCRepository()).tokenValiditySeconds(60 * 60 * 24))

				.exceptionHandling(ex -> ex.accessDeniedHandler(accessDeniedHandler()));

		return http.build();
	}

	private PersistentTokenRepository createJDBCRepository() {
		JdbcTokenRepositoryImpl repo = new JdbcTokenRepositoryImpl();
		repo.setDataSource(dataSource);
		return repo;
	}
}