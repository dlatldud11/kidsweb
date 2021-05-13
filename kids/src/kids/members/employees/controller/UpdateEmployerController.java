package kids.members.employees.controller;

import java.io.IOException;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kids.common.controller.SuperClass;
import kids.members.employees.model.Employees;
import kids.members.employees.model.EmployeesDao;

public class UpdateEmployerController extends SuperClass {
	Employees bean = null;
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doGet(request, response);
		
		String tid = request.getParameter("tid");
		EmployeesDao dao = new EmployeesDao();
		Employees bean = dao.DetailData(tid);
		
		System.out.println(bean);
		
		request.setAttribute("bean", bean);
		
		String gotopage = "/employees/empUpdate.jsp";
		super.GotoPage(gotopage);
		
	}
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doPost(request, response);
		
		bean = new Employees();
		
		bean.setTid(request.getParameter("tid"));
		bean.setAddress1(request.getParameter("address1"));
		bean.setAddress2(request.getParameter("address2"));
		bean.setBirth(request.getParameter("birth"));
		bean.setEmail(request.getParameter("email"));
		bean.setGender(request.getParameter("gender"));
		bean.setHp(request.getParameter("hp"));
		bean.setImage(request.getParameter("image"));
		bean.setName(request.getParameter("name"));
		bean.setPassword(request.getParameter("password"));
		bean.setZipcode(request.getParameter("zipcode"));
		bean.setClass_id(Integer.parseInt(request.getParameter("class_id")));
		bean.setSubject_code(Integer.parseInt(request.getParameter("subject_code")));
		bean.setSalary(Integer.parseInt(request.getParameter("salary")));
		bean.setResponsibilities(request.getParameter("responsibilities"));
		
		EmployeesDao dao = new EmployeesDao();
		
		if(this.validate(request) == true) {
			System.out.println("직원정보 수정이 완료되었습니다.");
			int cnt = -99999;
			cnt = dao.UpdateData(bean);
			
			System.out.println("cnt : " + cnt);
			
			String gotopage = "/employees/empDetail.jsp";
			super.GotoPage(gotopage);
			
		} else {
			System.out.println("수정 실패");
			
			request.setAttribute("bean", bean);
			
			String gotopage = "/employees/empUpdate.jsp";
			super.GotoPage(gotopage);
		}
	}
		
	@Override
	public boolean validate(HttpServletRequest request) {
		boolean isCheck = true;
		System.out.println(bean);
		
		if(bean.getBirth() == null || bean.getBirth().equals("")) {
			System.out.println(isCheck);
			request.setAttribute(super.PREFIX + "birth", "생일은 반드시 입력되어야 합니다.");
			isCheck = false;
		}
		String inputdate = "\\d{4}[-/]\\d{2}[-/]\\d{2}";
		
		boolean result = Pattern.matches(inputdate, bean.getBirth());
		if(result == false) {
			System.out.println(isCheck);
			request.setAttribute(super.PREFIX + "birth", "생일은 'yyyy/mm/dd'형식으로 입력해 주세요.");
			isCheck = false;
		}
		if(bean.getPassword().length() < 4 || bean.getPassword().length() > 12) {
			System.out.println(isCheck);
			request.setAttribute(super.PREFIX + "password", "비밀번호는 4자리 이상 12자리 이하여야 합니다.");
			isCheck = false;
		}
		if(bean.getName().length() < 2 || bean.getName().length() > 10) {
			System.out.println(isCheck);
			request.setAttribute(super.PREFIX + "name", "이름 2자리 이상 10자리 이하여야 합니다.");
			isCheck = false;
		}
		System.out.println(isCheck);
		return isCheck;
	}
}
