package com.soeasy.service.sportmapService.impl;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.soeasy.model.SportMapBean;
import com.soeasy.repository.sportmapRepository.SportMapRepository;
import com.soeasy.service.sportmapService.SportMapService;

@Service
public class SportMapServiceImpl implements SportMapService {
	private static final Logger logger = LoggerFactory.getLogger(SportMapServiceImpl.class);

//	private int recordsPerPage = GlobalService.SPORTMAPS_PER_PAGE; // 預設值：每頁9筆
	private int recordsPerPage = 9; // 預設值：每頁9筆
	private int totalPages = -1;

	@Autowired
	SportMapRepository sportMapRepository;
	
	
	//新增地圖
	@Override
	public SportMapBean save(SportMapBean sportMapBean) {
		return sportMapRepository.save(sportMapBean);
	}	
	

	
	@Transactional
	@Override
	public Map<Integer, SportMapBean> getPageSportMaps(int pageNo) {

		Map<Integer, SportMapBean> map = new LinkedHashMap<>();
		// PageRequest.of(pageNo, recordsPerPage): 第一個參數為 0-based
		Pageable pageable = PageRequest.of(pageNo - 1, recordsPerPage);
		Page<SportMapBean> beans = sportMapRepository.findAll(pageable);

		List<SportMapBean> list = beans.getContent();
		for (SportMapBean bean : list) {
			map.put(bean.getSportMapId(), bean);
		}
		return map;
	}


	//
	@Override
	public Long getRecordCounts() {
		
		return sportMapRepository.count();
	}

	@Transactional
	@Override
	public Integer getTotalPages() {
		totalPages = (int) (Math.ceil(getRecordCounts() / (double) recordsPerPage));
		logger.info("totalPages=" + totalPages);
		return totalPages;
		

	}
	
//	@Override
//	public Integer getRecordsPerPage() {
//		return recordsPerPage; //記得開啟

//	}

}