package com.soeasy.repository.postRepository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;

import com.soeasy.model.PostBean;
import com.soeasy.model.PostCategoryBean;

public interface PostRepository extends JpaRepository<PostBean, Integer> {

	// 抓分頁一頁有哪些文章，依照PostCategoryId(PostBean裡PostCategoryId欄位名稱為PostCategoryBean)
	Page<PostBean> findByPostCategoryBean(PostCategoryBean postCategoryBean, Pageable pageable);

	// 抓一個分類裡有多少個文章總數(搭配抓分頁一頁有哪些文章，依照PostCategoryId用)
	Long countByPostCategoryBean(PostCategoryBean postCategoryBean);
//	
//	 查詢所有文章的 TOP3
//	List<PostBean> findTop3(Sort sort);
	
	// 查詢類別文章的 TOP10
	List<PostBean> findTop10ByPostCategoryBean(PostCategoryBean postCategoryBean,Sort sort);
	
	
	
	
	
	
	
	
	
	
	
//	List<PostBean> findByPostId(Integer postId);
////	
//	
//	// 查詢文章類別的 TOP3
//	List<PostBean> findTop3ByPostCategory(Sort sort);
//	
//	// 查詢文章類別的 TOP10
//	List<PostBean> findTop10ByPostCategory(Sort sort);

}
