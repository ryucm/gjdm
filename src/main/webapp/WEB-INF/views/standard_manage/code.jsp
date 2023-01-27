
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../header.jsp"%>
<script>
function fn_submit() {
	const regex = /^[A-Z0-9]*$/;
	if(document.frm.groupCode.value == ""){
		alert("코드 그룹을 입력해 주세요.")
		document.frm.groupCode.focus();
		return false
	} else if (!regex.test(document.frm.groupCode.value)) {
		alert("코드 그룹은 영어 대문자와 숫자만 입력 가능합니다.")
		return false
	}
	if(document.frm.groupName.value == ""){
		alert("코드 그룹명을 입력해 주세요.")
		document.frm.groupCode.focus();
		return false
	}
	if(document.frm.code.value == ""){
		alert("코드를 입력해 주세요.")
		document.frm.code.focus();
		return false
	}
	if(document.frm.codeValue.value == ""){
		alert("코드값를 입력해 주세요.")
		document.frm.code.focus();
		return false
	}
	if(document.frm.displayName.value == ""){
		document.frm.displayName.value = document.frm.codeValue.value
	} 
	
	document.frm.submit();
}

function fn_delete(codeId){
	
	if( confirm("정말 삭제하시겠습니까?")) {
		location = "deleteCode.do?codeId="+codeId;
	}
}

function updateCode(codeId) {
	$("."+codeId).attr("readonly", false);
	$("#updateBtn"+codeId).hide();
	$("#deleteBtn"+codeId).hide();
	$("#submitBtn"+codeId).attr('hidden', false);
	$("#resetBtn"+codeId).attr('hidden', false);
};

</script>
<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid px-4">
			<h1 class="mt-4">코드 관리</h1>
			<div class="card mb-4">
				<div class="card-header">
					<i class="fas fa-table me-1"></i> 코드 생성
				</div>
				<form name="frm" method="get" action="insertCode.do">
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
								<td><input name = "groupCode" type="text" id="groupCode" size="12"></td>
								<td><input name = "groupName" type="text" id="groupName" size="12"></td>
								<td><input name = "code" type="text" id="code" size="12"></td>
								<td><input name = "codeValue" type="text" id="codeValue" size="12"></td>
								<td><input name = "displayName" type="text" id="displayName" size="12"></td>
								<td><select name="useYN">
										<option value="Y">Y</option>
										<option value="N">N</option>
								</select></td>
								<input name = "rgtrId" type="hidden" value="test">
	                            <input name = "updtId" type="hidden" value="test">
								<td>
									<button type="submit" onclick="fn_submit(); return false;">생성</button>
									<button type="reset">취소</button>
								</td>
							</tr>
						</tbody>
					</table>
				</form>
				<div class="card-header">
					<i class="fas fa-table me-1"></i> 코드 조회
				</div>
				<form action="code.do" method="post">
					<label for="codeSearch"> 코드 ID <input type="text" name="codeId" value="${codeId}"></label>
					<label> 코드 그룹 <input type="text" name="groupCode" value="${groupCode}"></label>
					<label> 코드 <input type="text" name="code" value="${code}"></label>
					<button type="submit">조회</button>
				</form>
				<div class="card-header">
					<i class="fas fa-table me-1"></i> 코드 내역
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
								<form action="updateCode.do" method="post">
									<td><input name="codeId" value="${vo.codeId}" readonly
										size="8%"></td>
									<td><input name="groupCode" class="${vo.codeId}"
										value="${vo.groupCode}" readonly size="8%"></td>
									<td><input name="groupName" class="${vo.codeId}"
										value="${vo.groupName}" readonly size="8%"></td>
									<td><input name="code" class="${vo.codeId}"
										value="${vo.code}" readonly size="8%"></td>
									<td><input name="codeValue" class="${vo.codeId}"
										value="${vo.codeValue}" readonly size="8%"></td>
									<td><input name="displayName" class="${vo.codeId}"
										value="${vo.displayName}" readonly size="8%"></td>
									<td><select name="useYN" class="${vo.codeId}" size="1%">
											<option
												<c:if test="${vo.useYN eq 'Y'}">selected="selected"</c:if>
												value="Y">Y</option>
											<option
												<c:if test="${vo.useYN eq 'N'}">selected="selected"</c:if>
												value="N">N</option>
									</select></td>
									<td><input
										value="<fmt:formatDate value="${vo.rgtrDt}" pattern="yyyy-MM-dd HH:mm:ss"/>"
										disabled size="18.5%"></td>
									<td><input name="rgtrId" class="${vo.rgtrId}"
										value="${vo.rgtrId}" disabled size="8%"></td>
									<td><input
										value="<fmt:formatDate value="${vo.updtDt}" pattern="yyyy-MM-dd HH:mm:ss"/>"
										disabled size="18.5%"></td>
									<td><input class="${vo.codeId}"
										value="${vo.updtId}" disabled size="8%"></td>
									<td id="updateBtn${vo.codeId}">
										<button type="button" onClick="updateCode(${vo.codeId})"
											>수정</button>
									</td>
									<td id="submitBtn${vo.codeId}" hidden>
										<button type="submit">저장</button>
									</td>
									<td id="deleteBtn${vo.codeId}">
										<button type="button" onclick="fn_delete(${vo.codeId})">삭제</button>
									</td>
									<td id="resetBtn${vo.codeId}" hidden>
										<button type="reset">취소</button>
									</td>
								</form>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</main>
</div>
<%@ include file="../footer.jsp"%>