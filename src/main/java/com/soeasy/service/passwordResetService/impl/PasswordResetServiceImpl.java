package com.soeasy.service.passwordResetService.impl;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.soeasy.model.CustomerBean;
import com.soeasy.model.PasswordResetValidate;
import com.soeasy.model.ShopBean;
import com.soeasy.repository.customerRepository.CustomerRepository;
import com.soeasy.repository.passwordResetRepository.PasswordResetRepository;
import com.soeasy.repository.shopRepository.ShopRepository;
import com.soeasy.service.passwordResetService.PasswordResetService;

@Service
@Transactional
public class PasswordResetServiceImpl implements PasswordResetService {

	@Autowired
	PasswordResetRepository passwordResetRepository;
	
	@Autowired
	CustomerRepository customerRepository;
	
	@Autowired
	ShopRepository shopRepository;
	
	@Autowired
    private JavaMailSender javaMailSender;
	
	//使用@Async進行非同步發送郵件
	@Async
	@Override
	public void sendPasswordResetEmail(SimpleMailMessage email) {
		javaMailSender.send(email);
	}

	//新增顧客會員密碼重製申請記錄
	@Override
	public void insertCustomerResetRecord(PasswordResetValidate passwordResetValidate, CustomerBean customerBean,
			String resetToken) {
		passwordResetValidate.setEmail(customerBean.getCustomerEmail());
		passwordResetValidate.setResetToken(resetToken);
		passwordResetValidate.setMemberType("customerPasswordReset");
		passwordResetValidate.setCreateTime(new Timestamp(System.currentTimeMillis()));
		passwordResetValidate.setModifiedTime(new Timestamp(System.currentTimeMillis()));
		passwordResetRepository.save(passwordResetValidate);
	}

	//新增廠商會員密碼重製申請記錄
	@Override
	public void insertShopResetRecord(PasswordResetValidate passwordResetValidate, ShopBean shopBean,
			String resetToken) {
		passwordResetValidate.setEmail(shopBean.getShopEmail());
		passwordResetValidate.setResetToken(resetToken);
		passwordResetValidate.setMemberType("shopPasswordReset");
		passwordResetValidate.setCreateTime(new Timestamp(System.currentTimeMillis()));
		passwordResetValidate.setModifiedTime(new Timestamp(System.currentTimeMillis()));
		passwordResetRepository.save(passwordResetValidate);
	}

	//以Token查詢重製申請記錄
	@Override
	public List<PasswordResetValidate> findUserByResetToken(String resetToken) {
		return passwordResetRepository.findByResetToken(resetToken);
	}

	//驗證是否發送重製郵件，一天requestPerDay次，與上一次請求時間間隔interval分鐘
	@Override
	public Boolean sendValidateLimitation(String email, Long requestPerDay, Long interval) {
		// TODO Auto-generated method stub
		return null;
	}

	//驗證連結是否失效，1.超時 2.舊連結被新的覆蓋
	@Override
	public Boolean validateLimitation(String email, Long requestPerDay, Long interval, String token) {
		// TODO Auto-generated method stub
		return null;
	}

}
