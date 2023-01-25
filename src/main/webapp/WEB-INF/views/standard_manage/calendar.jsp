<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../header.jsp"%>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">달력관리</h1>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i> 달력 조회
                            </div>
                            <form action="dimCalendarList.do" method="post">
							<label for="yearSearch"> 연도 <input type="text" name="keyword" value="${keyword}"></label>
							<button type="submit">조회</button>
							</form>
                            <div class="card-haeder">
                                   <i class="fas fa-table me-1"></i> 달력 내역   
                            </div>            
                                <table class="table">                                	
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
											﻿<form action="dimCalendarList.do" method="post">
											<td><input name="dateId" value="${vo.dateId}" readonly
												size="8%"></td>
											<td><input name="yyyymmdd" class="${vo.dateId}"
												value="${vo.yyyymmdd}" readonly size="8%"></td>
											<td><input name="yyyyMm" class="${vo.dateId}"
												value="${vo.yyyyMm}" readonly size="4"></td>
											<td><input name="hy" class="${vo.dateId}"
												value="${vo.hy}" readonly size="1"></td>
											<td><input name="qt" class="${vo.dateId}"
												value="${vo.qt}" readonly size="1"></td>
											<td><input name="mm" class="${vo.dateId}"
												value="${vo.mm}" readonly size="1"></td>
											<td><input name="wk" class="${vo.dateId}"
												value="${vo.wk}" readonly size="1"></td>
											<td><input name="dd" class="${vo.dateId}"
												value="${vo.dd}" readonly size="2%"></td>
											<td><input name="dayNM" class="${vo.dateId}"
												value="${vo.dayNM}" readonly size="2%"></td>
											<td><input
												value="<fmt:formatDate value="${vo.rgtrDt}" pattern="yyyy-MM-dd HH:mm:ss"/>"
												disabled size="18.5%"></td>
											<td><input name="rgtrId" class="${vo.rgtrId}"
												value="${vo.rgtrId}" disabled size="8%"></td>
											<td><input
												value="<fmt:formatDate value="${vo.updtDt}" pattern="yyyy-MM-dd HH:mm:ss"/>"
												disabled size="18.5%"></td>
											<td><input class="${vo.dateId}"
												value="${vo.updtId}" disabled size="8%"></td>
                       					</c:forEach>				
                                    </tbody>
                                </table> 
                        </div>
                    </div>
                </main>
            </div>
<%@ include file="../footer.jsp"%>
