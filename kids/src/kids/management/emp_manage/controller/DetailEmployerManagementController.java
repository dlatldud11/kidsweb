package kids.management.emp_manage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kids.common.controller.SuperClass;
import kids.management.emp_manage.model.Emp_Manage;
import kids.management.emp_manage.model.Emp_ManageDao;
import kids.members.employees.model.Employees;
import kids.members.employees.model.EmployeesDao;

public class DetailEmployerManagementController extends SuperClass {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doGet(request, response);
		
		String tid = request.getParameter("tid");
		Emp_ManageDao dao = new Emp_ManageDao();
		Emp_Manage bean = dao.DetailData(tid);
		
		System.out.println("bean : " + bean);
		request.setAttribute("bean", bean);
		
		String gotopage = "/emp_manage/empDetail.jsp";
		super.GotoPage(gotopage);
		
	}
} 
