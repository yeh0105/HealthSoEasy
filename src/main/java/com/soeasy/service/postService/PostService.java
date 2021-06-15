package com.soeasy.service.postService;

import java.util.List;

import com.soeasy.model.PostBean;

public interface PostService {
	// 新增文章
	void addPost(PostBean postBean);

	// 查詢一筆
	PostBean findByPostId(Integer postId);
	
	// 查詢全部
	List<PostBean> findAllByPostId();
	
	// 修改
	void updatePost(PostBean postBean);
	// 刪除
	void deleteByPostId(Integer postId);

//	// 抓分頁一頁有哪些地圖
//	Map<Integer, PostBean> getPagePost(int pageNo);
//
//	// 抓資料庫裡全部有幾個地圖
//	Long getRecordCounts();
//
//	// 總共有幾頁
//	Integer getTotalPages();
}
