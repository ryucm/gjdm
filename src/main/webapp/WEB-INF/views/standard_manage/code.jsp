
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../header.jsp"%>
<script>

function fn_delete(codeId){
	
	if( confirm("정말 삭제하시겠습니까?")) {
		location = "deleteCode.do?codeId="+codeId;
	}
}

function updateCode(codeId) {
	$("."+codeId).attr("readonly", false);
	$("."+codeId).attr("disabled", false);
	$("#updateBtn"+codeId).hide();
	$("#deleteBtn"+codeId).hide();
	$("#submitBtn"+codeId).attr('hidden', false);
	$("#resetBtn"+codeId).attr('hidden', false);
};

function insertCode() {
	var popupWidth = 800;
    var popupHeight = 600;

    var popupX = Math.round(window.screenX + (window.outerWidth / 2) - (popupWidth / 2));
    var popupY = Math.round(window.screenY + (window.outerHeight / 2) - (popupHeight / 2));
	window.open("codeInsert.do", null, 'width=' + popupWidth + ',height=' + popupHeight + ',left='+ popupX + ', top='+ popupY);
}

function inquireCode() {
	const regex = /^[0-9]*$/;
	if (!regex.test(document.frm.codeId.value)) {
		alert("코드 ID는 숫자만 입력 가능합니다.")
		return false
	}
	document.frm.submit();
}
</script>

<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid px-4">
			<div class="codeDiv">
				<h1 class="mt-4">코드 관리</h1>
				<button type="button" onClick="insertCode()" class="codeBtn newcode">새 코드 등록</button>
			</div>
			<div class="card mb-4">
				<div class="card-body">
					<form name="frm" action="code.do" method="post">
						<label> 코드 ID </label>
						<input type="text" name="codeId" id="codeId">
						<label> 코드 그룹 </label>
						<input type="text" name="groupCode" id="groupCode">
						<label> 코드 </label>
						<input type="text" name="code" id="code"> 
						<button type="submit" onclick="inquireCode(); return false;" class="codeBtn">조회</button>
					</form>
				</div>
			</div>
			<div class="card mb-4 codeList">
				<div class="card-body">
					<table>
						<thead>
							<tr>
								<th>코드ID</th>
								<th>코드그룹</th>
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
										<td><input name="codeId" value="${vo.codeId}" readonly size="8%" class="codeInput"></td>
										<td><input name="groupCode" class="${vo.codeId}" value="${vo.groupCode}" disabled required size="8%"></td>
										<td><input name="groupName" class="${vo.codeId}" value="${vo.groupName}" disabled required size="8%"></td>
										<td><input name="code" class="${vo.codeId}" value="${vo.code}" disabled required size="8%"></td>
										<td><input name="codeValue" class="${vo.codeId}" value="${vo.codeValue}" disabled required size="8%"></td>
										<td><input name="displayName" class="${vo.codeId}" value="${vo.displayName}" readonly size="8%"></td>
										<td><select name="useYN" class="${vo.codeId}" size="1%">
												<option
													<c:if test="${vo.useYN eq 'Y'}">selected="selected"</c:if>
													value="Y">Y</option>
												<option
													<c:if test="${vo.useYN eq 'N'}">selected="selected"</c:if>
													value="N">N</option>
										</select></td>
										<td><input value="<fmt:formatDate value="${vo.rgtrDt}" pattern="yyyy-MM-dd HH:mm:ss"/>" disabled size="18.5%"></td>
										<td><input name="rgtrId" class="codeIdInput" value="${vo.rgtrId}" disabled size="8%"></td>
										<td><input value="<fmt:formatDate value="${vo.updtDt}" pattern="yyyy-MM-dd HH:mm:ss"/>" disabled size="18.5%"></td>
										<td><input class="codeIdInput" value="${vo.updtId}" disabled size="8%"></td>
										<td id="updateBtn${vo.codeId}"><button type="button" onClick="updateCode(${vo.codeId})" class="codeBtn">수정</button></td>
										<td id="submitBtn${vo.codeId}" hidden><button type="submit" class="codeBtn">저장</button></td>
										<td id="deleteBtn${vo.codeId}"><button type="button" onclick="fn_delete(${vo.codeId})" class="codeBtn">삭제</button></td>
										<td id="resetBtn${vo.codeId}" hidden><button type="reset" class="codeBtn">취소</button></td>
									</form>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</main>
</div>
<style>
.codeList>.card-body {
	padding: 0;
}

table {
	margin: 0;
	width: 100%;
}

thead {
	border-bottom: 3px solid black;
	height: 40px;
}

th, td {
	text-align: center;
	padding: 0;
}

tr {
	padding: 3px;
	height: 35px;
}

tr:nth-child(even) {
	background-color: rgba(0, 0, 0, 0.03);
}

select {
	width: 150px;
}

td select[disabled] {
	-webkit-appearance: none; /* 크롬 화살표 없애기 */
	-moz-appearance: none; /* 파이어폭스 화살표 없애기 */
	appearance: none; /* 화살표 없애기 */
	border: none;
	text-align: center;
	background: none;
}

input {
	background-color: #f1f1f1;
	border: none;
	border-bottom: 1px solid #777;
}

input[disabled], input[readonly] {
	background: none;
	border: none;
	text-align: center;
}

:focus-visible {
	outline: none;
}

.codeDiv {
	display: flex;
	justify-content: space-between;
	align-items: flex-end;
}

.codeInput {
	width: 120px;
	padding: 3px;
	border-radius: 0;
	align-content: center;
}

.codeIdInput {
	width: 70px;
	text-align: center;
}

.codeBtn {
	box-shadow: inset 0px 1px 0px 0px #ffffff;
	background: linear-gradient(to bottom, #ededed 5%, #dfdfdf 100%);
	background-color: #ededed;
	border-radius: 6px;
	border: 1px solid #dcdcdc;
	display: inline-block;
	cursor: pointer;
	color: #777777;
	font-family: Arial;
	font-size: 13px;
	font-weight: bold;
	padding: 4px 15px;
	text-decoration: none;
	text-shadow: 0px 1px 0px #ffffff;
	margin: 1px;
}

.newcode {
	margin: 10px 0;
	float: right;
}

.codeBtn:hover {
	background: linear-gradient(to bottom, #dfdfdf 5%, #ededed 100%);
	background-color: #dfdfdf;
	color: #777777;
}

.codeBtn:active {
	position: relative;
	top: 1px;
}
</style>
<%@ include file="../footer.jsp"%>