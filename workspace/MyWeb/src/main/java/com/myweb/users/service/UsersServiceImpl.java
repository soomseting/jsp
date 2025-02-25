package com.myweb.users.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.myweb.users.model.UsersDAO;
import com.myweb.users.model.UsersDTO;

public class UsersServiceImpl implements UsersService {

	@Override
	public void join(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 값을 받음
		String emailPrev = request.getParameter("email_prev");
		String emailNext = request.getParameter("email_next");
		String name = request.getParameter("name");
		String pw = request.getParameter("pw");
		String phone = request.getParameter("phone");
		String gender = request.getParameter("gender");
		String snsYn = request.getParameter("sys_yn");
		if (snsYn == null) {
			snsYn = "N";
		}
		String email = emailPrev + "@" + emailNext;

//		System.out.println(emailPrev);
//		System.out.println(emailNext);
//		System.out.println(name);
//		System.out.println(pw);
//		System.out.println(phone);
//		System.out.println(gender);
//		System.out.println(snsYn);

		// DAO객체생성
		UsersDAO dao = UsersDAO.getInstance();

		int result = dao.idDuplicationCheck(email);

		if (result == 1) {

			// msg를 화면에 보냄
			request.setAttribute("msg", "이미 존재하는 아이디입니다");
			request.getRequestDispatcher("join.jsp").forward(request, response);

		} else {
			UsersDTO dto = new UsersDTO(email, name, pw, phone, gender, snsYn, null);
			dao.join(dto);

			// mvc2방식에서 리다이렉트는 다시 컨트롤러를 태워서 이동할 때 사용함
			response.sendRedirect("login.users");

		}

	}

	@Override
	public void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		UsersDAO dao = UsersDAO.getInstance();
		UsersDTO dto = dao.login(id, pw);

		if (dto == null) { // 아이디, 비밀번호가 틀린경우
			request.setAttribute("msg", "아이디 비밀번호를 확인하세요");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		} else {

			// 세션 - 인증정보를 저장해주는 수단
			// 현재 브라우저 세션은 request얻을 수 있음
			HttpSession session = request.getSession();
			session.setAttribute("userDTO", dto); // 로그인이 되어있다

			response.sendRedirect("../index.jsp");
		}

	}

	@Override
	public void modify(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * update 테이블명 set 업데이트할 값 where pk = ?
		 * 
		 * 1. 화면에서 넘어온 값을 받습니다(이름, 성별, 휴대폰, 수신여부) 
		 * 2. email값은 세션에서 얻습니다. 
		 * 3. DAO는 modify() 메서드를 생성을하고 업데이트를 진행합니다. 
		 * 4. DAO 성공 시 1을 반환하고, 실패 시 0을 반환합니다. 
		 * 5. 서비스에서는 정보수정성공시에 메인페이지로 이동, 실패시에는 mypage로 이동
		 */

		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String phone = request.getParameter("phone");
		String snsYn = request.getParameter("sns_yn");

		HttpSession session = request.getSession();
		UsersDTO dto = (UsersDTO)session.getAttribute("userDTO");
		String email = dto.getEmail();
		
		UsersDAO dao = UsersDAO.getInstance();
		int result= dao.modify(name, gender, phone, snsYn, email);

		if (result == 0) {
			request.setAttribute("msg", "실패");
			request.getRequestDispatcher("mypage.jsp").forward(request, response);
		} else {
			dto = dao.getInfo(email);
			session.setAttribute("userDTO", dto);
			response.sendRedirect("../index.jsp");
		}
	}

}
