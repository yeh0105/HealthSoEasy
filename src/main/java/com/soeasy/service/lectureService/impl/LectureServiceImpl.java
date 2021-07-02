package com.soeasy.service.lectureService.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.soeasy.model.LectureBean;
import com.soeasy.repository.lectureRepository.LectureRepository;
import com.soeasy.service.lectureService.LectureService;
import com.soeasy.service.lecturerService.LecturerService;

@Transactional
@Service
public class LectureServiceImpl implements LectureService {
	
	@Autowired
	LectureRepository lectureRepository;

	public LectureServiceImpl() {
	}

	// 新增講座
	@Override
	public LectureBean addLecture(LectureBean lectureBean) {
		return lectureRepository.save(lectureBean);
	}

	// 查詢一筆講座
	@Override
	public LectureBean getOneByLectureId(Integer lectureId) {
		return lectureRepository.findByLectureId(lectureId).get(lectureId);
	}

	// 查詢全部講座
	@Override
	public List<LectureBean> getAllByLectureId() {
		return lectureRepository.findAll();
	}

	// 更新講座
	@Override
	public void updateLecture(LectureBean lectureBean) {
		lectureRepository.save(lectureBean);
	}

	// 刪除講座
	@Override
	public void deleteLecture(Integer lectureId) {
		lectureRepository.deleteById(lectureId);
	}
}
