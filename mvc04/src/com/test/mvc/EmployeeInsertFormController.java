/*=========================================
	#21. EmployeeInsertFormController.java
	- 사용자 정의 컨트롤러 클래스
===========================================*/


package com.test.mvc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

// ※ Spring 의 『Controller』 인터페이스를 구현하는 방법을 통해
//	  사용자 정의 컨트롤러 클래스를 구성한다.


public class EmployeeInsertFormController implements Controller
{
	// 인터페이스 형태의 속성 구성
	private IEmployeeDAO dao;
	
	public void setDao(IEmployeeDAO dao)
	{
		this.dao = dao;
	}


	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// 액션 코드
		
		ModelAndView mav = new ModelAndView();
		
		ArrayList<Region> regionList = new ArrayList<Region>();
		ArrayList<Department> deparmentList = new ArrayList<Department>();
		ArrayList<Position> positionList = new ArrayList<Position>();
		
		// 로그인 여부만 확인 → 관리자인지 확인 할필요 없음.
		// 세션 처리과정 추가 -------------------------------------------------------------------------------
		HttpSession session = request.getSession();
		
		if (session.getAttribute("name")==null)			//-- 로그인이 되어 있지 않은 상황
		{
			mav.setViewName("redirect:loginform.action");
			return mav;
		}
		else if (session.getAttribute("admin")==null)
		{
			mav.setViewName("redirect:logout.action");
			return mav;
			//-- 로그인은 되어 있지만 이 때 클라이언트는 
			//   일반 직원으로 로그인 되어 있는 상황이므로
			//   기존의 로그인 내용을 없애고 로그아웃 액션 처리하여
			//   다시 관리자로 로그인할 수 있도록 처리
		}
		// ------------------------------------------------------------------------------- 세션 처리과정 추가
		
		try
		{
			
			regionList = dao.regionList();
			deparmentList = dao.departmentList();
			positionList = dao.positionList();
			
			mav.addObject("regionList", regionList);
			mav.addObject("departmentList", deparmentList);
			mav.addObject("positionList", positionList);
			
			mav.setViewName("/WEB-INF/view/EmployeeInsertForm.jsp");
			
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString()); 
		}
		
		
		
		return mav;
	}

}
