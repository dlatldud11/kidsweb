package kids.board.diet.model;

public class Diet {
	private String regdate;
	private String bf;
	private String lc;
	private String dn;
	private String bffiles;
	private String lcfiles;
	private String dnfiles;
	private String dsfiles;
	
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getBf() {
		return bf;
	}
	public void setBf(String bf) {
		this.bf = bf;
	}
	public String getLc() {
		return lc;
	}
	public void setLc(String lc) {
		this.lc = lc;
	}
	public String getDn() {
		return dn;
	}
	public void setDn(String dn) {
		this.dn = dn;
	}
	public String getBffiles() {
		return bffiles;
	}
	public void setBffiles(String bffiles) {
		this.bffiles = bffiles;
	}
	public String getLcfiles() {
		return lcfiles;
	}
	public void setLcfiles(String lcfiles) {
		this.lcfiles = lcfiles;
	}
	public String getDnfiles() {
		return dnfiles;
	}
	public void setDnfiles(String dnfiles) {
		this.dnfiles = dnfiles;
	}
	public String getDsfiles() {
		return dsfiles;
	}
	public void setDsfiles(String dsfiles) {
		this.dsfiles = dsfiles;
	}
	
	public Diet() {
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Diet [regdate=" + regdate + ", bf=" + bf + ", lc=" + lc + ", dn=" + dn + ", bffiles=" + bffiles
				+ ", lcfiles=" + lcfiles + ", dnfiles=" + dnfiles + ", dsfiles=" + dsfiles + "]";
	}
	
	
}
