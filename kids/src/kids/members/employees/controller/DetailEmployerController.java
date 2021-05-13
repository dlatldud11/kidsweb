package kids.members.employees.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kids.common.controller.SuperClass;
import kids.members.employees.model.Employees;
import kids.members.employees.model.EmployeesDao;

public class DetailEmployerController extends SuperClass {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doGet(request, response);
		
		String tid = request.getParameter("tid");
		EmployeesDao dao = new EmployeesDao();
		Employees bean = dao.DetailData(tid);
		
		System.out.println("bean : " + bean);
		request.setAttribute("bean", bean);
		
		String gotopage = "/employees/empDetail.jsp";
		super.GotoPage(gotopage);
		
	}
} 
