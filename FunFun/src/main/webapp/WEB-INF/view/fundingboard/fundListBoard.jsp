<%@page import="funfun.jdbc.dto.Users"%>
<%@page import="org.springframework.web.bind.annotation.ModelAttribute"%>
<%@page import="org.springframework.ui.Model"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="funfun.jdbc.dto.Funding"%>
<%@page import="funfun.jdbc.dto.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
.progress {
	margin-right: auto;
	margin-left: auto;
}

.btn {
	margin-right: auto;
	margin-left: auto;
	width: 300px;
	height: 60px;
}
</style>
</head>
<body>
	<%
		Users user = new Users();

		user.setRoll("REGULAR");
	%>
	<c:set value="<%=user%>" var="FunFunUser"></c:set>



	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-8">

				<%
					Object FlistObj = request.getAttribute("FundingBoardList");
					List<Funding> list = null;
					if (FlistObj != null && FlistObj instanceof List) {
						list = (List<Funding>) FlistObj;
					}
				%>
				<%
					Funding fdto = null;
					for (int i = 0; i < list.size(); i++) {
						fdto = (Funding) list.get(i);
				%>
				<div class="col-sm-4" style="background-color: lavenderblush;">
					<table>
						<tr>
							<td><a href="<%=request.getContextPath()%>/fundBoard"><img
									src="<%=request.getContextPath()%><%=fdto.getFContent()%>"
									class="img-thumbnail" alt="Cinque Terre"
									style="width: 200px; height: 250px"></a></td>

						</tr>
						<tr>
							<td><a href="<%=request.getContextPath()%>/fundBoard"><%=fdto.getTitle()%></a></td>
						</tr>
						<tr>
							<td><a href="<%=request.getContextPath()%>/fundBoard"><%=fdto.getFContext()%></a></td>
						</tr>
						<tr>
							<td><div class="progress" style="width: 200px;">
									<div class="progress-bar progress-bar-success"
										role="progressbar" aria-valuenow="10" aria-valuemin="0"
										aria-valuemax="100" style="width: 10%">
										<%-- <%=fdto.getMoney()/fdto.getGoal()*10 %> --%>
										% Complete
									</div>
								</div>
								<table>
									<tr>
										<td class="col-lg-4">
											<h6 align="left">
												<strong> <%	fdto.getEndDate();%>
													<% fdto.getStartDate(); %>
												</strong>일 남음
											</h6>
										</td>
										<td class="col-lg-1"></td>
										<td class="col-lg-4">
											<h6 align="right">
												<strong><%=fdto.getMoney()%></strong>원
											</h6>
										</td>
									</tr>
								</table></td>
						</tr>
					</table>
				</div>
				<%
					}
				%>
			</div>
			<div class="col-sm-3">
			
			${FunFunUser.roll }<c:choose>
                        <c:when test="${FunFunUser.roll=='BASIC' }">

                           <button type="submit" class="btn btn-info"
                              style="font-size: 30px;">
                              <span class="glyphicon glyphicon-pencil"
                                 style="font-size: 25px;"></span> 펀딩 신청
                           </button>
                        </c:when>
                        <c:when test="${FunFunUser.roll=='REGULAR' }">
                           <button type="submit" class="btn btn-info"
                              style="font-size: 30px;">
                              펀딩 시작 <span class="glyphicon glyphicon-heart-empty"
                                 style="font-size: 25px;"></span>
                           </button>



                        </c:when>


                     </c:choose>
			
			</div>
		</div>
	</div>

</body>
</html>