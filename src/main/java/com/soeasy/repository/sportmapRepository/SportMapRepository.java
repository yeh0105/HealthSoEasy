package com.soeasy.repository.sportmapRepository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
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

	//給特定分數撈出特定分數的前三筆
	List<SportMapBean>findFirst3BySportMapScore(Integer sportMapScore,  Sort sort);
	
	//給特定分數撈出特定分數的前三筆
	List<SportMapBean>findTop3BySportMapScore(Integer sportMapScore,  Sort sort);

	//查詢所有地圖裡的前3筆，依照地圖分數降冪排序
	List<SportMapBean>findTop3ByOrderBySportMapScoreDesc();
	

}
	

