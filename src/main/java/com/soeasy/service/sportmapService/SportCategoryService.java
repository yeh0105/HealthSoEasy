package com.soeasy.service.sportmapService;

import java.util.List;

import com.soeasy.model.SportCategoryBean;

public interface SportCategoryService {
	
	//撈出SportCategory by ID
	SportCategoryBean getSportCategory(Integer sportCategoryId);
	
	//取出所有SportCategory
	List<SportCategoryBean> getAllSportCategorys();

}
