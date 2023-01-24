<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../header.jsp"%>

<script>
	<%-- 유효성 검사 --%>
	function checkData(formname){
		
		/* var continent = ${continent}; */
		
		var checkNum = /[0-9]/; //숫자 (ISON번호)
		var checkEngA = /[A-Z]/; //영어 대문자 (국가명 영문, ISO코드, ISO3코드)
		var checkKor = /[가-힣]/; //한글 (국가명 한글)
		
		const nationNm = formname.nationNm.value;
		const nationNmEn = formname.nationNmEn.value;
		const isoCd = formname.isoCd.value;
		const iso3Cd = formname.iso3Cd.value;
		const isoNo = formname.isoNo.value;
		
		if (nationNm == ""){
			alert('국가명(한글)은 필수로 입력해야합니다.');
			return false;
		}
		if (!checkKor.test(nationNm)){
			alert('국가명(한글)은 한글만 입력가능합니다.');
			return false;
		}
		if (NationNmEn == ""){
			alert('국가명(염문)은 필수로 입력해야합니다.');
			return false;
		}
		if (!checkKor.test(nationNmEn)){
			alert('국가명(영문)은 영문(대문자)만 입력가능합니다.');
			return false;
		}
		if (!checkEngA.test(isoCd)){
			alert('ISO코드는 영문(대문자)만 입력가능합니다.');
			return false;
		}
		if (!checkEngA.test(iso3Cd)){
			alert('ISO3코드는 영문(대문자)만 입력가능합니다.');
			return false;
		}
		if (!checkNum.test(isoNo)){
			alert('ISON번호는 숫자만 입력가능합니다.');
			return false;
		}
		
		return true;
	}

	<%-- 삭제 버튼 --%>
	function deleteDimNation(nationId){
		if (confirm("정말 삭제하시겠습니까?")){
			location = "deleteDimNation.do?nationId="+nationId
						+"&continent=${continent}";
		}
	}
</script>

<c:set var="continentList" value="${fn:split('아시아,유럽,오세아니아,북아메리카,남아메리카,아프리카',',')}"/>

            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">국가관리</h1>
                        <div class="card mb-4">
                        	<div class="card-header">
								<i class="fas fa-table me-1"></i> 국가 생성
							</div>
								<form name="insertDimNation" method="post" action="insertDimNation.do" onsubmit="return checkData(insertDimNation)">
								<table class="table">
									<thead>
										<tr>
											<th>국가명(한글)</th>
											<th>국가명(영문)</th>
											<th>대륙명</th>
											<th>ISO코드</th>
											<th>ISO3코드</th>
											<th>ISON번호</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>
												<input type="text" id="nationNm" size="12" maxlength="33" required>
											</td>
											<td>
												<input type="text" id="nationNmEn" size="12" maxlength="100" required>
											</td>
											<td>
												<select name="continent">
													<c:forEach items="${continentList}" var="item">
														<option value="${item}">${item}</option>
													</c:forEach>
												</select>
											</td>
											<td>
												<input type="text" id="isoCd" size="12" maxlength="10">
											</td>
											<td>
												<input type="text" id="iso3Cd" size="12" maxlength="10">
											</td>
											<td>
												<input type="text" id="isoNo" size="12" maxlength="10"></td>
											<td>
											<button type="submit">생성</button>
											<button type="reset">취소</button>
											</td>
										</tr>							
									</tbody>
								</table>
								</form>
                        		
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                국가 관리
                            </div>
                            <div class="card-body">
	                            <div class="card-body">
	                               <form method="post" action="dimNationList.do">
	                               	대륙
	                               	<select name="continent">
	                               		<c:forEach items="${continentList}" var="item">
	                               			<option 
	                               				<c:if test="${continent eq item}">selected="selected"</c:if>
	                               				value="${item}">${item}
	                               			</option>
	                               		</c:forEach>
	                               	</select>
	                               	
	                               	<button type="submit">조회</button>
	                               </form>
	                               <button onclick="dimNationList.do">전체보기</button>
	                            </div>
                                <table class="table">
                                    <thead>
                                        <tr>
                                        	<th>번호</th>
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
	                                        <c:forEach items="${dimNationList}" var="vo" varStatus="status">
	                                        	<tr>
		                                        	<form name="updateDimNation${vo.nationId}" action="updateDimNation.do" method="post" onsubmit="return checkData(updateDimNation${vo.nationId})">
		                                        		<td><input name="index" size="1" value="${status.count}" readonly></td>
		                                        		<td><input name="nationId" size="12" value="${vo.nationId}" readonly></td>
		                                        		<td><input name="nationNm" size="12" maxlength="33" value="${vo.nationNm}" class="${vo.nationId}" readonly required></td>
		                                        		<td><input name="nationNmEn" size="12" maxlength="100" value="${vo.nationNmEn}" class="${vo.nationId}" readonly required></td>
		                                        		<td><input name="isoCd" size="12" maxlength="10" value="${vo.isoCd}" class="${vo.nationId}" readonly></td>
		                                        		<td><input name="iso3Cd" size="12" maxlength="10" value="${vo.iso3Cd}" class="${vo.nationId}" readonly></td>
		                                        		<td><input name="isoNo" size="12" maxlength="10" value="${vo.isoNo}" class="${vo.nationId}" readonly></td>
		                                        			
		                                        		<td><select name="continent" id="nationId${vo.nationId}" disabled>
		                                        				<c:forEach items="${continentList}" var="item">
			                                        				<option
			                                        					<c:if test="${item eq vo.continent}">selected="selected"</c:if>
			                                        					value="${item}">${item}
			                                        				</option>
			                                        			</c:forEach>
		                                        			</select>
		                                        		</td>
	           		
		                                        		<td><input name="rgtrDt" size="17" value="<fmt:formatDate value="${vo.rgtrDt}" pattern="yyyy-MM-dd HH:mm:ss"/>" readonly></td>
		                                        		<td><input name="rgtrId" size="12" value="${vo.rgtrId}" readonly></td>
		                                        		<td><input name="rgtrDt" size="17" value="<fmt:formatDate value="${vo.updtDt}" pattern="yyyy-MM-dd HH:mm:ss"/>" readonly></td>
		                                        		<td><input name="updtId" size="12" value="${vo.updtId}" readonly></td>
		                                        		<td id="updateBtn${vo.nationId}">
		                                        			<button type="button" onClick="location.href='javascript:updateDimNation${vo.nationId}()'">
		                                        				수정
		                                        			</button>
		                                        		</td>
		                                        		<td id="submitBtn${vo.nationId}" hidden>
		                                        			<button type="submit">
		                                        				수정
		                                        			</button>
		                                        		</td>
	                                        		</form>
	                                        			<td>
		                                        			<button onclick="deleteDimNation(${vo.nationId})">
		                                        				삭제
		                                        			</button>
		                                        		</td>
	                                        	</tr>
	                                        <script>
	                                        	<%-- 수정 버튼 --%>
												function updateDimNation${vo.nationId}() {
													$("#nationId${vo.nationId}").attr('disabled', false);
													$(".${vo.nationId}").attr('readonly', false);
													$("#updateBtn${vo.nationId}").hide();
													$("#submitBtn${vo.nationId}").attr('hidden', false);
												};
											</script>
	                                        </c:forEach>
	                                     
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
<%@ include file="../footer.jsp"%>