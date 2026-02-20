package com.zeus;

import org.springframework.boot.CommandLineRunner;
import org.springframework.security.crypto.password.PasswordEncoder;

public class PasswordDebugRunner implements CommandLineRunner {

	private final PasswordEncoder encoder;

	public PasswordDebugRunner(PasswordEncoder encoder) {
		this.encoder = encoder;
	}

	@Override
	public void run(String... args) {
		System.out.println("BCrypt(admin3) = " + encoder.encode("admin3"));
		System.out.println("BCrypt(pwd3)   = " + encoder.encode("pwd3"));
		System.out.println("BCrypt(pwd0)   = " + encoder.encode("pwd0"));
	}

}
