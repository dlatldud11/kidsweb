package kids.members.parents.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kids.common.controller.SuperClass;
import kids.management.myclass.model.Myclass;
import kids.management.myclass.model.MyclassDao;
import kids.members.parents.model.ParentsDao;
import kids.members.parents.model.ParentsMiniView;

public class ListParentsController extends SuperClass {
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doPost(request, response);
		String class_menu = request.getParameter("class_menu");
		String submit_menu = request.getParameter("submit_menu");
		
		ParentsDao pdao = new ParentsDao();
		List<ParentsMiniView> plists = pdao.selectDataList(class_menu, submit_menu);
		
		System.out.println("parentsMiniView list count : " + plists.size()); 
		
		MyclassDao cdao = new MyclassDao();
		List<Myclass> clists = cdao.selectDataList();
		
		request.setAttribute("plists", plists);
		request.setAttribute("clists", clists);
		request.setAttribute("class_menu", class_menu);
		request.setAttribute("submit_menu", submit_menu);
		
		String gotopage = "/parents/paList.jsp" ;
		super.GotoPage(gotopage);
	}

}
