<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../header.jsp"%> 
 <div class="col-2">
  	<header>    
      <div class="top_navbar">
        <div class="hamburger">
            <a href="#">
                menu
            </a>
        </div>
      </div>
      <div class="title">ETL 배치관리</div>
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
							<form name="frm" action="/gjdm/etlBatchList.do" method="post">
								<td>
									<p>ETL ID</p> <input type="text" name="etlId" id="etlId">
								</td>
								<td>
									<p>프로그램명</p> <input type="text" name="etlName" id="etlName">
								</td>
								<td>
									<div class="btnArea">
										<a href="JavaScript:formSubmit(); return false;"
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
						<a id="etlModal" class="btn btn-create">등록</a>
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
							<col width="8%" />
							<col width="8%" />
							<col width="11%" />
							<col width="7%" />
							<col width="11%" />
							<col width="7%" />
						</colgroup>
						<thead>
							<tr>
                                <th scope="col">ETL ID</th>
						        <th scope="col">ETL타입</th>
                                <th scope="col">프로그램명</th>
                                <th scope="col">비고</th>
								<th scope="col">실행주기</th>
                                <th scope="col">실행횟수</th>
                                <th scope="col">파라메터</th>
                                <th scope="col">소스시스템</th>
                                <th scope="col">타겟시스템</th>
                                <th scope="col">등록일시</th>
                                <th scope="col">등록자</th>
                                <th scope="col">변경일시</th>
                                <th scope="col">변경자</th>
                            </tr>
                          </thead>
                          <tbody>
							<c:forEach items="${etlBatchList}" var="vo">
								<tr>
									<form action="/gjdm/updateEtlBatch.do" method="post" id="editForm">
										<td name="etlId">${vo.etlId}</td>
										<td contenteditable="true" name="jobType">${vo.jobType}</td>
										<td contenteditable="true" name="etlName">${vo.etlName}</td>
										<td contenteditable="true" name="etlDesc">${vo.etlDesc}</td>
										<td contenteditable="true" name="frqBase">${vo.frqBase}</td>
										<td contenteditable="true" name="frqNum">${vo.frqNum}</td>
										<td contenteditable="true" name="etlParam">${vo.etlParam}</td>
										<td contenteditable="true" name="srcSystem">${vo.srcSystem}</td>
										<td contenteditable="true" name="tgtSystem">${vo.tgtSystem}</td>
										<td><fmt:formatDate value="${vo.rgtrDt}"
											pattern="yyyy-MM-dd HH:mm:ss" /></td>
										<td>${vo.rgtrId}</td>
										<td><fmt:formatDate value="${vo.updtDt}"
											pattern="yyyy-MM-dd HH:mm:ss" /></td>
										<td name="updtId">${vo.updtId}</td>
										<td  id="modifyBtn${vo.etlId}">
										<a href="JavaScript:modifyEtl(${vo.etlId})"
											class="gridBtn btnEdit">수정</a>
										<a href="JavaScript:fn_delete(${vo.etlId})"
											class="gridBtn btnDelete">삭제</a></td>
									<td id="submitBtn${vo.etlId}" hidden>
										<a href="JavaScript:updateCode(${vo.etlId})"
											class="gridBtn btnEdit">저장</a>
										<a href="JavaScript:fn_delete(${vo.etlId})"
											class="gridBtn btnDelete">삭제</a></td>
									</form>
								</tr>
							</c:forEach>                          
                         </tbody>
                       </table>
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
      <h1>배치등록<span>스마트관광 빅데이터 플랫폼</span></h1>
      <div class="layerCon">
        <div class="pop_tableType1">
          <table>
          	<form name="insert" method="post" class="insertForm">
          	<tr>
              <td>
                <p>ETL ID</p>
                <input type="text" class="inputArea" name="etlId" style="width:100%;"></td>
            </tr>
            <tr>
              <td>
                <p>프로그램명</p>
                <input type="text" class="inputArea" name="jobType" style="width:100%;"></td>
            </tr>
            <tr>
              <td>
                <p>비고</p>
                <input type="text" class="inputArea" name="etlDesc" style="width:100%;"></td>
            </tr>        									      
			</form>
		</table>
	</div>
</div>
	<script>
	/* etlbatch Insert 창 팝업 */
	function etlbatchInsert() {
    	var popupWidth = 800;
        var popupHeight = 600;
		var popupX = Math.round(window.screenX + (window.outerWidth / 2) - (popupWidth / 2));
        var popupY = Math.round(window.screenY + (window.outerHeight / 2) - (popupHeight / 2));
        window.open("etlbatchInsert.do", null, 'width=' + popupWidth + ',height=' + popupHeight + ',left='+ popupX + ', top='+ popupY);
    };
	/* 조회 */
    function formSubmit() {
	  $("#searchForm").submit();
    };
    /* 페이지 새로고침 시 GET parameter 초기화 */
    window.onkeydown = function(e) {
  	  var kcode = event.keyCode;
  	  if(kcode == 116 || kcode == 82 && e.ctrlKey) {
  		history.replaceState({}, null, location.pathname);
  	  }
    };
	/* etlbatch row 삭제 */
	function deleteEtlBatch(etlId) {
		if (confirm("지역 ID '" + etlId + "' 를 삭제하시겠습니까?")) {
			location = "deleteEtlBatch.do?etlId=" + etlId;
		};
	};
	function updateEtlBatch(etlId) {
		if(confirm("ETL ID '" + etlId + "' 를 수정하시겠습니까?")) {
		$("#etlId" + etlId).attr('disabled', false);
		$("." + etlId).attr('disabled', false);
		$("#updateBtn" + etlId).hide();
		$("#submitBtn" + etlId).attr('hidden', false);											
		}
	};
	function deleteEtlBatch(etlId) {
	if (confirm("ETL ID '" + etlId + "' 를 삭제하시겠습니까?")) {
		location = "deleteEtlBatch.do?etlId=" + etlId;
		};
	};
	</script>
<%@ include file="../footer.jsp"%>