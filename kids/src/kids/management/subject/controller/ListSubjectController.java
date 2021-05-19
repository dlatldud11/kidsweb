package kids.management.subject.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kids.common.controller.SuperClass;
import kids.management.subject.model.Subject;
import kids.management.subject.model.SubjectDao;

public class ListSubjectController extends SuperClass {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doGet(request, response);
		
		SubjectDao dao = new SubjectDao();
		List<Subject> lists = dao.SelectDataList() ;
		
		String gotopage = "/subject/ListSubject.jsp" ;
		super.GotoPage(gotopage);
	}
	
	
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(request, response);
	}
}
