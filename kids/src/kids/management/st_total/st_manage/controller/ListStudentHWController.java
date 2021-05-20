package kids.management.st_total.st_manage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kids.common.controller.SuperClass;
import kids.management.st_total.st_manage.model.St_management;
import kids.members.parents.model.ParentsMiniView;

public class ListStudentHWController extends SuperClass {
  @Override
public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	super.doGet(request, response);
	
//	ParentsMiniView loginfo = (ParentsMiniView)session.getAttribute("loginfo");
//	int sid = loginfo.getSid();
	St_managementDao dao = new St_managementDao();
//	List<St_management> bean = dao.getListById(sid);
	
//	request.setAttribute("beans", bean);
	String gotopage = "/st_manage/sthwList.jsp" ;
	super.GotoPage(gotopage);
}
}
