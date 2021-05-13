package kids.members.parents.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kids.common.controller.SuperClass;
import kids.members.student.model.StudentDao;

public class SearchParentsStudentController extends SuperClass {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doGet(request, response);
		
		String name = request.getParameter("name");
		String hp = request.getParameter("hp");
		
		StudentDao sdao = new StudentDao(); // 임의로 만들어서 사용. 합칠때 메소드만 복붙하기.
		int sid = sdao.selectSidByData(name,hp) ;
		
		String gotopage = "/parents/paStSearch.jsp";
		super.GotoPage(gotopage);
	}
}
