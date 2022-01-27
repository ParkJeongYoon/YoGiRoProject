package kr.co.goodee39.vo;

public class QuestionVO {
	private int qnum;
	private String userid;
	private String qtitle;
	private String qcreatedate;
	private String qcontent;
	private String isdelete;
	private int start;
	private int count;
	
	
	public QuestionVO() {
		this.start = 0;
		this.count = 10;
	}
	public int getQnum() {
		return qnum;
	}
	public void setQnum(int qnum) {
		this.qnum = qnum;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getQtitle() {
		return qtitle;
	}
	public void setQtitle(String qtitle) {
		this.qtitle = qtitle;
	}
	public String getQcreatedate() {
		return qcreatedate;
	}
	public void setQcreatedate(String qcreatedate) {
		this.qcreatedate = qcreatedate;
	}
	public String getQcontent() {
		return qcontent;
	}
	public void setQcontent(String qcontent) {
		this.qcontent = qcontent;
	}
	public String getIsdelete() {
		return isdelete;
	}
	public void setIsdelete(String isdelete) {
		this.isdelete = isdelete;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	
}
