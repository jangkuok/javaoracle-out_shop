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

	private int reviewNo = 0; 	// 번호

	@Size(min= 1, max= 500, message="제목을 작성하시오")
	private String subject;	//제목
	
	@Size(min= 1, max= 1000, message="내용을 작성하시오")
	private String content;	//내용
	
	private String pictureName = "";	//사진
	
	private String thumbnailName; //썸내일사진

	@Min(value=1, message="별점을 선택하세요")
	@Max(value=10, message="별점을 선택하세요")
	private int star;	//별점 ppp

	private Date reviewDate;	//작성일 
	
	private String memberId;	//작성자

	private String outerNo;		//아웃터 번호  ppp
	
	private MultipartFile imageFile;

	public ReviewVo() {}

	public ReviewVo(int reviewNo, @Size(min = 1, max = 500, message = "제목을 작성하시오") String subject,
			@Size(min = 1, max = 1000, message = "내용을 작성하시오") String content, String pictureName, String thumbnailName,
			@Min(value = 1, message = "별점을 선택하세요") @Max(value = 10, message = "별점을 선택하세요") int star, Date reviewDate,
			String memberId, String outerNo, MultipartFile imageFile) {
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
	
		
	
}

