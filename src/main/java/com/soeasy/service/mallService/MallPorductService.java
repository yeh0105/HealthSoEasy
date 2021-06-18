package com.soeasy.service.mallService;

import java.util.List;
import java.util.Map;

import com.soeasy.model.ProductBean;

public interface MallPorductService {
	
		// 依ProductId來刪除單筆記錄
		Integer deleteProduct(Integer no);
		
		// 依ProductId來查詢單筆記錄
		ProductBean getProduct(Integer productId);

		// 取出所有的類型
		List<String> getCategory();
		
		String getCategoryTag();
		
		Map<Integer, ProductBean> getPageProducts(Integer pageNo);
		
//		Integer getPageNo();
		
		Integer getRecordsPerPage();

		Long getRecordCounts();
		
		Integer getTotalPages();
		
		// 新增一筆記錄
		Integer saveProduct(ProductBean bean);

//		void setPageNo(int pageNo);

		void setRecordsPerPage(Integer recordsPerPage);

		void setSelected(String category);
		// 計算紀錄總筆數
		Integer updateProduct(ProductBean bean, Long sizeInBytes) ;

		void truncateProductTable();

		Integer updateProductForeignKey(Integer companyId, Integer productId);


	}


