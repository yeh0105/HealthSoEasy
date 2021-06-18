package com.soeasy.service.mallService.impl;

import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soeasy.model.ProductBean;
import com.soeasy.repository.mallRepository.ProductRepository;
import com.soeasy.repository.mallRepository.ShopRepository;
import com.soeasy.repository.mallRepository.impl.ProductUpdateImpl;
import com.soeasy.service.mallService.MallPorductService;
import com.soeasy.util.GlobalService;

@Service
public class MallproductServiceImpl implements MallPorductService{

//private static final Logger logger = LoggerFactory.getLogger(MallproductServiceImpl.class);
	
	private static final int MAX_FILENAME_LENGTH = 255;
	private int recordsPerPage = GlobalService.RECORDS_PER_PAGE; // 預設值：每頁三筆
	private int totalPages = -1;

	String selected = "";
	

	@Autowired
	ProductUpdateImpl  productUpdateImpl;  
	
	@Autowired
	ProductRepository productRepository;
	
	@Autowired
	ShopRepository shopRepository;
	
	public MallproductServiceImpl() {
		super();
	}
	
	
	//刪除
	
	@Transactional
	@Override
	public int deleteProduct(int no) {
		
		int n = 0;
		productRepository.deleteById(no);
		n++;
		return n;
	}

	@Transactional
	@Override
	public ProductBean getProduct(int productId) {
		ProductBean bean=productRepository.getById(productId);
		return bean;
	}

	@Override
	public List<String> getCategory() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getCategoryTag() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<Integer, ProductBean> getPageProducts(int pageNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getRecordsPerPage() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public long getRecordCounts() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getTotalPages() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int saveProduct(ProductBean bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void setRecordsPerPage(int recordsPerPage) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void setSelected(String category) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int updateProduct(ProductBean bean, long sizeInBytes) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void truncateProductTable() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int updateProductForeignKey(Integer companyId, Integer productId) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public Map<Integer, ProductBean> getPageProducts(Integer pageNo) {
		// TODO Auto-generated method stub
		return null;
	}

	
}
