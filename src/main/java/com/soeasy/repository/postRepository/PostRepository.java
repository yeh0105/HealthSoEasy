package com.soeasy.repository.postRepository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.soeasy.model.PostBean;

public interface PostRepository extends JpaRepository<PostBean, Integer> {

//	List<PostBean> findByPostId(Integer postId);
	
//	// 查詢文章依類別
//	List<PostBean> findByPostCategory(Pageable pageable);
////	
//	// 查詢所有類別的 TOP3
//	List<PostBean> findTop3By(Pageable pageable);
//	
//	// 查詢文章類別的 TOP3
//	List<PostBean> findTop3ByPostCategory(Sort sort);
//	
//	// 查詢文章類別的 TOP10
//	List<PostBean> findTop10ByPostCategory(Sort sort);
	
}

