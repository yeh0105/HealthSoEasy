package com.soeasy.validator.mallValidator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.soeasy.model.LecturerBean;
import com.soeasy.model.PostBean;
import com.soeasy.model.ProductBean;
import com.soeasy.model.ShopBean;

public class ProductBeanValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		boolean b = ProductBean.class.isAssignableFrom(clazz);

		return b;	}

	@Override
	public void validate(Object target, Errors errors) {
		ProductBean product = (ProductBean) target;

		// 欄位不得空白
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "productName", "", "產品名字不得空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "productDescription", "", "描述不得空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "productPrice", "", "價格不得空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "productAmount", "", "不得空白");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "productCost", "", "不得空白");
//		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "productImg", "", "不得空白");
		if (product.getProductMultiImg().isEmpty()) {
			errors.rejectValue("productMultiImg", "", "必須挑選圖片");
		}
	}

}
