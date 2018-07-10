package com.outer_shopping.project.vo;

import java.io.Serializable;
import java.sql.Date;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.Size;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ReviewVo implements Serializable {

	private int reviewNo; 	// 번호

	private String subject;	//제목

	private String content;	//내용
	
	private String pictureName;	//사진
	
	private String thumbnailName; //썸내일사진

	private int star;	//별점 

	private Date reviewDate;	//작성일 
	
	private String memberId;	//작성자

	private int outerNo;		//아웃터 번호 
	
	private OuterVo Outer;
	
	private MultipartFile imageFile;

	public ReviewVo() {}
	
	public ReviewVo(int reviewNo, String subject, String content, String pictureName, String thumbnailName, int star,
			Date reviewDate, String memberId, int outerNo) {
		this.reviewNo = reviewNo;
		this.subject = subject;
		this.content = content;
		this.pictureName = pictureName;
		this.thumbnailName = thumbnailName;
		this.star = star;
		this.reviewDate = reviewDate;
		this.memberId = memberId;
		this.outerNo = outerNo;
	}

	public ReviewVo(int reviewNo, String subject, String content, String pictureName, String thumbnailName, int star,
			Date reviewDate, String memberId, int outerNo, MultipartFile imageFile) {
		this.reviewNo = reviewNo;
		this.subject = subject;
		this.content = content;
		this.pictureName = pictureName;
		this.thumbnailName = thumbnailName;
		this.star = star;
		this.reviewDate = reviewDate;
		this.memberId = memberId;
		this.outerNo = outerNo;
		this.imageFile = imageFile;
	}
	
	public ReviewVo(int reviewNo, String subject, String content, String pictureName, String thumbnailName, int star,
			Date reviewDate, String memberId, int outerNo, OuterVo outer, MultipartFile imageFile) {
		this.reviewNo = reviewNo;
		this.subject = subject;
		this.content = content;
		this.pictureName = pictureName;
		this.thumbnailName = thumbnailName;
		this.star = star;
		this.reviewDate = reviewDate;
		this.memberId = memberId;
		this.outerNo = outerNo;
		Outer = outer;
		this.imageFile = imageFile;
	}




}

