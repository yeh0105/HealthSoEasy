package com.soeasy.repository.postRepository;

import java.util.List;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;

import com.soeasy.model.PostBean;

public interface PostRepository extends JpaRepository<PostBean, Integer> {

	
//	Sort sort = Sort.by(Direction.DESC, field2, field2)

//	List<PostBean> findByPostId(Integer postId);
	
//	// 查詢文章依類別
//	List<PostBean> findByPostCategory(Sort sort);
////	
//	// 查詢所有類別的 TOP3
//	List<PostBean> findTop3(Sort sort);
//	
//	// 查詢文章類別的 TOP3
//	List<PostBean> findTop3ByPostCategory(Sort sort);
//	
//	// 查詢文章類別的 TOP10
//	List<PostBean> findTop10ByPostCategory(Sort sort);
	

}
