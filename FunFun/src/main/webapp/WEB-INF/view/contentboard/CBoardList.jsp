<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="funfun.jdbc.dto.FBoard"%>
<%@page import="funfun.jdbc.dto.Board"%>
<%@page import="funfun.jdbc.dto.CBoard"%>
<%@page import="funfun.jdbc.dto.CBoard_sub"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
   href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
   src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<style type="text/css">
.category {
   width: 200px;
   float: left;
}

.freeWriteBoard-List {
   top: 180px;
   left: 250px;
}

.panel-body {
   margin-bottom: 23%;
}

<
style>#name:link {
   color: #A8A88E;
   font-size: 10pt;
   text-decoration: none;
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



         <div class="col-lg-9 col-md-9 col-sm-9 col-xs-9">

            <h2 align="center">자유 연재 게시판</h2>


            <table class="table table-bordered">
               <%
                  Object ClistObj = request.getAttribute("CBoardList");
                  List<CBoard> list = null;
                  if (ClistObj != null && ClistObj instanceof List) {
                     list = (List<CBoard>) ClistObj;
                  }
                  
                  
               %>

               <%
                  CBoard cdto = null;
                  int csdto = 0;
                     for (int i = 0; i < list.size(); i++) {
                        cdto = (CBoard) list.get(i);
                        Object CslistObj = request.getAttribute("CsBoardCount"+i);
                        int cslist = 0;
                        if (CslistObj != null && CslistObj instanceof Integer) {
                           cslist = (int) CslistObj;
                        }
                        csdto = cslist;
               %>

               <tbody align="center">
                  <tr>

                     <td style="width: 200px; margin-left: auto; margin-right: auto;"
                        rowspan="3"><a
                        href="<%=request.getContextPath()%>/ContentBoard/MainView?ContentNo=<%=cdto.getCno()%>">
                           <img src="<%=request.getContextPath()%><%=cdto.getImgData()%>"
                           class="img-thumbnail" alt="Cinque Terre" width="150"
                           height="150px">
                     </a></td>


                     <td>태그(카테고리)</td>

                     <td colspan="2" id="name" style="width: 450px; cursor: pointer;"
                        onclick="location.href='<%=request.getContextPath()%>/ '">
                        <strong>제목 : <%=cdto.getTitle()%>
                     </strong>
                     </td>

                     <td style="width: 100px" colspan="2">작성자 : <%=cdto.getUserId()%></td>
                  </tr>


                  <tr>
                  <td rowspan="2"><%=cdto.getCategory()%></td>
                     <td colspan="2" rowspan="2">작품소개 : <%=cdto.getContent()%></td>
                     <td>

                        <div align="right">

                           <div class=form-horizontal>
                                 <div class="container" style="width: 100px">
                                 <select>
                                 <%for(int j=1;j<=csdto;j++){ %>
                                 <option><%=j%>회</option>
                                 <%
                                    }
                                    %>

                                 </select>
                                 </div>
                              </div>
                           </div>
                     </td>
                     <td><button style="width: 80px" type="button"
                           class="btn btn-xs">
                           보기
                           </button></td>
                  </tr>

                  <tr>
                     <td>조회 <%=cdto.getCview()%></td>
                     <td>추천 <%=cdto.getGood()%></td>
                  </tr>
                  <%
                  }
                  %>
               </tbody>
            </table>

         </div>
      </div>



   </div>




</body>
<script type="text/javascript"></script>
</html>