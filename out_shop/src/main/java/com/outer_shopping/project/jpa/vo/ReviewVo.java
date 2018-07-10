/*package com.outer_shopping.project.jpa.vo;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.Size;

import lombok.Data;

@Entity
@Table(name="REVIEW")
@SequenceGenerator(name = "REVIEW_SEQ_GENERATOR", sequenceName = "REVIEW_NO_SEQ", initialValue = 1, allocationSize = 1)
@Data
public class ReviewVo implements Serializable {

	@Id
	@Column(name="REVIEW_NO", nullable=false, length=10)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "REVIEW_SEQ_GENERATOR")
	private int reviewNo; 	// 번호

	@Column(name="REVIEW_SUBJECT", nullable=false, length=500)
	private String subject;	//제목
	
	@Column(name="REVIEW_CONTENT", nullable=false, length=1000)
	private String content;	//내용
	
	@Column(name="PICTURE_NAME", length=500)
	private String pictureName;	//사진
	
	@Column(name="THUMBNAIL_NAME", length=500)
	private String thumbnailName; //썸내일사진
	
	@Column(name="STAR", nullable=false, length=10)
	private int star;	//별점

	@Column(name="REVIEW_DATE", nullable=false)
	private Date reivewDate;	//작성일
	
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MEMBER_ID")
	private MemberVo member;	//작성자
	
	
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "OUTER_NO")
	private OuterVo outer;	//작성자
	
	
	public ReviewVo() {}
	
	public ReviewVo(ReviewDTO review) {
		this.reviewNo = review.getReviewNo();
		this.subject = review.getSubject();
		this.content = review.getContent();
		this.pictureName = review.getPictureName();
		this.thumbnailName = review.getThumbnailName();
		this.star = review.getStar();
		this.reivewDate = review.getReivewDate();
		this.member = review.getMember();
		this.outer = review.getOuter();
	}

}

*/