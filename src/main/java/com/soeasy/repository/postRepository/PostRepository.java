package com.soeasy.repository.postRepository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.soeasy.model.PostBean;

public interface PostRepository extends JpaRepository<PostBean, Integer> {

//	List<PostBean> findByPostId(Integer postId);

	@Query("SELECT DISTINCT postCategory FROM PostBean")
	List<String> findDistinctPostCategory();

}
