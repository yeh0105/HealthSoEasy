package com.soeasy.repository.passwordResetRepository;

import java.sql.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.soeasy.model.PasswordResetValidate;

public interface PasswordResetRepository extends JpaRepository<PasswordResetValidate, Integer>{
	List<PasswordResetValidate> findByResetToken(String resetToken);
	
	List<PasswordResetValidate> findByEmailAndMemberType(String email, String memberType);
	
	Long countByEmailAndMemberTypeAndModifiedTimeAfter(String email, String memberType, Date date);
}
