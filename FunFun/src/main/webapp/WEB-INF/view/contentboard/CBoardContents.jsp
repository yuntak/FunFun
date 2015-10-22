<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="funfun.jdbc.dto.FBoard"%>
<%@page import="funfun.jdbc.dto.Board"%>
<%@page import="funfun.jdbc.dto.CBoard"%>
<%@page import="funfun.jdbc.dto.CBoard_sub"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="org.springframework.web.bind.annotation.ModelAttribute"%>
<%@page import="org.springframework.ui.Model"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
   href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
   src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<style>
.panel-body {
   margin-bottom: 20%;
}

#name:visited {
   color: #B4FF6A;
   font-size: 10pt;
   text-decoration: none;
}

#name:active {
   color: #A8A88E;
   font-size: 10pt;
   text-decoration: none;
}

#name:hover {
   color: #A8A88E;
   font-size: 10pt;
   text-decoration: underline;
}
</style>
</head>
<body>
   <div class="panel-body">
      <div class="row">
         <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2" align="center">
            <ul class="nav nav-pills nav-stacked">
               <li class="active"><a href="#"></a></li>
               <li><a href="#">만화</a></li>
               <li><a href="#">소설</a></li>
               <li><a href="#">영화</a></li>
               <li><a href="#">연극</a></li>
               <li><a href="#">드라마</a></li>
               <li><a href="#">게임</a></li>
            </ul>
         </div>
         <%-- <p>${CBoard }</p> --%>
         <div class="col-lg-9 col-md-9 col-sm-9 col-xs-9"
            style="overflow: auto; margin-left: 10%; border-top: 1px solid blue; width: 900px; height: 300px;">
            <table style="" class="table">


               <tbody>
                  <tr>
                     <%
                        Object ClistObj = request.getAttribute("CBoard");
                        List<CBoard_sub> list = null;
                        CBoard cdto = (CBoard) ClistObj;
                        list = cdto.getCboard_sub();
                     %>



                     <td align="center" style="overflow: hidden;" rowspan="3"><img
                        src="<%=request.getContextPath()%><%=cdto.getImgData()%>"
                        class="img-thumbnail" alt="Cinque Terre" width="150"
                        height="200"></td>


                     <td>태그 : <%=cdto.getCategory()%></td>

                     <td id="name" style="width: 450px; cursor: pointer;"><strong>제목
                           : <%=cdto.getTitle()%></strong></td>

                     <td style="width: 100px">작성자<%=cdto.getUserId()%></td>


                  </tr>


                  <tr>
                     <td colspan="2" rowspan="2">
                        <ul class="nav nav-tabs" style="width:; margin-left: 1%;">
                           <li class="active"><a data-toggle="tab" href="#home">작품공지</a></li>
                           <li><a data-toggle="tab" href="#menu1">작품소개</a></li>
                        </ul>
                        <div align="center">



                           <div class="tab-content">
                              <div id="home" class="tab-pane fade in active">

                                 <p>등록된 공지사항이 없습니다.</p>
                              </div>
                              <div id="menu1" class="tab-pane fade">

                                 <p>${CBoard.content }</p>
                              </div>

                           </div>
                        </div>
                     </td>
                     <td>조회 <%=cdto.getCview()%></td>

                  </tr>

                  <tr>

                     <td>추천 <%=cdto.getGood()%><button>추천하기</button></td>
                  </tr>



               </tbody>
            </table>



         </div>
      </div>
      <div style="width: 900px; height: 200px; border:; margin-left: 27%;">
         <table class="table">

            <tr>
               <th>소제목</th>
               <th>회차</th>
               <th>날짜</th>

            </tr>


            <c:forEach var="sub" items="${CBoard.cboard_sub }">
               <tr>
                  <td id="subtitle" style="cursor: pointer"
                     onclick="location.href='<%=request.getContextPath()%>/ContentBoard/View?Cno=<%=cdto.getCno() %>&no=${sub.no }'">${sub.subtitle }</td>
                  <td>${sub.contentBoardCno }</td>
                  <td>${sub.csDate }</td>
               </tr>
            </c:forEach>



         </table>
         <br>
         <div align="center">
            <a href="<%=request.getContextPath()%>/ContentBoard"><button
                  type="button" class="btn-lg btn-default">목록</button></a>
         </div>
      </div>

      <div class=" panel-default"
         style="margin-left: 27%; width: 900px; overflow: auto;">
         <div class="panel-heading">
            <strong>코멘트</strong>
         </div>


         <table id="comment" class="table">

            <thead>
               <tr>
                  <th class="ttr"
                     style="font-size: 11pt; color: #454581; border-width:; border-top:; border-bottom: none !important;">닉네임</th>
               </tr>
            </thead>

            <tbody>
               <tr>
                  <td
                     style="font-size: 9pt; border-top: none !important; border-width: 0; border-bottom: none !important;">내용</td>
               </tr>

            </tbody>


         </table>
         <div style="width: 900px; border: 2px solid #F3F3ED"></div>
      </div>

      <div class=""
         style="margin-left: 27%; width: 900px; height: 110px; background-color: #EFEFE7">
         <div class="row">


            <div class="col-lg-2 col-sm-2 col-xs-2 col-md-2"
               style="margin-top: 10mm;">
               <label for="user">닉네임</label>
            </div>
            <div class="col-lg-7 col-sm-7 col-xs-7 col-md-7">
               <textarea id="FBreplyContent" rows="4" cols="85" id="user"
                  style="border: 1px solid #BFBFFF; margin-top: 2mm; resize: none; height: 96px;"
                  placeholder="내용"></textarea>
            </div>
            <div class="col-lg-3 col-sm-3 col-xs-3 col-md-3" align="right">
               <button id="FBreplyInsert"
                  style="margin-top: 3mm; margin-right: 1mm; border: 1px solid #BFBFFF; background-color: #FBFBF9; font-size: 15pt; width: 90px; height: 90px;">등록</button>
            </div>


         </div>
      </div>
   </div>

</body>

<script type="text/javascript">
   console.log("${CBoard }");
</script>
</html>