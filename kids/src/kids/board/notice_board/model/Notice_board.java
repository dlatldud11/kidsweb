package kids.board.notice_board.model;

import java.util.Date;

public class Notice_board {
	
	private int notino ;
	private String tid ;
	private String title ;
	private String content ;
	private String files ; 
	private Date regdate ;
	private int class_id ;
	private int readhit ;
	private String remark ;
	
	public Notice_board() {}

	public int getNotino() {
		return notino;
	}

	public void setNotino(int notino) {
		this.notino = notino;
	}

	public String getTid() {
		return tid;
	}

	public void setTid(String tid) {
		this.tid = tid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getFiles() {
		return files;
	}

	public void setFiles(String files) {
		this.files = files;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public int getClass_id() {
		return class_id;
	}

	public void setClass_id(int class_id) {
		this.class_id = class_id;
	}

	public int getReadhit() {
		return readhit;
	}

	public void setReadhit(int readhit) {
		this.readhit = readhit;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@Override
	public String toString() {
		return "Notice_board [notino=" + notino + ", tid=" + tid + ", title=" + title + ", content=" + content
				+ ", files=" + files + ", regdate=" + regdate + ", class_id=" + class_id + ", readhit=" + readhit
				+ ", remark=" + remark + "]";
	}
	
	
	

}
