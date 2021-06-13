package com.soeasy.service.sportmapService;

import java.util.Map;

import com.soeasy.model.SportMapBean;

public interface SportMapService {

	//新增地圖
	SportMapBean save(SportMapBean sportMapBean);
	
		
	// 抓分頁一頁有哪些地圖
		Map<Integer, SportMapBean> getPageSportMaps(int pageNo);
	
	// 抓資料庫裡全部有幾個地圖
		Long getRecordCounts();
	// 總共有幾頁
		Integer getTotalPages();
		
		// 抓一頁有幾張地圖
//		Integer getRecordsPerPage();	
	
	
	
		
		
		
		
		
		
}
