package com.myweb.board.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.myweb.board.model.BoardDTO;
import com.myweb.board.model.NoticeMapper;
import com.myweb.util.JdbcUtil;
import com.myweb.util.mybatis.MybatisUtil;

public class BoardServiceImpl implements BoardService{

	//sqlSessionFactory객체 생성
	private SqlSessionFactory sqlSessionFactory = MybatisUtil.getSqlSessionFactory();
	
	@Override
	public void regist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String regdate = request.getParameter("regdate");
		String email = request.getParameter("email");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
//		System.out.println(regdate);
//		System.out.println(email);
//		System.out.println(title);
//		System.out.println(content);
		
		//마이바티스 영역 = DAO를 대신함
		SqlSession sql = sqlSessionFactory.openSession(true);//세션을 open한다
		NoticeMapper board = sql.getMapper(NoticeMapper.class);
		
		BoardDTO dto = new BoardDTO(0, email, title, content, regdate);
		int result = board.regist(dto);
//		System.out.println("성공실패 : " + result);
		sql.close();
		//mvc2방식에서 redirect 컨트롤러를 태워나감
		response.sendRedirect("list.board");
		
		
		

		/*	테스트코드
		 * String time = board.getTime(); System.out.println("디비에서 얻은 정보: " + time);
		 */
	}

	@Override
	public void getList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SqlSession sql = sqlSessionFactory.openSession(true);
		NoticeMapper board = sql.getMapper(NoticeMapper.class);
		
		ArrayList<BoardDTO> list = board.getList();
		sql.close();
		//request객체에 담는다
		request.setAttribute("list", list);
	}

	@Override
	public void getContent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * 1. bno값을 받습니다.
		 * 2. mapper에서는 bno기준으로 데이터를 조회해서 dto반환합니다.
		 * 3. dto를 request에 저장하고, 화면으로 이동해서 데이터를 출력.
		 * 
		 * 
		 */
		SqlSession sql = sqlSessionFactory.openSession(true);
		NoticeMapper board = sql.getMapper(NoticeMapper.class);
		
		String bno = request.getParameter("bno");
		BoardDTO content =board.getContent(bno);
		sql.close();
		//request객체에 담는다
		request.setAttribute("content", content );
	}

	@Override
	public void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bno = request.getParameter("bno");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		//맵으로 전달하는 방법
		Map<String, String>map = new HashMap<>();
		map.put("bno", bno);
		map.put("title", title);
		map.put("content", content);
		
		SqlSession sql = sqlSessionFactory.openSession(true);
		NoticeMapper mapper = sql.getMapper(NoticeMapper.class);
		int result = mapper.update(map);
		sql.close();
		if(result == 1) { //업데이트 성공
			//상세보기로 이동
			response.setContentType("text/html; charset=UTF-8;");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('수정 되었습니다');");
			out.println("location.href='getContent.board?bno="+ bno +"';");
			out.println("</script>");
		}else { //업데이트 실패
			//목록 이동
			response.sendRedirect("list.board");
		}
	
	}

	@Override
	public void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * 1. bno값을 얻습니다.
		 * 2. 삭제는 insert, update 똑같습니다. delete태그를 사용하면 됩니다
		 * 3. 삭제를 진행하고 나서는 목록으로 이동해주면 됩니다.
		 */
		String bno = request.getParameter("bno");
		
		SqlSession sql = sqlSessionFactory.openSession(true);
		NoticeMapper board = sql.getMapper(NoticeMapper.class);
		int result = board.delete(bno);
		sql.close();
		if(result == 1) {
			response.sendRedirect("list.board");
		}else {
			
		}
	}

}
