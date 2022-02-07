package kr.co.goodee39.vo;

public class FestaVO {
	int festaid;
	int themecode;
	String region;
	String contentid;
	String title;
	String firstimage;
	String firstimage2;
	String mapx;
	String mapy;
	String mlevel;
	String overview;
	String eventstartdate;
	String eventenddate;
	String sponsor1tel;
	int start;
	int count;
	
	
	public FestaVO() {
		// TODO Auto-generated constructor stub
		this.start = 0; 
		this.count = 9;
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
	public int getFestaid() {
		return festaid;
	}
	public void setFestaid(int festaid) {
		this.festaid = festaid;
	}
	public int getThemecode() {
		return themecode;
	}
	public void setThemecode(int themecode) {
		this.themecode = themecode;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public String getContentid() {
		return contentid;
	}
	public void setContentid(String contentid) {
		this.contentid = contentid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getFirstimage() {
		return firstimage;
	}
	public void setFirstimage(String firstimage) {
		this.firstimage = firstimage;
	}
	public String getFirstimage2() {
		return firstimage2;
	}
	public void setFirstimage2(String firstimage2) {
		this.firstimage2 = firstimage2;
	}
	public String getMapx() {
		return mapx;
	}
	public void setMapx(String mapx) {
		this.mapx = mapx;
	}
	public String getMapy() {
		return mapy;
	}
	public void setMapy(String mapy) {
		this.mapy = mapy;
	}
	public String getMlevel() {
		return mlevel;
	}
	public void setMlevel(String mlevel) {
		this.mlevel = mlevel;
	}
	public String getOverview() {
		return overview;
	}
	public void setOverview(String overview) {
		this.overview = overview;
	}
	public String getEventstartdate() {
		return eventstartdate;
	}
	public void setEventstartdate(String eventstartdate) {
		this.eventstartdate = eventstartdate;
	}
	public String getEventenddate() {
		return eventenddate;
	}
	public void setEventenddate(String eventenddate) {
		this.eventenddate = eventenddate;
	}
	public String getSponsor1tel() {
		return sponsor1tel;
	}
	public void setSponsor1tel(String sponsor1tel) {
		this.sponsor1tel = sponsor1tel;
	}
	
}
