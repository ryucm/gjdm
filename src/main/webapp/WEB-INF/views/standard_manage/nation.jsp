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
	                               <form method="post" action="dimNationList.do">
	                               	대륙
	                               	<select name="continent">
	                               		<option value="아시아">아시아</option>
	                               		<option value="유럽">유럽</option>
	                               		<option value="오세아니아">오세아니아</option>
	                               		<option value="북아메리카">북아메리카</option>
	                               		<option value="남아메리카">남아메리카</option>
	                               		<option value="아프리카">아프리카</option>
	                               	</select>
	                               	
	                               	<button type="submit">조회</button>
	                               </form>
	                               <button onclick="location.href='dimNationList.do'">전체보기</button>
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
                                    	<form action="updateDimNation.do" method="post">
	                                        <c:forEach items="${dimNationList}" var="vo">
	                                        	<tr>
	                                        		<td><input name="nationId" value="${vo.nationId}" readonly></td>
	                                        		<td><input name="nationNm" value="${vo.nationNm}" readonly></td>
	                                        		<td><input name="nationNmEn" value="${vo.nationNmEn}" readonly></td>
	                                        		<td><input name="isoCd" value="${vo.isoCd}" readonly></td>
	                                        		<td><input name="iso3Cd" value="${vo.iso3Cd}" readonly></td>
	                                        		<td><input name="isoNo" value="${vo.isoNo}" readonly></td>
	                                        		<td><input name="continent" value="${vo.continent}" readonly></td>
	                                        		<td><input name="rgtrDt" value="<fmt:formatDate value="${vo.rgtrDt}" pattern="yyyy-MM-dd HH:mm:ss"/>" readonly></td>
	                                        		<td><input name="rgtrId" value="${vo.rgtrId}" readonly></td>
	                                        		<td><input name="rgtrDt" value="<fmt:formatDate value="${vo.updtDt}" pattern="yyyy-MM-dd HH:mm:ss"/>" readonly></td>
	                                        		<td><input name="updtId" value="${vo.updtId}"></td>
	                                        		<td id="updateBtn${vo.nationId}"><input type="button" onClick="updateDimNation${vo.nationId}()" value="수정"></td>
	                                        		<td id="submitBtn${vo.nationId}" hidden><button type="submit" onClick="updateDimNation${vo.nationId}()">수정</button></td>
	                                        		<td><a href="deleteDimNation.do?nationId=${vo.nationId}">삭제</a></td>
	                                        	</tr>
	                                        <script>
												function updateDimNation${vo.nationId}() {
													$("#nationId${vo.nationId}").attr('disabled', false);
													$(".${vo.nationId}").attr('readonly', false);
													$("#updateBtn${vo.nationId}").hide();
													$("#submitBtn${vo.nationId}").attr('hidden', false);
												};
											</script>
	                                        </c:forEach>
	                                     </form>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
<%@ include file="../footer.jsp"%>