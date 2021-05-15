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
		String[] email = bean.getEmail().split("@");
		String email1 = email[0];
		String email2 = email[1];
		
		request.setAttribute("bean", bean);
		request.setAttribute("email1", email1);
		request.setAttribute("email2", email2);
		
		String page = request.getParameter("page");
		if(page.equals("result")) {
			String message = request.getParameter("message");
			request.setAttribute("message", message);
			
			String gotopage = "parents/updateOK.jsp";
			super.GotoPage(gotopage);
		}
		
		String gotopage = "parents/paUpdate.jsp";
		super.GotoPage(gotopage);
	}
} 
