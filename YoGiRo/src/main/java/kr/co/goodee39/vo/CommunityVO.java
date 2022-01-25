package kr.co.goodee39.vo;

public class CommunityVO {
	private int comid;
	private int comcategorynum;
	private String comtitle;
	private String comcontent;
	private int compageview;
	private String comuserid;
	private String comcreatedate;
	private String comisdelete;
	private int start;
	private int count;
	
	public CommunityVO() {
		this.start = 0;
		this.count = 10;
	}
	public int getComid() {
		return comid;
	}
	public void setComid(int comid) {
		this.comid = comid;
	}
	public int getComcategorynum() {
		return comcategorynum;
	}
	public void setComcategorynum(int comcategorynum) {
		this.comcategorynum = comcategorynum;
	}
	public String getComtitle() {
		return comtitle;
	}
	public void setComtitle(String comtitle) {
		this.comtitle = comtitle;
	}
	public String getComcontent() {
		return comcontent;
	}
	public void setComcontent(String comcontent) {
		this.comcontent = comcontent;
	}
	public int getCompageview() {
		return compageview;
	}
	public void setCompageview(int compageview) {
		this.compageview = compageview;
	}
	public String getComuserid() {
		return comuserid;
	}
	public void setComuserid(String comuserid) {
		this.comuserid = comuserid;
	}
	public String getComcreatedate() {
		return comcreatedate;
	}
	public void setComcreatedate(String comcreatedate) {
		this.comcreatedate = comcreatedate;
	}
	public String getComisdelete() {
		return comisdelete;
	}
	public void setComisdelete(String comisdelete) {
		this.comisdelete = comisdelete;
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
