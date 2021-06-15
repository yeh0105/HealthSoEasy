package com.soeasy.service.postService.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.soeasy.model.PostBean;
import com.soeasy.repository.postRepository.PostRepository;
import com.soeasy.service.postService.PostService;

@Transactional
@Service
public class PostServiceImpl implements PostService {
	
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
//		return null;
		return postRepository.findByPostId(postId).get(postId);
	}

	@Override
	public List<PostBean> findAllByPostId() {
		return postRepository.findAll();
	}

	@Override
	public void updatePost(PostBean postBean) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteByPostId(Integer postId) {
		postRepository.deleteById(postId);
	}

	
}
