<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../header.jsp"%>
<script>

function fn_delete(codeId){
	
	if( confirm("정말 삭제하시겠습니까?")) {
		location = "deleteCode.do?codeId="+codeId;
	}
}

function modify(id){
	$('.nonEdit[name="'+id+'"]').css('display', 'none');
	$('.editable[name="'+id+'"]').css('display', 'table-row')
}

function cancel(id){
	if (confirm("변경된 내용이 저장되지 않습니다.\n그래도 취소하시겠습니까?")) {
		location.reload();
	}
	
}
function updateCode(codeId) {
	if (confirm("코드 ID '" + codeId + "' 를 수정하시겠습니까?")) {
		var codeId = $('.editable[name="'+codeId+'"] td[name="codeId"]').text();
		var groupCode = $('.editable[name="'+codeId+'"] input[name="groupCode"]').val();
		var groupName = $('.editable[name="'+codeId+'"] input[name="groupName"]').val();
		var code = $('.editable[name="'+codeId+'"] input[name="code"]').val();
		var codeValue = $('.editable[name="'+codeId+'"] input[name="codeValue"]').val();
		var displayName = $('.editable[name="'+codeId+'"] input[name="displayName"]').val();
		var useYN = $('.editable[name="'+codeId+'"] select[name="useYN"] option:selected').text();
		
		if (displayName == ""){
			displayName = codeValue;
		}
		$.ajax({
		method: 'POST',
		url: '/gjdm/updateCode.do',
		data: {
			codeId,
			groupCode,
			groupName,
			code,
			codeValue,
			displayName,
			useYN
			},
		success: function () {
       		location.reload();
       	}
		});
	}
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
	if (!regex.test(document.inquire.codeId.value)) {
		alert("코드 ID는 숫자만 입력 가능합니다.")
		return false
	}
	document.inquire.submit();
}

/* Pagination 버튼 클릭 */
function pageClick(pageNo){
	//text to html
	const parser = new DOMParser();
	
	var contentLimit = $('#contentLimit option:selected').val();
	
	//contentLimit select 클릭시 1페이지로 이동
	if (pageNo == 0){
		pageNo = 1;
	}
	
	$.ajax({
		type : 'POST',
		url : '/gjdm/dimCodeList.do',
		data : {
			'contentLimit' : contentLimit,
			'currentPage' : pageNo
		},
		dataType : 'html',
		success : function(data){
			//text to html
			data = parser.parseFromString(data, 'text/html');
			
			//change table
			var resultTable = data.getElementById('resultTable').childNodes;
			$('#resultTable').empty();
			$('#resultTable').html(resultTable);
			
			//change paging button
			var pagingButton = data.getElementById('pagingButton').childNodes;
			$('#pagingButton').empty();
			$('#pagingButton').html(pagingButton);
		},
		error : function(e){
			console.log(e);
		}
	});
}
</script>

<div class="col-2">
	<header>
		<div class="top_navbar">
			<div class="hamburger">
				<a href="#"> menu </a>
			</div>
		</div>
		<div class="title">코드관리</div>
	</header>
	<!----- Contents Start ----->
	<main class="content">
		<article>
			<div class="contentArea">
				<!-- Search -->
				<div class="searchTable1 mB15">
					<form name="inquire" action="dimCodeList.do" method="post">
						<table>
							<colgroup>
								<col width="20%" />
								<col width="20%" />
								<col width="20%" />
								<col width="20%" />
								<col />
							</colgroup>
							<tr>
								<td>
									<p>코드 ID</p> <input type="text" name="codeId" id="codeId">
								</td>
								<td>
									<p>코드 그룹</p> <input type="text" name="groupCode" id="groupCode">
								</td>
								<td>
									<p>코드</p> <input type="text" name="code" id="code">
								</td>
								<td>
									<div class="btnArea">
										<a href="#" onclick="inquireCode(); return false;"
											class="btn btnType01">조회</a>
									</div>
								</td>

							</tr>
						</table>
					</form>
				</div>
				<!-- Search -->
				<!-- Subtitle -->
				<div class="subtitle">
					<h3>검색결과</h3>
					<div>
						<a id="codeModal" class="btn btn-create">새 코드 등록</a>
					</div>
				</div>
				<!-- Subtitle -->
				<!-- Grid Area -->
				<div id="resultTable" class="table_type1">
					<table summary="">
						<colgroup>
							<col width="6%" />
							<col width="6%" />
							<col width="6%" />
							<col width="6%" />
							<col width="6%" />
							<col width="6%" />
							<col width="4%" />
							<col width="15%" />
							<col width="6%" />
							<col width="15%" />
							<col width="6%" />
							<col />
						</colgroup>
						<thead>
							<tr>
								<th scope="col">코드ID</th>
								<th scope="col">코드그룹</th>
								<th scope="col">코드그룹명</th>
								<th scope="col">코드</th>
								<th scope="col">코드값</th>
								<th scope="col">출력명</th>
								<th scope="col">사용여부</th>
								<th scope="col">등록일시</th>
								<th scope="col">등록자</th>
								<th scope="col">변경일시</th>
								<th scope="col">변경자</th>
								<th scope="col"></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${dimCodeList}" var="vo">
								<tr class="nonEdit" name=${vo.codeId}>
									<td>${vo.codeId}</td>
									<td>${vo.groupCode}</td>
									<td>${vo.groupName}</td>
									<td>${vo.code}</td>
									<td>${vo.codeValue}</td>
									<td>${vo.displayName}</td>
									<td>${vo.useYN}</td>
									<td><fmt:formatDate value="${vo.rgtrDt}"
											pattern="yyyy-MM-dd HH:mm:ss" /></td>
									<td>${vo.rgtrId}</td>
									<td><fmt:formatDate value="${vo.updtDt}"
											pattern="yyyy-MM-dd HH:mm:ss" /></td>
									<td name="updtId">${vo.updtId}</td>
									<td id="modifyBtn${vo.codeId}"><a
										href="JavaScript:modify(${vo.codeId})"
										class="gridBtn btnEdit">수정</a> <a
										href="JavaScript:fn_delete(${vo.codeId})"
										class="gridBtn btnDelete">삭제</a></td>
								</tr>
								<tr></tr>
								<form>
								<tr name="${vo.codeId}" class="editable" style="display: none">
									<td name="codeId">${vo.codeId}</td>
									<td><input type="text" name="groupCode"
										style="width: 90%;" class="inputArea" required
										value="${vo.groupCode}"></td>
									<td><input type="text" name="groupName"
										style="width: 90%;" class="inputArea" required
										value="${vo.groupName}"></td>
									<td><input type="text" name="code" style="width: 90%;"
										class="inputArea" required value="${vo.code}"></td>
									<td><input type="text" name="codeValue"
										style="width: 90%;" class="inputArea" required
										value="${vo.codeValue}"></td>
									<td><input type="text" name="displayName"
										style="width: 90%;" class="inputArea"
										value="${vo.displayName}"></td>
									<td id="useYNSelect${vo.codeId}"><select name="useYN"
										style="text-align-last: center">
											<option
												<c:if test="${vo.useYN eq 'Y'}">selected="selected"</c:if>
												value="Y">Y</option>
											<option
												<c:if test="${vo.useYN eq 'N'}">selected="selected"</c:if>
												value="N">N</option>
									</select></td>
									<td><fmt:formatDate value="${vo.rgtrDt}"
											pattern="yyyy-MM-dd HH:mm:ss" /></td>
									<td>${vo.rgtrId}</td>
									<td><fmt:formatDate value="${vo.updtDt}"
											pattern="yyyy-MM-dd HH:mm:ss" /></td>
									<td name="updtId">${vo.updtId}</td>
									<td id="submitBtn${vo.codeId}"><a href="#"
										onclick="updateCode(${vo.codeId})" class="gridBtn btnSave">저장</a>
										<a href="JavaScript:cancel(${vo.codeId})" class="gridBtn btnCancel">취소</a></td>
								</tr>
								</form>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<!-- Grid Area -->
				<div class="gridFooter" id="pagingButton">
					<div class="page_info">Showing ${(currentPage-1)*contentLimit+1} to ${(currentPage-1)*contentLimit+contentLimit>totalContentCount?totalContentCount:(currentPage-1)*contentLimit+contentLimit} of ${totalContentCount} entries</div>
					<div>
						<!-- Paging -->
						<div class="paging">
							<c:if test="${currentPage > buttonPerSection+0}">
								<a onclick="pageClick(1)" class="board_prev"><img
									src="resources/images/ico_board_prev_end.png" alt="First" /></a>
								<a onclick="pageClick(${startButtonNo-1})" class="board_prev"><img
									src="resources/images/ico_board_prev.png" alt="Previous" /></a>
							</c:if>
							<c:forEach var="pageNo" begin="${startButtonNo}"
								end="${endButtonNo}" step="1">
								<a onclick="pageClick(${pageNo})"> <c:if
										test="${currentPage == pageNo}">
										<strong>
									</c:if> ${pageNo} <c:if test="${currentPage == pageNo}">
										</strong>
									</c:if>
								</a>
							</c:forEach>
							<c:if test="${currentPage < totalButtonCount-buttonPerSection+1}">
								<a onclick="pageClick(${endButtonNo+1})" class="board_next"><img
									src="resources/images/ico_board_next.png" alt="Next" /></a>
								<a onclick="pageClick(${totalButtonCount})" class="board_next"><img
									src="resources/images/ico_board_next_end.png" alt="Next End" /></a>
							</c:if>

							<select id="contentLimit" class="select-select"
								onchange="pageClick(0)" data-placeholder="10">
								<option value="10"
									<c:if test="${contentLimit == 10}">selected="selected"</c:if>>10</option>
								<option value="20"
									<c:if test="${contentLimit == 20}">selected="selected"</c:if>>20</option>
								<option value="50"
									<c:if test="${contentLimit == 50}">selected="selected"</c:if>>50</option>
								<option value="100"
									<c:if test="${contentLimit == 100}">selected="selected"</c:if>>100</option>
							</select>
						</div>
						<!-- Paging -->
					</div>
				</div>
			</div>
		</article>
	</main>
</div>
	<!----- Contents End ----->

<!---- Layer Popup ---->
<div id="layer_area" style="display: none;">
	<div class="layer_pop"></div>
	<div class="layer_wrap" style="width: 500px;">
		<div class="layBox">
			<p class="btn_close">
				<a href="#none" class="closeLy"><img
					src="resources/images/ico_pop_close.png" title="close" alt="close" /></a>
			</p>
			<h1>
				코드등록<span>스마트관광 빅데이터 플랫폼</span>
			</h1>
			<div class="layerCon">
				<div class="pop_tableType1">
					<table>
						<form name="insert" method="post" class="insertForm">
							<tr>
								<td>
									<p>코드 그룹</p> <input type="text" class="inputArea"
									name="groupCode" style="width: 100%;" required>
								</td>
							</tr>
							<tr>
								<td>
									<p>코드 그룹명</p> <input type="text" class="inputArea"
									name="groupName" style="width: 100%;" required>
								</td>
							</tr>
							<tr>
								<td>
									<p>코드</p> <input type="text" class="inputArea" name="code"
									style="width: 100%;" required>
								</td>
							</tr>
							<tr>
								<td>
									<p>코드값</p> <input type="text" class="inputArea"
									name="codeValue" style="width: 100%;" required>
								</td>
							</tr>
							<tr>
								<td>
									<p>출력값</p> <input type="text" class="inputArea"
									name="displayName" style="width: 100%;">
								</td>
							</tr>
							<tr>
								<td>
									<p>사용여부</p> <select name="useYN" style="width: 100%;">
										<option>Y</option>
										<option>N</option>
								</select>
								</td>
							</tr>
							<input type="hidden" name="rgtrId" value="test"> <input
								type="hidden" name="updtId" value="test">
						</form>
					</table>
				</div>
				<div class="pop_btnArea">
					<a href="#" onclick="fn_submit(); return false;"
						class="btn btnType01">추가</a><a onclick="fn_exit()"
						class="btn btnType02 closely">취소</a>
				</div>
			</div>
		</div>
	</div>
</div>
	<!---- Layer Popup ---->
	<script>
  $('#codeModal').click(function(){
		$('#layer_area').show();
	});
  function fn_submit() {
		const regex = /^[A-Z0-9]*$/;
		if (!regex.test(document.insert.groupCode.value)) {
			alert("코드 그룹은 영어 대문자와 숫자만 입력 가능합니다.")
			return false
		}
		
		if (document.insert.displayName.value == "") {
			document.insert.displayName.value = document.insert.codeValue.value
		}
		
		var formData = $(".insertForm").serialize()
		$.ajax({
          type: "POST",
          url: "/gjdm/insertCode.do",
          data: formData,
          success: function () {
         		alert("등록 완료")
         		 $('#layer_area').hide();
         		location.reload();
          },
          error: function(e) {
      		alert("등록 실패")
      	}    
		})
	}
  </script>
	<%@ include file="../footer.jsp"%>