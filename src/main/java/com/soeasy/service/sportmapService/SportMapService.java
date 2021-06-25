package com.soeasy.service.sportmapService;

import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Sort;

import com.soeasy.model.SportCategoryBean;
import com.soeasy.model.SportMapBean;

public interface SportMapService {

	//新增地圖
	SportMapBean save(SportMapBean sportMapBean);
	
	//查詢單一地圖By sportMapId
	SportMapBean get(Integer SportMapId);	
		
	// 抓分頁一頁有哪些地圖
	Map<Integer, SportMapBean> getPageSportMaps(int pageNo);
	
	// 抓資料庫裡全部有幾個地圖
	Long getRecordCounts();
	// 總共有幾頁
	Integer getTotalPages();		
		
	//更新地圖資料
	void update(SportMapBean sportMapBean);
	
	//刪除單筆地圖
	void delete(Integer sportMapId);
	
	
	//查詢所有地圖
	List<SportMapBean> getAllSportMaps();
	
	
	// 抓分頁一頁有哪些地圖by SportCategoryId(SportMapBean裡SportCategoryId欄位名稱為SportCategoryBean)
	Map<Integer, SportMapBean> getPageSportMapsBySportCategoryId(SportCategoryBean SportCategoryBean,Integer pageNo);
	
	// 抓資料庫裡一個分類有幾個地圖
	Long getRecordCountsBySportCategoryId(SportCategoryBean sportCategoryBean);
	
	
	// 總共有幾頁
	Integer getTotalPagesBySportCategoryId(SportCategoryBean sportCategoryBean);	
	
	//給特定分數撈出特定分數的前三筆
	List<SportMapBean>findFirst3BySportMapScore(Integer sportMapScore,  Sort sort);
		
	//給特定分數撈出特定分數的前三筆	
	List<SportMapBean>findTop3BySportMapScore(Integer sportMapScore,  Sort sort);
		
	//查詢所有地圖裡的前3筆，依照地圖分數降冪排序
	List<SportMapBean>findTop3ByOrderBySportMapScoreDesc();
		
		
		
}
