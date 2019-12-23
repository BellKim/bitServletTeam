package com.servlet;

import java.io.IOException;
import java.util.Arrays;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/mSignUp")
public class MemSignUp extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println(" -- doGet() -- ");
		
		String m_name = request.getParameter("m_name"); // request 객체에서 어떠한 값 하나를 가지고 올대 getParameter를 사용한다. 
		String m_pass = request.getParameter("m_pass");
		String m_gender = request.getParameter("m_gender");
		String[] m_hobbys = request.getParameterValues("m_hobby"); //여러가지 정보는 getParameterValues를 사용하여 배열로 저장한다.
		String m_residence = request.getParameter("m_residence");
		
		System.out.println("m_name : " + m_name);
		System.out.println("m_pass : " + m_pass);
		System.out.println("m_gender : " + m_gender);
		System.out.println("m_hobbys : " + Arrays.toString(m_hobbys));
		System.out.println("m_residence : " + m_residence);
		
		Enumeration<String> names = request.getParameterNames(); // 데이터가 제대로 날라오고 있는지 검증할때 필요한 코드
		while (names.hasMoreElements()) {
			String name = (String) names.nextElement();
			System.out.println("name : " + name);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println(" -- doPost() -- ");
		
		doGet(request, response);
	}

}
