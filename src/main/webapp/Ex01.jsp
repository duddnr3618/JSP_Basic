<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 
정적서비스 : HTML, CSS ,JS -> 웹페이지
	클라이언트(브라우져) -> request -> 서버 -> response
	==> 항상 동일한 서비스 제공 (정적서비스)

동적서비스 : JSP(Java Server Project)
	jsp / ASP / psp ... -> WAS(Web application Server) fowarding -> 
	HTML파일을 만드는데 활용 (프로그래밍) (동적서비스) 
	
 -->
 
 <% // 스크립틀릿 : 톰캣이 처리하는 Java실행 블락 (자바코드를 작성할수 있는 영역) 
 int total = 0;
 for (int i = 0 ; i<= 10; i++) {
	 total +=i;
 }
	 System.out.println ("처리함"); // 콘솔에 출력
 %>
 
 1부터 10까지의 합 : 
 
 <%= //표현식 : Java실행 값을 출력하는 블락 (연산,처리 코드는 사용불가`)
 total
 %>
 
 <%! //선언문(멤버필드, 멤버메소드 정의) %>
 
<!-- 
JSP 라이프 사이클 (톰캣이 하는 역할)
1.클라이언트에서 서버로 데이터 요청 : ex01.jsp
2.톰캣에서(서버) jsp파일을 java파일로 번역 : 응답 -> ex01.java
3.톰캣에서 java파일을 컴파일(class파일) 한다. : ex01.class
4.컴파일 후 메모리에 load -> new ex01_jsp() : 톰캣 객체생성 (생성자)
5.jspinit() 호출
6.jspService() 호출 -> html코드 및 클라이언트에 호출 : 응답
7.성공적으로 출력(서비스 끝난상태) , 메모리에는 컴파일한 파일이 남아있다.(서버가 켜져있음)
8.jspDestriy() 호출 -> 기존의 JSP파일이나 자바에 변경이 있으면 기존에 객체를 삭제 : 메모리에서 삭제
9.다시 변경 및 수정된 내용을 메모리에 로드 후 다시 서비스

 -->
 
 <!-- 
 클라이언트에서 서버로 요청시 데이터 전달방식 
 get방식 : 요청 url에 데이터를 붙여서 전송 -> 데이터를 얻기위함
 	-요청 url길이에 제한이 있다
 	-전송시 데이터 노출에 따른 위험
 
 post방식 : http body에 데이터를 담아서 전송 -> 데이터를 보내기 위함
 	-데이터 전송 길이에 제한이 없다.
 	-body에 담으므로 노출이 안됨
 
  -->


<!-- 
MVC : Model / View / Controller
컨트롤러(Servlets) -> 요청 및 처리를 구분 , 연결
	-http요청을 받음
	-요청분석
	-비즈니스로직 처리(모델사용)
	-결과 데이터를 request ,session객체에 저장
	-알맞은 view를 선택 후 포워딩 or 리다이렉트

뷰(JSP files) -> 결과값을 출력
	-선택된 jsp파일을 해석하여 java코드 생성(서블릿)
	-java코드를 컴파일 하여 서블릿 객체생성
	-request or session에 설정된 값을 표현식에 따라 셋팅하여 응답데이터를 생성
	(HTML/CSS/JS 등)
	
모델(Services or Action) -> 요청에 따라 구현체를 처리
	-컨트롤러의 요청을 받음
	-비즈니스 로직처리(외부 자원사용)
	-처리 결과를 컨트롤러로 반환

1.Controller를 만들어 모든 요청을 받는 서블릿을 정의하고 등록
2.URL맵핑에 /를 이용하여 하나의 서블릿이 모든 요청을 받음
3.요청URL 또는 파라미터로 전달된 명령을 이용하여 처리할 비즈니스 로직을 선택
3.controller에서 요청을 분석하고 비즈니스 로직 처리후 브라우져에 응답 또는 적절한 뷰를 선택해 응답
 
 -->
</body>
</html>