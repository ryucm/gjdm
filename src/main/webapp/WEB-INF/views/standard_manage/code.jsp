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
	if (confirm("지역 ID '" + codeId + "' 를 수정하시겠습니까?")) {
		$("#editForm").submit();
	};
};

function modifyCode(codeId) {
	$("#modifyBtn"+codeId).hide();
	$("#useYN"+codeId).hide();
	$("#useYNSelect"+codeId).attr('hidden', false);
	$("#submitBtn"+codeId).attr('hidden', false);
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
					<table>
						<colgroup>
							<col width="20%" />
							<col width="20%" />
							<col width="20%" />
							<col width="20%" />
							<col />
						</colgroup>
						<tr>
							<form name="frm" action="dimCodeLIst.do" method="post">
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
										<a href="JavaScript:inquireCode(); return false;"
											class="btn btnType01">조회</a>
									</div>
								</td>
							</form>
						</tr>
					</table>
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
				<div class="table_type1">
					<table summary="">
						<colgroup>
							<col width="8%" />
							<col width="8%" />
							<col width="8%" />
							<col width="8%" />
							<col width="8%" />
							<col width="8%" />
							<col width="1%" />
							<col width="16.5%" />
							<col width="8%" />
							<col width="16.5%" />
							<col width="8%" />
							<col width="20" />
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
								<tr>
									<form action="updateCode.do" method="post" id="editForm">
										<td name="codeId">${vo.codeId}</td>
										<td contenteditable="true" name="groupCode">${vo.groupCode}</td>
										<td contenteditable="true" name="groupName">${vo.groupName}</td>
										<td contenteditable="true" name="code">${vo.code}</td>
										<td contenteditable="true" name="codeValue">${vo.codeValue}</td>
										<td contenteditable="true" name="displayName">${vo.displayName}</td>
										<td id="useYN${vo.codeId}">${vo.useYN}</td>
										<td id="useYNSelect${vo.codeId}" hidden><select
											name="useYN" class="${vo.codeId}" size="1%"
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
									<td  id="modifyBtn${vo.codeId}">
										<a href="JavaScript:modifyCode(${vo.codeId})"
											class="gridBtn btnEdit">수정</a>
										 <a href="JavaScript:fn_delete(${vo.codeId})"
											class="gridBtn btnDelete">삭제</a></td>
									<td id="submitBtn${vo.codeId}" hidden>
										<a href="JavaScript:updateCode(${vo.codeId})"
											class="gridBtn btnEdit">저장</a>
										<a href="JavaScript:fn_delete(${vo.codeId})"
											class="gridBtn btnDelete">삭제</a></td>
									</form>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="gridFooter">
					<div class="page_info">Showing 1 to 5 of 150 entries</div>
					<div>
						<!-- Paging -->
						<div class="paging">
							<a href="#" class="board_prev"><img
								src="resources/images/ico_board_prev_end.png" alt="First" /></a> <a
								href="#" class="board_prev"><img
								src="resources/images/ico_board_prev.png" alt="Previous" /></a> <strong>1</strong>
							<a href="#">2</a> <a href="#">3</a> <a href="#">4</a> <a href="#">5</a>
							<a class="board_next" href="#"><img
								src="resources/images/ico_board_next.png" alt="Next" /></a> <a
								class="board_next" href="#"><img
								src="resources/images/ico_board_next_end.png" alt="Next End" /></a>
							<select class="select-select" data-placeholder="10">
								<option>10</option>
								<option>10</option>
								<option>20</option>
								<option>50</option>
								<option>100</option>
							</select>
						</div>
						<!-- Paging -->
					</div>
				</div>
			</div>
		</article>
	</main>
	<!----- Contents End ----->
</div>
<!---- Layer Popup ---->
<div id="layer_area" style="display: none;">
  <div class="layer_pop"></div>
  <div class="layer_wrap" style="width:500px;">
    <div class="layBox">
      <p class="btn_close"><a href="#none" class="closeLy"><img src="resources/images/ico_pop_close.png" title="close" alt="close" /></a></p>
      <h1>코드등록<span>스마트관광 빅데이터 플랫폼</span></h1>
      <div class="layerCon">
        <div class="pop_tableType1">
          <table>
          	<form name="insert" method="post" class="insertForm">
          	<tr>
              <td>
                <p>코드 그룹</p>
                <input type="text" class="inputArea" name="groupCode" style="width:100%;"></td>
            </tr>
            <tr>
              <td>
                <p>코드 그룹명</p>
                <input type="text" class="inputArea" name="groupName" style="width:100%;"></td>
            </tr>
            <tr>
              <td>
                <p>코드</p>
                <input type="text" class="inputArea" name="code" style="width:100%;"></td>
            </tr>
            <tr>
              <td>
                <p>코드값</p>
                <input type="text" class="inputArea" name="codeValue" style="width:100%;"></td>
            </tr>
            <tr>
              <td>
                <p>출력값</p>
                <input type="text" class="inputArea" name="displayName" style="width:100%;"></td>
            </tr>
            <tr>
              <td>
                <p>사용여부</p>
                <select name="useYN" style="width:100%;">
                  <option>Y</option>
                  <option>N</option> 
                </select></td>
            </tr>
            </form>
          </table>
        </div>
        <div class="pop_btnArea">
            <a href="#" onclick="fn_submit(); return false;" class="btn btnType01">추가</a><a class="btn btnType02 closely">취소</a>
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
		if (document.insert.groupCode.value == "") {
			alert("코드 그룹을 입력해 주세요.")
			document.insert.groupCode.focus();
			return false
		} else if (!regex.test(document.insert.groupCode.value)) {
			alert("코드 그룹은 영어 대문자와 숫자만 입력 가능합니다.")
			return false
		}
		if (document.insert.groupName.value == "") {
			alert("코드 그룹명을 입력해 주세요.")
			document.insert.groupCode.focus();
			return false
		}
		if (document.insert.code.value == "") {
			alert("코드를 입력해 주세요.")
			document.insert.code.focus();
			return false
		}
		if (document.insert.codeValue.value == "") {
			alert("코드값를 입력해 주세요.")
			document.insert.code.focus();
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
         		window.opener.location.reload();
             	window.close();
          },
      	error: function(e) {
      		alert(e)
      	}    
		})
	}
  </script>
<%@ include file="../footer.jsp"%>