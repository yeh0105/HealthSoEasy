package com.soeasy.validator.sportMapValidator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.soeasy.model.SportMapBean;

public class SportMapBeanValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		
		 boolean b = SportMapBean.class.isAssignableFrom(clazz);
		
		 return b;
	}
	
	public void validate(Object target, Errors errors){
		SportMapBean sportMapBean = (SportMapBean)target;
		ValidationUtils.rejectIfEmptyOrWhitespace(errors,"sportMapName","運動地點名稱不能空白");
//		ValidationUtils.rejectIfEmptyOrWhitespace(errors,"sportMapAddress","地址名稱不能空白");
			
		if(sportMapBean.getSportCategoryBean().getSportCategoryId()== -1) {
			errors.rejectValue("sportCategoryBean", "必須挑選分類欄的選項");
		}
		
		
	}

	
	
	
}
