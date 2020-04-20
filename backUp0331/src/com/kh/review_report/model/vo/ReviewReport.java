package com.kh.review_report.model.vo;

public class ReviewReport {
   /* REVIEW_REPORT_NO */
   private int reviewReportNo;

   /* REVIEW_NO */
   private int reviewNo;

   /* MEMBER_NO */
   private int memberNo;

   /* DATE */
   private Object date;

   /* CONTENT */
   private String content;

   /* REPORT_TYPE */
   private String reportType;

public int getReviewReportNo() {
	return reviewReportNo;
}

public void setReviewReportNo(int reviewReportNo) {
	this.reviewReportNo = reviewReportNo;
}

public int getReviewNo() {
	return reviewNo;
}

public void setReviewNo(int reviewNo) {
	this.reviewNo = reviewNo;
}

public int getMemberNo() {
	return memberNo;
}

public void setMemberNo(int memberNo) {
	this.memberNo = memberNo;
}

public Object getDate() {
	return date;
}

public void setDate(Object date) {
	this.date = date;
}

public String getContent() {
	return content;
}

public void setContent(String content) {
	this.content = content;
}

public String getReportType() {
	return reportType;
}

public void setReportType(String reportType) {
	this.reportType = reportType;
}

public ReviewReport(int reviewNo, int memberNo, String content, String reportType) {
	super();
	this.reviewNo = reviewNo;
	this.memberNo = memberNo;
	this.content = content;
	this.reportType = reportType;
}

public ReviewReport(int reviewReportNo, int reviewNo, int memberNo, Object date, String content, String reportType) {
	super();
	this.reviewReportNo = reviewReportNo;
	this.reviewNo = reviewNo;
	this.memberNo = memberNo;
	this.date = date;
	this.content = content;
	this.reportType = reportType;
}

}
