package kids.management.sales_table.model;

import java.util.Date;

public class Sales_table {
	
	private int salesno ;
	private int payno ;
	private Date inputdate ;
	private int sales ;
	private int returns ;
	private String remark ;
	
	public Sales_table() {}

	public int getSalesno() {
		return salesno;
	}

	public void setSalesno(int salesno) {
		this.salesno = salesno;
	}

	public int getPayno() {
		return payno;
	}

	public void setPayno(int payno) {
		this.payno = payno;
	}

	public Date getInputdate() {
		return inputdate;
	}

	public void setInputdate(Date inputdate) {
		this.inputdate = inputdate;
	}

	public int getSales() {
		return sales;
	}

	public void setSales(int sales) {
		this.sales = sales;
	}

	public int getReturns() {
		return returns;
	}

	public void setReturns(int returns) {
		this.returns = returns;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@Override
	public String toString() {
		return "Sales_table [salesno=" + salesno + ", payno=" + payno + ", inputdate=" + inputdate + ", sales=" + sales
				+ ", returns=" + returns + ", remark=" + remark + "]";
	}
	
	

}
