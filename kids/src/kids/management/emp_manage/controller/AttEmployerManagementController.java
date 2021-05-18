package kids.management.emp_manage.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kids.common.controller.SuperClass;
import kids.management.emp_manage.model.Emp_Manage;
import kids.management.emp_manage.model.Emp_ManageDao;
import kids.members.employees.model.Employees;
import kids.members.employees.model.EmployeesDao;

public class AttEmployerManagementController extends SuperClass {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doGet(request, response);
		
		Date date = new Date();
		
		String datefr;
		String dateto;
		if(request.getParameter("datefr") == null)
			datefr = "2021-05-01";
		else
			datefr = request.getParameter("datefr");

		if(request.getParameter("dateto") == null)
			dateto = "2021-05-31";
		else
			dateto = request.getParameter("dateto");

		System.out.println(datefr + "/" +dateto);
		String tid = request.getParameter("tid");
		EmployeesDao edao = new EmployeesDao();
		Employees ebean = edao.DetailData(tid);
		
		System.out.println("ebean : " + ebean);
		request.setAttribute("ebean", ebean);
		
		Emp_ManageDao mdao = new Emp_ManageDao();
		List<Emp_Manage> lists = mdao.SelectEmpData(datefr, dateto, tid);
		
		System.out.println("lists : " + lists.size());
		request.setAttribute("lists", lists);
		
		String gotopage = "/emp_manage/empmattDetail.jsp";
		super.GotoPage(gotopage);
		
	}
}
