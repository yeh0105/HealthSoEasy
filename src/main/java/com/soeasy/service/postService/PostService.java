package com.soeasy.service.postService;

import java.util.List;
import java.util.Map;

import com.soeasy.model.PostBean;

public interface PostService {

//	// 查詢文章依類別
//	List<PostBean> findByPostCategory(Sort sort);
//
//	// 查詢所有類別的 TOP3
//	List<PostBean> findTop3(Sort sort);
//
//	// 查詢文章類別的 TOP3
//	List<PostBean> findTop3ByPostCategory(Sort sort);
//
//	// 查詢文章類別的 TOP10
//	List<PostBean> findTop10ByPostCategory(Sort sort);

	// 新增文章
	void addPost(PostBean postBean);

	// 查詢一筆By ID
	PostBean findByPostId(Integer postId);

	// 查詢全部
	List<PostBean> findAllByPostId();

	// 修改
	void updatePost(PostBean postBean);

	// 刪除
	void deleteByPostId(Integer postId);

	// 抓分頁一頁有哪些地圖
	Map<Integer, PostBean> getPagePosts(int pageNo);

	// 抓資料庫裡全部有幾個地圖
	Long getRecordCounts();

	// 總共有幾頁
	Integer getTotalPages();
}
