package kids.board.medicine.model;

public class Medicine2 extends Medicine {
	private String name;
	private String class_name;
	private String sid;
	private int class_id;
	
	public Medicine2() {
		// TODO Auto-generated constructor stub
	}

	public int getClass_id() {
		return class_id;
	}

	public void setClass_id(int class_id) {
		this.class_id = class_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getClass_name() {
		return class_name;
	}

	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}

	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}
	
	
}
