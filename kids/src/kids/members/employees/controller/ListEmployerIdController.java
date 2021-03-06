package kids.members.employees.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kids.common.controller.SuperClass;
import kids.common.utility.FlowParameters;
import kids.common.utility.Paging;
import kids.members.employees.model.Employees;
import kids.members.employees.model.EmployeesDao;

public class ListEmployerIdController extends SuperClass {
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doPost(request, response);
		
		FlowParameters parameters = new FlowParameters(
				request.getParameter("pageNumber"),
				request.getParameter("mode"),
				request.getParameter("keyword"));
		System.out.println("parameters list : " + parameters.toString());
		
		String url = request.getContextPath() + "/Kids?command=empList";
		
		EmployeesDao edao = new EmployeesDao();
		int totalCount = edao.selectEmpCount(
					parameters.getMode(),
					parameters.getKeyword());
		
		Paging pageInfo = new Paging(
				parameters.getPageNumber(),
				totalCount,
				url,
				parameters.getMode(),
				parameters.getKeyword());
				
		List<Employees> lists = edao.SelectList(
				pageInfo.getBeginRow(),
				pageInfo.getEndRow(),
				parameters.getMode(),
				parameters.getKeyword());
		
		System.out.println("employees size : " + lists.size());
		
		request.setAttribute("lists", lists);
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("parameters", parameters);
		
		String gotopage = "/emp_manage/empList.jsp" ;
		super.GotoPage(gotopage);
		
	}
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doGet(request, response);
		
		new ListEmployerIdController().doPost(request, response);
		
	}
}
