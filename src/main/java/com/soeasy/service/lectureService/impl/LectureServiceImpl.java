package com.soeasy.service.lectureService.impl;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.soeasy.model.LectureBean;
import com.soeasy.repository.lectureRepository.LectureRepository;
import com.soeasy.service.lectureService.LectureService;
import com.soeasy.service.lecturerService.LecturerService;
import com.soeasy.util.GlobalService;

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
		return lectureRepository.getById(lectureId);
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

	// 依據講座日期更新講座狀態
	@Override
	public List<LectureBean> updateLectureStatus() {
		List<LectureBean> lectures = lectureRepository.findAll();
		for (LectureBean lectureBean : lectures) {
			
			//以下依日期判斷
			Date date = new Date(System.currentTimeMillis());
			if ((date.getTime() - lectureBean.getLectureDate().getTime()) / (86400000 * 1) >= 1) {
				System.out.println("精彩回顧");
				lectureBean.setLectureStatus(GlobalService.LECTURE_STATUS_ARCHIVED);
			} else if ((date.getTime() - lectureBean.getLectureDate().getTime()) / (86400000 * 1) == 0) {
				System.out.println("現正進行");
				lectureBean.setLectureStatus(GlobalService.LECTURE_STATUS_ONGOING);
			} else if ((date.getTime() - lectureBean.getLectureDate().getTime()) < 0) {
				System.out.println("即將舉辦");
				lectureBean.setLectureStatus(GlobalService.LECTURE_STATUS_UPCOMING);
			}
			lectureRepository.save(lectureBean);
		}
		return lectures;
	}
}
