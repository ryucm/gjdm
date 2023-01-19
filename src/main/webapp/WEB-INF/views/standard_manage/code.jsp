
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../header.jsp"%>
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

function updateDistrict${vo.codeId}() {
	$("#groupCode${vo.groupCode}").attr('disabled', false);
	$(".${vo.codeId}").attr('readonly', false);
	$("#updateBtn${vo.codeId}").hide();
	$("#submitBtn${vo.codeId}").attr('hidden', false);
};

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
								<td><input name="codeId" class="${vo.codeId}" value="${vo.codeId}"  readonly size="8%"></td>
								<td><input name="groupCode" class="${vo.groupCode}" value="${vo.groupCode}"  readonly size="8%"></td>
								<td><input name="groupName" class="${vo.groupName}" value="${vo.groupName}"  readonly size="8%"></td>
								<td><input name="code" class="${vo.code}" value="${vo.code}"  readonly size="8%"></td>
								<td><input name="codeValue" class="${vo.codeValue}" value="${vo.codeValue}"  readonly size="8%"></td>
								<td><input name="displayName" class="${vo.displayName}" value="${vo.displayName}"  readonly size="8%"></td>
								<td><input name="useYN" class="${vo.useYN}" value="${vo.useYN}"  readonly size="1%"></td>
								<td><input value="<fmt:formatDate value="${vo.rgtrDt}" pattern="yyyy-MM-dd HH:mm:ss"/>"  readonly size="18.5%"></td>
								<td><input name="rgtrId" class="${vo.rgtrId}" value="${vo.rgtrId}"  readonly size="8%"></td>
								<td><input value="<fmt:formatDate value="${vo.rgtrDt}" pattern="yyyy-MM-dd HH:mm:ss"/>"  readonly size="18.5%"></td>
								<td><input name="codeId" class="${vo.codeId}" value="${vo.codeId}"  readonly size="8%"></td>
							<%-- 	<td><c:out value="${vo.codeId}" /></td>
								<td><c:out value="${vo.groupCode}" /></td>
								<td><c:out value="${vo.groupName}" /></td>
								<td><c:out value="${vo.code}" /></td>
								<td><c:out value="${vo.codeValue}" /></td>
								<td><c:out value="${vo.displayName}" /></td>
								<td><c:out value="${vo.useYN}" /></td>
								<td><fmt:formatDate value="${vo.rgtrDt}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
								<td><c:out value="${vo.rgtrId}" /></td>
								<td><fmt:formatDate value="${vo.updtDt}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
								<td><c:out value="${vo.updtId}" /></td> --%>
								<td id="updateBtn${vo.codeId}">
									<button type="button" onClick="updateDistrict${vo.codeId}()" value="수정">수정</button>
								</td>
								<td id="submitBtn${vo.codeId}" hidden>
									<button type="submit" onClick="updateDistrict${vo.codeId}()">수정</button>
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
<%@ include file="../footer.jsp"%>