
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../header.jsp"%>
<<<<<<< HEAD
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
                                        <tr>
                                            <td>Tiger Nixon</td>
                                            <td>System Architect</td>
                                            <td>Edinburgh</td>
                                            <td>61</td>
                                            <td>2011/04/25</td>
                                            <td>$320,800</td>
                                            <td>$320,800</td>
                                            <td>$320,800</td>
                                            <td>$320,800</td>
                                            <td>$320,800</td>
                                            <td>$320,800</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
=======
<script>
function fn_submit() {
	if(document.frm.groupCode.value == ""){
		alert("코드 그룹을 입력해 주세요.")
		document.frm.groupCode.focus();
		return false
	}
	if(document.frm.codeId.value == ""){
		alert("코드 그룹명을 입력해 주세요.")
		document.frm.codeId.focus();
		return false
	}
	if(document.frm.code.value == ""){
		alert("코드를 입력해 주세요.")
		document.frm.code.focus();
		return false
	}
	document.frm.submit();
}

function fn_delete(codeId){
	
	if( confirm("정말 삭제하시겠습니까?")) {
		location = "deleteCode.do?codeId="+codeId;
	}
}

</script>
<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid px-4">
			<h1 class="mt-4">코드관리</h1>
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table me-1"></i> 코드 생성
				</div>
					<form name="frm" method="post" action="/code.do">
					<table class="table">
						<thead>
							<tr>
								<th>코드 그룹</th>
								<th>코드 그룹명</th>
								<th>코드</th>
								<th>코드값</th>
								<th>출력값</th>
								<th>사용여부</th>
								<th>구분</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><input type="text" id="groupCode" size="12"></td>
								<td><input type="text" id="groupName" size="12"></td>
								<td><input type="text" id="code" size="12"></td>
								<td><input type="text" id="codeValue" size="12"></td>
								<td><input type="text" id="displayName" size="12"></td>
								<td>
									<select name="gid">
										<option value="Y">사용</option>
										<option value="N">미사용</option>
									</select>
								</td>
								<td>
								<button type="submit" onclick="fn_submit(); return false;">생성</button>
								<button type="reset">취소</button>
								</td>
							</tr>							
						</tbody>
					</table>
					</form>
				<div class="card-header">
					<i class="fas fa-table me-1"></i> 코드 관리
				</div>
				<table class="table">
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
							<th>수정</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${dimCodeList}" var="vo">
							<tr>
								<td><c:out value="${vo.codeId}" /></td>
								<td><c:out value="${vo.groupCode}" /></td>
								<td><c:out value="${vo.groupName}" /></td>
								<td><c:out value="${vo.code}" /></td>
								<td><c:out value="${vo.codeValue}" /></td>
								<td><c:out value="${vo.displayName}" /></td>
								<td><c:out value="${vo.useYN}" /></td>
								<td><fmt:formatDate value="${vo.rgtrDt}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
								<td><c:out value="${vo.rgtrId}" /></td>
								<td><fmt:formatDate value="${vo.updtDt}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
								<td><c:out value="${vo.updtId}" /></td>
								<td>
									<form name="update" method="get" action="/code.do?codeId=${vo.codeId}">
										<button type="submit" value="delete">수정</button>
									</form>
								</td>
								<td>
									<button type="button" onclick="fn_delete(${vo.codeId})">삭제</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</main>
</div>
>>>>>>> 4998cb63e1c3314063716d07b75f3bd3c8f66966
<%@ include file="../footer.jsp"%>