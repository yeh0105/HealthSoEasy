package com.soeasy.service.lecturerService.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.soeasy.model.LecturerBean;
import com.soeasy.model.PostBean;
import com.soeasy.repository.lecturerRepository.LecturerRepository;
import com.soeasy.repository.postRepository.PostRepository;
import com.soeasy.service.lecturerService.LecturerService;
import com.soeasy.service.postService.PostService;

@Transactional
@Service
public class LecturerServiceImpl implements LecturerService {
	
	@Autowired
	LecturerRepository lecturerRepository;

	public LecturerServiceImpl() {
	}

	@Override
	public void addLecturer(LecturerBean lecturerBean) {
		lecturerRepository.save(lecturerBean);
	}

	@Override
	public LecturerBean findByLecturerId(Integer lecturerId) {
		return lecturerRepository.findByLecturerId(lecturerId).get(lecturerId);
	}

	@Override
	public List<LecturerBean> findAllByLecturerId() {
		return lecturerRepository.findAll();
	}

	@Override
	public void updateLecturer(LecturerBean lecturerBean) {
		
	}

	@Override
	public void deleteByLecturerId(Integer lecturerId) {
		lecturerRepository.deleteById(lecturerId);
	}
}
