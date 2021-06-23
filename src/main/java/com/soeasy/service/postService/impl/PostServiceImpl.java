package com.soeasy.service.postService.impl;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.soeasy.model.PostBean;
import com.soeasy.repository.postRepository.PostRepository;
import com.soeasy.service.postService.PostService;
import com.soeasy.util.GlobalService;

@Transactional
@Service
public class PostServiceImpl implements PostService {
	
	// 建立Logger
	private static final Logger logger = LoggerFactory.getLogger(PostServiceImpl.class);

	private int recordsPerPage = GlobalService.POSTS_PER_PAGE; // 預設值：每頁109筆
//	private int recordsPerPage = 10; // 預設值：每頁10筆
	private int totalPages = -1;

	@Autowired
	PostRepository postRepository;

	public PostServiceImpl() {
	}

	@Override
	public void addPost(PostBean postBean) {
		postRepository.save(postBean);
	}

	@Override
	public PostBean findByPostId(Integer postId) {
		Optional<PostBean> optional = postRepository.findById(postId);
		PostBean postBean = null;
		if (optional.isPresent()) {
			postBean = optional.get();
		} else {
			throw new RuntimeException("PostBean(postId=" + postId + ")不存在");

		}
		System.out.println("service ID=" + postId);
		return postBean;
	}

	@Override
	public List<PostBean> findAllByPostId() {
		return postRepository.findAll();
	}

	@Override
	public void updatePost(PostBean postBean) {
		postRepository.save(postBean);
	}

	@Override
	public void deleteByPostId(Integer postId) {
		postRepository.deleteById(postId);
	}

//	@Override
//	public List<PostBean> findByPostCategory(Sort sort) {
//		return postRepository.findByPostCategory(sort);
//	}
//
//	@Override
//	public List<PostBean> findTop3(Sort sort) {
//		return postRepository.findTop3(sort);
//	}
//
//	@Override
//	public List<PostBean> findTop3ByPostCategory(Sort sort) {
//		return postRepository.findTop3ByPostCategory(sort);
//	}
//
//	@Override
//	public List<PostBean> findTop10ByPostCategory(Sort sort) {
//		// TODO Auto-generated method stub
//		return postRepository.findTop10ByPostCategory(sort);
//	}

//	@Override
//	public Map<String, Object> getPagePosts(int pageNo) {
//		System.err.println("進入service");
//		
//		Map<String, Object> map = new LinkedHashMap<>();
//		// PageRequest.of(pageNo, recordsPerPage): 第一個參數為 0-based
//		Pageable pageable = PageRequest.of(pageNo - 1, recordsPerPage);
//		System.err.println("pageNo="+pageNo);
//		System.err.println("pageable="+pageable);
//		
//		Page<PostBean> beans = postRepository.findAll(pageable);
////		System.err.println("beans="+beans);
//
//		//PostBean的List
//		List<PostBean> list = beans.getContent();
////		System.err.println("list="+list);
//		
//		for (PostBean bean : list) {
//			map.put(bean.getPostId().toString(), bean);
//		}
//		
////		System.err.println("map=++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
//		System.err.println("map="+map);
//		
//		System.err.println("出去service");
//		return map;
//	}
	
	@Override
	public Map<Integer, PostBean> getPagePosts(int pageNo) {
//		System.err.println("進入service");
		
		Map<Integer, PostBean> map = new LinkedHashMap<>();
		// PageRequest.of(pageNo, recordsPerPage): 第一個參數為 0-based
		Pageable pageable = PageRequest.of(pageNo - 1, recordsPerPage);
//		System.err.println("pageNo="+pageNo);
//		System.err.println("pageable="+pageable);
		
		Page<PostBean> beans = postRepository.findAll(pageable);
//		System.err.println("beans="+beans);

		//PostBean的List
		List<PostBean> list = beans.getContent();
//		System.err.println("list="+list);
		
		for (PostBean bean : list) {
			map.put(bean.getPostId(), bean);
		}
		
//		System.err.println("map=++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
//		System.err.println("map="+map);
		
//		System.err.println("出去service");
		return map;
	}

	@Override
	public Long getRecordCounts() {
		return postRepository.count();
	}

	@Override
	public Integer getTotalPages() {
		totalPages = (int) (Math.ceil(getRecordCounts() / (double) recordsPerPage));
		logger.info("totalPages=" + totalPages);
		return totalPages;
	}

}
