package kr.co.goodee39.vo;

public class AttachImageVO {
	
	/* 경로 */
	private String uploadPath;
	
	/* uuid */
	private String uuid;
	
	/* 파일 이름 */
	private String fileName;
	
	/* 코스 id */
	private int mycoursecommonid;

	public String getUploadPath() {
		return uploadPath;
	}

	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public int getMycoursecommonid() {
		return mycoursecommonid;
	}

	public void setMycoursecommonid(int mycoursecommonid) {
		this.mycoursecommonid = mycoursecommonid;
	}
	
	
	
	
		
}
