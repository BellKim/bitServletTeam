package com.servlet;

import java.io.IOException;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TestServletClass
 */
@WebServlet("/tsc")
public class TestServletClass extends HttpServlet {
	//service
	// get과 post는 메소드 방식 
	
	//servlet 실행
	//doGet: 데이터가 웹 브라우저 URL에 노출되어 웹 서버로 전송해서 보안에 약하다.
	//텍스트의 한계가 있다.
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		System.out.println(" -- doGet() -- ");
	}
	
	//doPost: 데이터가 HTTP Request에 포함되어 웹 서버로 전송. 보안에 강하다. 맵핑 정보만 노출
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	@PostConstruct
	public void funPc() {
		System.out.println(" -- @PostConstruct() -- ");
	}
	
	//servlet 생성
	@Override
	public void init() throws ServletException {
		System.out.println(" -- init() -- ");
	}
	
	//servlet 종료
	@Override
	public void destroy() {
		System.out.println(" -- destroy() -- ");
	}
	
	@PreDestroy
	public void funPd() {
		System.out.println(" -- @PreDestroy() -- ");
	}
	
	
	
}
