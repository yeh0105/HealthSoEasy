package com.soeasy.service.sportmapService;

import java.util.List;
import java.util.Map;

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
		
		// 抓一頁有幾張地圖
//		Integer getRecordsPerPage();
		
		
	//更新地圖資料
	void update(SportMapBean sportMapBean);
	
	//刪除單筆地圖
	void delete(Integer sportMapId);
	
	
	//查詢所有地圖
	List<SportMapBean> getAllSportMaps();
	
	//查詢地圖By SportCategoryId(未寫完)
//	SportMapBean getSportMapsBySportCategoryId(Integer sportCategoryId);
	
	
	
	
	
	
		
		
		
		
		
		
}
