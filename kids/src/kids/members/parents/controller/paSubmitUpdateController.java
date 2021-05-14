package kids.members.parents.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kids.common.controller.SuperClass;
import kids.members.parents.model.ParentsDao;

public class paSubmitUpdateController extends SuperClass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doGet(request, response);
		String class_menu = request.getParameter("class_menu");
		String submit_menu = request.getParameter("submit_menu");
		String pid = request.getParameter("pid");
		String page = request.getParameter("page");
		
		ParentsDao pdao = new ParentsDao();
		boolean check = pdao.updateSubmit(pid);
		System.out.println("updateSubmit check :"+check);
		
		if(page == "detail") {
			request.setAttribute("pid", pid);
			new DetailParentsController().doGet(request, response);
		}
		request.setAttribute("class_menu", class_menu);
		request.setAttribute("submit_menu", submit_menu);
		
		new ListParentsController().doPost(request, response);
	}
}
