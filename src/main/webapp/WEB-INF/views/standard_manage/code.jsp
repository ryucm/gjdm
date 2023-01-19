
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../header.jsp"%>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">코드관리</h1>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                코드 관리
                            </div>
                            <div class="card-body">
                            	  <label>
	                                  코드 ID
	                                  <input type="search" id="nationId">
	                               </label>
	                               <label>
	                                  코드 그룹
	                                  <input type="search" id="distLvl1">
	                               </label>
	                               <label>
	                                  코드
	                                  <input type="search" id="distLvl2">
	                               </label>
	                               <button>조회</button>
	                               <button>저장</button>
	                            </div>
                                <table>
                                    <thead>
                                        <tr>
                                            <th>코드ID</th>
                                            <th>코드관리</th>
                                            <th>코드그룹명</th>
                                            <th>코드</th>
                                            <th>코드값</th>
                                            <th>출력명</th>
                                            <th>사용여부</th>
                                            <th>등록일시</th>
                                            <th>등록자</th>
                                            <th>변경일시</th>
                                            <th>변경자</th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                           <c:forEach items="${dimCodeList}" var="vo">
                                        	<tr>
                                        		<td><c:out value="${vo.codeId}"/></td>
                                        		<td><c:out value="${vo.groupCode}"/></td>
                                        		<td><c:out value="${vo.groupName}"/></td>
                                        		<td><c:out value="${vo.code}"/></td>
                                        		<td><c:out value="${vo.codeValue}"/></td>
                                        		<td><c:out value="${vo.displayName}"/></td>
                                        		<td><c:out value="${vo.useYN}"/></td>
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