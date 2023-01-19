<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../header.jsp"%>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">지역관리</h1>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                지역 관리
                            </div>
                            <div class="card-body">
                            	<form action="/gjdm/dimDistrictList.do" method="post">
	                            	<label>
	                            		국가
	                            		<input type="text" id="nationId" value="${searchNation}">
	                            	</label>
	                            	<label>
	                            		시도
	                            		<input type="text" id="distLvl1" value="${searchDistLvl1}">
	                            	</label>
	                            	<label>
	                            		군구
	                            		<input type="text" id="distLvl2" value="${searchDistLvl2}">
	                            	</label>
	                            	<button type="submit">조회</button>
                            	</form>
<!-- 	                            	<button>저장</button>-->
                            </div>
                            <div class="card-body">
                                <table>
                                    <thead>
                                        <tr>
                                            <th>지역ID</th>
                                            <th>국가ID</th>
                                            <th>시도</th>
                                            <th>군구</th>
                                            <th>동</th>
                                            <th>등록일시</th>
                                            <th>등록자</th>
                                            <th>변경일시</th>
                                            <th>변경자</th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${dimDistrictList}" var="vo">
                                        	<tr>
                                        		<td><c:out value="${vo.districtId}"/></td>
                                        		<td><c:out value="${vo.nationId}"/></td>
                                        		<td><c:out value="${vo.distLvl1}"/></td>
                                        		<td><c:out value="${vo.distLvl2}"/></td>
                                        		<td><c:out value="${vo.distLvl3}"/></td>
                                        		<td><fmt:formatDate value="${vo.rgtrDt}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                        		<td><c:out value="${vo.rgtrId}"/></td>
                                        		<td><fmt:formatDate value="${vo.updtDt}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                        		<td><c:out value="${vo.updtId}"/></td>
                                        	</tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
<%@ include file="../footer.jsp"%>