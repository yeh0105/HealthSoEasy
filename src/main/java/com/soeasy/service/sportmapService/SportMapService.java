package com.soeasy.service.sportmapService;

import java.util.List;
import java.util.Map;

import com.soeasy.model.SportMapBean;

public interface SportMapService {
	
	// 依SportMapId來刪除單筆記錄
		int deleteSportMap(int no);
		
	
	// 依sportMapId來查詢單筆記錄
		SportMapBean getSportMap(int sportMapId);

	// 取出所有的運動地點類型(要加Repository)
		List<String> getSportCategory();
		
	// 新增一筆記錄
		Integer saveSportMap(SportMapBean bean);
		
	// 抓分頁一頁有哪些地圖
		Map<Integer, SportMapBean> getPageSportMaps(int pageNo);
		
	// 抓一頁有幾張地圖
//		Integer getRecordsPerPage();
	// 抓資料庫裡全部有幾個地圖
		Long getRecordCounts();
	// 總共有幾頁
		Integer getTotalPages();
		
	
	
	
		
		
		
		
		
		
}
