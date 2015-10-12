<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@page import="org.springframework.web.bind.annotation.ModelAttribute"%>
<%@page import="org.springframework.ui.Model"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="funfun.jdbc.dto.FBoard"%>
<%@page import="funfun.jdbc.dto.Board"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>

/*  .top {
   border-top: solid; color: #DEDEE9;
   border-bottom: solid; color: #DEDEE9;;
   background-color:#F5F5F9;
   height: 40px;
   width: 900px;
   position: absolute;
   right: 530px;
}  */

/* .up{

   border-color: black;
   border: 1px solid;
   display: inline-block; width:90px; height: 90px;
   text-align: center; 
   font-size: 27px;
} */
textarea {
   resize: none;
}
</style>
</head>
<body>
   <jsp:include page="/WEB-INF/view/main/headerfoot.jsp"></jsp:include>
   <div class="panel-body" align="center">




      <div id="toppanel" class="panel panel-default" 
         style="width: 900px; background-color: #F3F3ED" >
         <ul class="nav nav-justified">
            <li>
               <div align="left" class="panel-body" style="width: 200px">닉넴</div>
            </li>
            <li>
               <div align="center" class="panel-body" style="width: 200px">
                  날짜</div>
            </li>
            <li>
               <div align="right" class="panel-body" style="width: 200px">
                  조회</div>
            </li>
         </ul>
      </div>


      <div class="panel panel-default" style="width: 900px;">
         <div class="panel-body" align="center" style="color: #8A0000; font-size: 40px;">제목</div>
      </div>


      <div class="panel panel-default" style="width: 900px;">
         <div class="panel-body" style="height: 400px">게시물 내용</div>
      </div>

      <div class="panel panel-default" style="width: 900px;">
         <div class="panel-heading">코멘트</div>

         <div class="panel-body">

            <table class="table">
               <thead>
                  <tr>
                     <th class="ttr"><strong>닉네임</strong></th>

                  </tr>
               </thead>
               <tbody>

                  <tr>
                     <td>내용</td>

                  </tr>

               </tbody>
            </table>


         </div>
      </div>


      <div class="panel panel-danger" style="width: 900px;">
         <div class="row">
            <div class="col-lg-1 col-sm-1 col-xs-1 col-md-1" align="center">
               <label for="user">닉네임</label>
            </div>
            <div class="col-lg-7 col-sm-7 col-xs-7 col-md-7">
               <textarea rows="4" cols="80" id="user">내용</textarea>
            </div>
            <div class="col-lg-3 col-sm-3 col-xs-3 col-md-3" align="right">
               <a href="#"><img src="<%=request.getContextPath()%>/img/ok.PNG"
                  style="width: 90px; height: 90px"> </a>
            </div>

         </div>
      </div>

   </div>


   <jsp:include page="/WEB-INF/view/main/footer.jsp"></jsp:include>

</body>
</html>