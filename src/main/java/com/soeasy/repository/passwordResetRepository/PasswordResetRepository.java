package com.soeasy.repository.passwordResetRepository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.soeasy.model.PasswordResetValidate;

public interface PasswordResetRepository extends JpaRepository<PasswordResetValidate, Integer>{
	List<PasswordResetValidate> findByResetToken(String resetToken);
}
