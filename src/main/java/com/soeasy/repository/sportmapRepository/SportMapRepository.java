package com.soeasy.repository.sportmapRepository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.soeasy.model.SportCategoryBean;
import com.soeasy.model.SportMapBean;


public interface SportMapRepository extends JpaRepository<SportMapBean, Integer> {

//	@Query("SELECT DISTINCT sportMapCategory FROM SportMapBean")
//	List<String> findDistinctCategory();
	
	// 抓分頁一頁有哪些地圖by SportCategoryId(SportMapBean裡SportCategoryId欄位名稱為SportCategoryBean)
	Page<SportMapBean> findBySportCategoryBean(SportCategoryBean SportCategoryBean,Pageable pageable);
	
	//抓一個分類裡有多少個地圖總數	
	Long countBySportCategoryBean(SportCategoryBean sportCategoryBean);
}
	

