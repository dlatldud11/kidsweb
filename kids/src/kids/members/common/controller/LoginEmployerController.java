package kids.members.common.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kids.common.controller.MainController;
import kids.common.controller.SuperClass;
import kids.members.employees.model.Employees;
import kids.members.employees.model.EmployeesDao;

public class LoginEmployerController extends SuperClass {

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doPost(request, response);
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		System.out.println(id + "/" + password);
		
		EmployeesDao dao = new EmployeesDao();
		Employees bean = dao.SelectData(id, password);
		
		String gotopage = "";
		
		if(bean == null) {
			System.out.println("로그인에 실패하였습니다.");
			String message = "가입되지 않은 아니디거나 비밀번호가 일치하지 않습니다.";
			super.setErrorMessage(message);
			
			request.setAttribute("id", id);
			
			gotopage = "/start.jsp";
			super.GotoPage(gotopage);
		}else {
			System.out.println("로그인에 성공하셨습니다.");
			
			new MainController().doGet(request, response);
		}
		
		
		
	}
}