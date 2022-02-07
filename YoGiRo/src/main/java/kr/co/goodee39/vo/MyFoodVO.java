package kr.co.goodee39.vo;

public class MyFoodVO {
	int myfoodid;
	int themecode;
	String userid;
	String myfoodname;
	String myfoodaddress;
	String myfoodimg;
	String myfooddetail;
	String isdelete;
	String region;
	int start;
	int count;
	
	public MyFoodVO() {
		// TODO Auto-generated constructor stub
		this.start = 0;
		this.count = 12;
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


	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public int getMyfoodid() {
		return myfoodid;
	}
	public void setMyfoodid(int myfoodid) {
		this.myfoodid = myfoodid;
	}
	public int getThemecode() {
		return themecode;
	}
	public void setThemecode(int themecode) {
		this.themecode = themecode;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getMyfoodname() {
		return myfoodname;
	}
	public void setMyfoodname(String myfoodname) {
		this.myfoodname = myfoodname;
	}
	public String getMyfoodaddress() {
		return myfoodaddress;
	}
	public void setMyfoodaddress(String myfoodaddress) {
		this.myfoodaddress = myfoodaddress;
	}
	public String getMyfoodimg() {
		return myfoodimg;
	}
	public void setMyfoodimg(String myfoodimg) {
		this.myfoodimg = myfoodimg;
	}
	public String getMyfooddetail() {
		return myfooddetail;
	}
	public void setMyfooddetail(String myfooddetail) {
		this.myfooddetail = myfooddetail;
	}
	public String getIsdelete() {
		return isdelete;
	}
	public void setIsdelete(String isdelete) {
		this.isdelete = isdelete;
	}
}
