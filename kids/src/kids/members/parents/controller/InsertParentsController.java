package kids.members.parents.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import kids.common.controller.SuperClass;
import kids.members.parents.model.Parents;
import kids.members.parents.model.ParentsDao;

public class InsertParentsController extends SuperClass {
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doPost(request, response);
		
		MultipartRequest multi = (MultipartRequest)request.getAttribute("multi");
		System.out.println("multi : "+multi);
		Parents bean = new Parents();
		String pid = multi.getParameter("pid");
		String name = multi.getParameter("name");
		String hp = multi.getParameter("hp");
		String address1 = multi.getParameter("address1");
		String address2 = multi.getParameter("address2");
		String gender = multi.getParameter("gender");
		String password = multi.getParameter("password");
		String birth = multi.getParameter("birth");
		String email = multi.getParameter("email1")+"@"+multi.getParameter("email2");
		String image = multi.getParameter("image");
		String zipcode = multi.getParameter("zipcode");
		int sid = Integer.parseInt(multi.getParameter("sid"));
		System.out.println("sid : "+sid);
		String relationship = multi.getParameter("relationship");
		
		bean.setPid(pid);
		bean.setName(name);
		bean.setHp(hp);
		bean.setAddress1(address1);
		bean.setAddress2(address2);
		bean.setGender(gender);
		bean.setPassword(password);
		bean.setBirth(birth);
		bean.setEmail(email);
		bean.setImage(image);
		bean.setZipcode(zipcode);
		bean.setSid(sid);
		bean.setRelationship(relationship);
		bean.setSubmit("미승인");
		bean.setResponsibilities("보호자");
		
		
		String imsic = request.getParameter("childid");
		String imsic2 = request.getParameter("childid2");
		
		System.out.println("childid : " + imsic);
		System.out.println("childid2 : " + imsic2);
		
		if(!(imsic == null || imsic.equals("null") || imsic.equals(""))) {
			System.out.println("imsic if문에 들어옴!");
			int childid = Integer.parseInt(imsic);
			bean.setChildid(childid);
		}
		if(!(imsic2 == null || imsic2.equals("null") || imsic2.equals(""))) {
			System.out.println("imsic2 if문에 들어옴!");
			int childid2 = Integer.parseInt(imsic2);
			bean.setChildid2(childid2);
		}
		
		ParentsDao pdao = new ParentsDao();
		int cnt = pdao.insertData(bean);
		System.out.println("cnt : "+cnt);
		
		String page = request.getParameter("page");
		if(!(page == null || page.equals("null") || page.equals(""))) {
			if(page.equals("update")) {
				request.setAttribute("pid", pid);
				request.setAttribute("page", "result");
				if(cnt == 1) {
					request.setAttribute("message", "수정이 완료되었습니다");
					new UpdateParentsController().doGet(request, response);
				}else {
					request.setAttribute("message", "수정이 실패하였습니다");
					new UpdateParentsController().doGet(request, response);
				}
			}
		}
		String gotopage = "";
		if(cnt == 1) {
			gotopage = "/parents/paInsertOK.jsp";
			super.GotoPage(gotopage);
		}else {
			gotopage = "/parents/paInsertFail.jsp";
			super.GotoPage(gotopage);
		}
	
	}
}
