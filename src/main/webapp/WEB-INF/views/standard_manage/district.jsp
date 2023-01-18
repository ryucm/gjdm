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
                                        		<td><c:out value="${vo.rgtrDt}"/></td>
                                        		<td><c:out value="${vo.rgtrId}"/></td>
                                        		<td><c:out value="${vo.updtDt}"/></td>
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