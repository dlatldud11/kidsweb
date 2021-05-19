package kids.management.st_total.stu_fee.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kids.common.controller.SuperClass;
import kids.management.st_total.stu_fee.model.Stu_fee2;
import kids.management.st_total.stu_fee.model.Stu_feeDao;

public class UpdateStudentFeeController extends SuperClass {
 @Override
public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	super.doGet(request, response);
	System.out.println("업데이트 stf 들어옴");
	String[] payno = request.getParameterValues("payno");
	//int remark = Integer.parseInt(request.getParameter("remark"));
	if(validate(request)) {
		Stu_feeDao dao = new Stu_feeDao();
		Stu_fee2 bean = null;
		int cnt = -99999;
		cnt = dao.UpdateData(payno);
	}
	new ListStudentFeeController().doGet(request, response);
}@Override
	public boolean validate(HttpServletRequest request) {
	boolean check = false;
	if(request.getParameter("state").equals("완납")) {
		String[] payno = request.getParameterValues("payno");
		Stu_feeDao dao = new Stu_feeDao();
		Stu_fee2 bean = null;
		int cnt = -99999;
		cnt = dao.SelectDataByPk(payno);//분납 찾기
		if(cnt == 1) {
			System.out.println("'분납'은 완납처리를 할 수 없습니다.");
			request.setAttribute(super.PREFIX + "remark", "'분납'은 완납처리를 할 수 없습니다.");
			check = false;
		}else {
			check = true;
		}
	}
	
		return check;
	}
}
