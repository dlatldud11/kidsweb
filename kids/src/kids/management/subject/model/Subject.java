 package kids.management.subject.model;

public class Subject {
	private int subject_code ;
	private String subject ;
	private String tid ;
	private String remark ;
	
	public Subject() {}
	
	public int getSubject_code() {
		return subject_code;
	}
	public void setSubject_code(int subject_code) {
		this.subject_code = subject_code;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	@Override
	public String toString() {
		return "Subject [subject_code=" + subject_code + ", subject=" + subject + ", tid=" + tid + ", remark=" + remark
				+ "]";
	}
	
	
}
