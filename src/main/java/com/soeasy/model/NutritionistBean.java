package com.soeasy.model;

import java.io.Serializable;
import java.sql.Blob;
import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name = "Nutritionist")
public class NutritionistBean implements Serializable {
	
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer nutritionistId;
	
	private String nutritionistName;
	
	private Blob nutritionistImage;
	
	@Transient
	private MultipartFile nutritionistMultiImg;
	
	private String nutritionistGender;
	
	private String nutritionistDegree;
	
	private String nutritionistEmail;
	
	private Integer nutritionistCategory;
	
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
	private Date nutritionistDate;
	
	//---------------------------------
	public NutritionistBean() {
	}
	//---------------------------------

	public Integer getNutritionistId() {
		return nutritionistId;
	}

	public void setNutritionistId(Integer nutritionistId) {
		this.nutritionistId = nutritionistId;
	}

	public String getNutritionistName() {
		return nutritionistName;
	}

	public void setNutritionistName(String nutritionistName) {
		this.nutritionistName = nutritionistName;
	}

	public Blob getNutritionistImage() {
		return nutritionistImage;
	}

	public void setNutritionistImage(Blob nutritionistImage) {
		this.nutritionistImage = nutritionistImage;
	}

	public MultipartFile getNutritionistMultiImg() {
		return nutritionistMultiImg;
	}

	public void setNutritionistMultiImg(MultipartFile nutritionistMultiImg) {
		this.nutritionistMultiImg = nutritionistMultiImg;
	}

	public String getNutritionistGender() {
		return nutritionistGender;
	}

	public void setNutritionistGender(String nutritionistGender) {
		this.nutritionistGender = nutritionistGender;
	}

	public String getNutritionistDegree() {
		return nutritionistDegree;
	}

	public void setNutritionistDegree(String nutritionistDegree) {
		this.nutritionistDegree = nutritionistDegree;
	}

	public String getNutritionistEmail() {
		return nutritionistEmail;
	}

	public void setNutritionistEmail(String nutritionistEmail) {
		this.nutritionistEmail = nutritionistEmail;
	}

	public Integer getNutritionistCategory() {
		return nutritionistCategory;
	}

	public void setNutritionistCategory(Integer nutritionistCategory) {
		this.nutritionistCategory = nutritionistCategory;
	}

	public Date getNutritionistDate() {
		return nutritionistDate;
	}

	public void setNutritionistDate(Date nutritionistDate) {
		this.nutritionistDate = nutritionistDate;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
