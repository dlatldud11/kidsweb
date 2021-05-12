<<<<<<< HEAD
package kids.members.parents.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kids.common.controller.SuperClass;
import kids.members.student.model.StudentDao;

public class SearchParentsStudentController extends SuperClass {
<<<<<<< HEAD
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
=======
 
>>>>>>> refs/remotes/origin/hoon
}
=======
package kids.members.parents.controller;

import kids.common.controller.SuperClass;

public class SearchParentsStudentController extends SuperClass {
 
}
>>>>>>> branch 'hoon' of https://github.com/dlatldud11/kidsweb
