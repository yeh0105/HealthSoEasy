package com.soeasy.repository.postRepository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.soeasy.model.PostBean;

public interface PostRepository extends JpaRepository<PostBean, Integer> {
	
	List<PostBean> findByPostId(Integer postId);
	
}
