package kids.members.employees.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kids.common.controller.SuperClass;

public class EmpJoinController extends SuperClass {

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doPost(request, response);
		
		if (this.validate(request) == true) {
			System.out.println("가입신청이 완료되었습니다.");
			
			
			String gotopage = "/employees/empJoinForm.jsp";
			super.GotoPage(gotopage);
		} else {

		}
		
		
	}
	
	@Override
	public boolean validate(HttpServletRequest request) {
		// TODO Auto-generated method stub
		return super.validate(request);
	}
}
