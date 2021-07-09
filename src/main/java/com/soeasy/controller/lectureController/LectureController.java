package com.soeasy.controller.lectureController;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.soeasy.model.LectureBean;
import com.soeasy.service.lectureService.LectureService;
import com.soeasy.util.GlobalService;

@Controller
@RequestMapping("/lectureController")
public class LectureController {

	@Autowired
	LectureService lectureService;

	@Autowired
	ServletContext servletContext;

	// 查詢所有講座
	@GetMapping("/getAllLectures")
	public String getAllLectures(Model model) {
		model.addAttribute("lectures", lectureService.getAllByLectureId());

		return "lecture/getAllLectures";
	}

	// 查詢單筆講座
	@GetMapping(value = "/lecture/{lectureId}")
	public String getOneByLectureId(@PathVariable("lectureId") Integer lectureId, Model model) {
		LectureBean lectureBean = lectureService.getOneByLectureId(lectureId);
		model.addAttribute("lectureBean", lectureBean);
		return "/lecture/lectureIndex";
	}

	// 讀圖轉成位元組陣列
	@RequestMapping(value = "/getLectureImage/{lectureId}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getImage(HttpServletRequest resp, @PathVariable Integer lectureId) {
		LectureBean lectureBean = lectureService.getOneByLectureId(lectureId);

		Blob customerImg = lectureBean.getLectureImg();

		InputStream is = null;
		String fileName = null;
		byte[] media = null;
		ResponseEntity<byte[]> responseEntity = null;

		try {
			if (customerImg != null) {
				is = customerImg.getBinaryStream();
			}
			// 如果圖片的來源有問題，就送回預設圖片(/images/salad.png)
			if (is == null) {
				fileName = "salad.png";
				is = servletContext.getResourceAsStream("/images/" + fileName);
			}

			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			// 由InputStream讀取位元組，然後由OutputStream寫出
			int len = 0;
			byte[] bytes = new byte[8192];

			while ((len = is.read(bytes)) != -1) {
				baos.write(bytes, 0, len);
			}

			media = baos.toByteArray();
			responseEntity = new ResponseEntity<>(media, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (is != null)
					is.close();
			} catch (IOException e) {
				;
			}
		}
		return responseEntity;
	}

	// 查詢所有精彩回顧
		@GetMapping("/lecture/archivedLectures")
		public String lectureIndex(Model model) {
			List<LectureBean> archivedLectures = lectureService.findByLectureStatus(GlobalService.LECTURE_STATUS_ARCHIVED);
			model.addAttribute("archivedLectures", archivedLectures);
			return "/lecture/archivedLectures";
		}
}
