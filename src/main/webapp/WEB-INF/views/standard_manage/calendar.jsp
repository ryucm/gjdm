<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../header.jsp"%>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">달력관리</h1>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                달력 관리
                            </div>
                            <div class="card-body">
                            	<label>
                                  연도
                                  <input type="search" id="dateId">
                     			  <button><strong>조회</strong></button>
                                <table>
                                	<caption>
                                		<div>Total : ${selectDimCalendarList }</div>
                                	</caption>
                                    <thead>
                                        <tr>
                                        	<th>날짜ID</th>
                                        	<th>연월일</th>
                                            <th>연월</th>
                                            <th>반기</th>
                                            <th>분기</th>
                                            <th>월</th>
                                            <th>주차</th>
                                            <th>일</th>
                                            <th>요일명</th>
                                            <th>생성일자</th>
                                            <th>생성자</th>
                                            <th>변경일자</th>
                                            <th>변경자</th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${dimCalendarList}" var="vo">
                                        	<tr>
                                        		<td><c:out value="${vo.date_id}"/></td>
                                        		<td><c:out value="${vo.yyyymmdd}"/></td>
                                        		<td><c:out value="${vo.yyyymm}"/></td>
                                        		<td><c:out value="${vo.hy}"/></td>
                                        		<td><c:out value="${vo.qt}"/></td>
                                        		<td><c:out value="${vo.mm}"/></td>
                                        		<td><c:out value="${vo.wk}"/></td>
                                        		<td><c:out value="${vo.dd}"/></td>
                                        		<td><c:out value="${vo.day_nm}"/></td>
                                        		<td><c:out value="${vo.rgtr_dt}"/></td>
                                        		<td><c:out value="${vo.rgtr_dt}"/></td>
                                        		<td><c:out value="${vo.updt_dt}"/></td>
                                        		<td><c:out value="${vo.updt_id}"/></td>
                                        	</tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                <div class="paging">
  									<ui:pagination paginationInfo="${paginationInfo}" type="text" jsFunction="linkPage"/>
								</div>
 
								<script type="text/javascript">
									function linkPage(pageNo){
										location.href = "/standard_manage/calendar.do?pageNo="+pageNo;
									}	
								</script>

                        </div>
                    </div>
                </main>
            </div>
<%@ include file="../footer.jsp"%>
