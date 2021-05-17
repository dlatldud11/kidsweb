package kids.members.parents.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kids.common.controller.SuperClass;
import kids.members.student.model.Student;
import kids.members.student.model.StudentDao;

public class SearchParentsStudentController extends SuperClass {
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doPost(request, response);
		
		System.out.println("dopost로 들어 왔당!!");
		
		String name = request.getParameter("name");
		String hp = request.getParameter("hp");
		
		System.out.println("확인용 name : "+name);
		System.out.println("확인용 hp : "+hp);
		
		StudentDao sdao = new StudentDao(); // 임의로 만들어서 사용. 합칠때 메소드만 복붙하기.
		Student bean = sdao.selectByData(name,hp) ;
		request.setAttribute("bean", bean);
		String gotopage = "/parents/paStSearch.jsp";
		super.GotoPage(gotopage);
	}
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}
}
