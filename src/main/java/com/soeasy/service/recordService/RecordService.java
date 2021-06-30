package com.soeasy.service.recordService;

import java.util.List;

import com.soeasy.model.RecordBean;

public interface RecordService {

			// 新增文章
			void addRecord(RecordBean recordBean);

			// 查詢一筆
			RecordBean findByRecordId(Integer recordId);
			
			// 查詢全部
			List<RecordBean> findAllByRecordId();
			
			// 修改
			void updateRecord(RecordBean recordBean);
			
			// 刪除
			void deleteByRecordId(Integer recordId);

			//查詢全部customerId
			List<RecordBean> findAllByCustomerId(Integer customerId);
}
