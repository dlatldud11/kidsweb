<<<<<<< HEAD
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
<<<<<<< HEAD
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doPost(request, response);
		
		MultipartRequest multi = (MultipartRequest)request.getAttribute("multi");
		
		Parents bean = new Parents();
		String pid = multi.getParameter("pid");
		String name = multi.getParameter("name");
		String hp = multi.getParameter("hp");
		String address1 = multi.getParameter("address1");
		String address2 = multi.getParameter("address2");
		String gender = multi.getParameter("gender");
		String password = multi.getParameter("password");
		String birth = multi.getParameter("birth");
		String email = multi.getParameter("email1")+multi.getParameter("email2");
		String image = multi.getParameter("image");
		String zipcode = multi.getParameter("zipcode");
		int sid = Integer.parseInt(multi.getParameter("sid"));
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
		
		if(Integer.parseInt(multi.getParameter("childid")) >0) {
			int childid = Integer.parseInt(multi.getParameter("childid"));
			bean.setChildid(childid);
		}
		if(Integer.parseInt(multi.getParameter("childid2")) >0) {
			int childid2 = Integer.parseInt(multi.getParameter("childid2"));
			bean.setChildid2(childid2);
		}
		
		ParentsDao pdao = new ParentsDao();
		int cnt = pdao.insertData(bean);
		System.out.println("cnt : "+cnt);
		
		String gotopage = "/start.jsp";
		super.GotoPage(gotopage);
	}
=======
 
>>>>>>> refs/remotes/origin/hoon
}
=======
package kids.members.parents.controller;

import kids.common.controller.SuperClass;

public class InsertParentsController extends SuperClass {
 
}
>>>>>>> branch 'hoon' of https://github.com/dlatldud11/kidsweb
