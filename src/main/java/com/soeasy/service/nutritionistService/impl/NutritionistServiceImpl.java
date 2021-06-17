package com.soeasy.service.nutritionistService.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.soeasy.model.NutritionistBean;
import com.soeasy.repository.nutritionistRepository.NutritionistRepository;
import com.soeasy.service.nutritionistService.NutritionistService;

@Transactional
@Service
public class NutritionistServiceImpl implements NutritionistService{
	
	@Autowired
	NutritionistRepository nutritionistRepository;
	
	public NutritionistServiceImpl() {
	}
	
	
	@Override
	public void addNutritionist(NutritionistBean nutritionistBean) {
		nutritionistRepository.save(nutritionistBean);
	}

	@Override
	public NutritionistBean findByNutritionistId(Integer nutritionistId) {
		return nutritionistRepository.findByNutritionistId(nutritionistId).get(nutritionistId);
	}

	@Override
	public List<NutritionistBean> findAllByNutritionistId() {
		return nutritionistRepository.findAll();
	}

	@Override
	public void updateNutritionist(NutritionistBean nutritionistBean) {
		
	}

	@Override
	public void deleteByNutritionistId(Integer nutritionistId) {
		nutritionistRepository.deleteById(nutritionistId);
	}
	
	
}
