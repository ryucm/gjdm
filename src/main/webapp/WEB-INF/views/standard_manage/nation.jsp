<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../header.jsp"%>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">국가관리</h1>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                국가 관리
                            </div>
                            <div class="card-body">
	                            <div class="card-body">
	                               <label>
	                                  대륙
	                                  <input type="search" id="continent">
	                               </label>
	                               <button>조회</button>
	                               <button>저장</button>
	                            </div>
                                <table>
                                    <thead>
                                        <tr>
                                            <th>국가ID</th>
                                            <th>국가명(한글)</th>
                                            <th>국가명(영문)</th>
                                            <th>ISO코드</th>
                                            <th>ISO3코드</th>
                                            <th>ISON번호</th>
                                            <th>대륙명(한글)</th>
                                            <th>등록일시</th>
                                            <th>등록자</th>
                                            <th>변경일시</th>
                                            <th>변경자</th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${dimNationList}" var="vo">
                                        	<tr>
                                        		<td><c:out value="${vo.nationId}"/></td>
                                        		<td><c:out value="${vo.nationNm}"/></td>
                                        		<td><c:out value="${vo.nationNmEn}"/></td>
                                        		<td><c:out value="${vo.isoCd}"/></td>
                                        		<td><c:out value="${vo.iso3Cd}"/></td>
                                        		<td><c:out value="${vo.isoNo}"/></td>
                                        		<td><c:out value="${vo.continent}"/></td>
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