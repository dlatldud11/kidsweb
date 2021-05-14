package kids.members.parents.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kids.common.controller.SuperClass;
import kids.members.parents.model.Parents;
import kids.members.parents.model.ParentsDao;

public class UpdateParentsController extends SuperClass {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doGet(request, response);
		String pid = request.getParameter("pid");
		ParentsDao pdao = new ParentsDao();
		Parents bean = pdao.selectDataByPk(pid);
		
		request.setAttribute("bean", bean);
		String gotopage = "parents/paUpdate.jsp";
		super.GotoPage(gotopage);
	}
} 
