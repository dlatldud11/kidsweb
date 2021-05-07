package kids.board.timetable.model;

public class Timetable {
	private int no ;
	private int subject_code ;
	private int class_id ;
	private String time ;
	private String day ;
	private String remark ;
	
	public Timetable() {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getSubject_code() {
		return subject_code;
	}

	public void setSubject_code(int subject_code) {
		this.subject_code = subject_code;
	}

	public int getClass_id() {
		return class_id;
	}

	public void setClass_id(int class_id) {
		this.class_id = class_id;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@Override
	public String toString() {
		return "Timetable [no=" + no + ", subject_code=" + subject_code + ", class_id=" + class_id + ", time=" + time
				+ ", day=" + day + ", remark=" + remark + "]";
	}
	
	
}
