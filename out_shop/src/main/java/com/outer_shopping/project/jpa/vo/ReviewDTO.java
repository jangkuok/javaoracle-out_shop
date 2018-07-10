/*
package com.outer_shopping.project.jpa.vo;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Size;

import lombok.Data;

@Data
public class ReviewDTO implements Serializable {
	
	private int reviewNo; 	// 번호

	@Size(min= 1, max= 500, message="제목을 작성하시오")
	private String subject;	//제목
	
	@Size(min= 1, max= 1000, message="내용을 작성하시오")
	private String content;	//내용
	
	private String pictureName;	//사진
	
	private String thumbnailName; //썸내일사진
	
	@Size(min= 0, max= 10, message="별점을 눌러주세요")
	private int star;	//별점

	private Date reivewDate;	//작성일
	
	private MemberVo member;	//작성자

	private OuterVo outer;	//아웃터 번호
}
*/