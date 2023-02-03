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
		<div class="title">지역관리</div>
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
							<form action="/gjdm/dimDistrictList.do" method="post" id="searchForm">
								<td>
									<p>국가</p>
									<select id="nationSearch" name="nationId" required onchange="selectNation(value)"
										style="width:100%;">
										<option value="" disabled selected>-------선택하세요-------</option>
										<c:forEach items="${dimNationList}" var="nation">
											<option value="${nation.nationId}" <c:if
												test="${nationId eq nation.nationId}">selected</c:if>>${nation.nationNm}
											</option>
										</c:forEach>
									</select>
								</td>
								<td>
									<p>시도</p>
									<select id="distLvl1Search" name="distLvl1" onchange="selectDistLvl1(value)"
										style="width:100%;">
										<option value="" disabled selected>-------선택하세요-------</option>
										<c:forEach items="${distLvl1List}" var="distLvl1List">
											<c:if test="${distLvl1List.nationId eq nationId}">
												<option value="${distLvl1List.distLvl1}" <c:if
													test="${distLvl1 eq distLvl1List.distLvl1}">selected
											</c:if>>${distLvl1List.distLvl1}</option>
											</c:if>
										</c:forEach>
									</select>
								</td>
								<td>
									<p>군구선택</p>
									<select id="distLvl2Search" name="distLvl2" style="width:100%;">
										<option value="" disabled selected>-------선택하세요-------</option>
										<c:forEach items="${distLvl2List}" var="distLvl2List">
											<c:if
												test="${distLvl2List.nationId eq nationId and distLvl2List.distLvl1 eq distLvl1}">
												<option value="${distLvl2List.distLvl2}" <c:if
													test="${distLvl2 eq distLvl2List.distLvl2}">selected
											</c:if>>${distLvl2List.distLvl2}</option>
											</c:if>
										</c:forEach>
									</select>
								</td>
								<td>
									<div class="btnArea">
										<a href="JavaScript:formSubmit()" class="btn btnType01">조회</a>
									</div>
								</td>
							</form>
						</tr>
					</table>
				</div>
				<!-- Search -->
				<!-- Subtitle -->
				<div class="subtitle">
					<h3>검색결과(${dimDistrictList.size()})</h3>
					<div><a id="districtModal" href="#" class="btn btn-create">새 지역 등록</a></div>
				</div>
				<!-- Subtitle -->
				<!-- Grid Area -->
				<div id="resultTable" class="table_type1">
					<table summary="">
						<colgroup>
							<col width="10%" />
							<col width="8%" />
							<col width="10%" />
							<col width="10%" />
							<col width="10%" />
							<col width="11%" />
							<col width="7%" />
							<col width="11%" />
							<col width="7%" />
							<col />
						</colgroup>
						<thead>
							<tr>
								<th scope="col">국가</th>
								<th scope="col">지역 ID</th>
								<th scope="col">시도</th>
								<th scope="col">군구</th>
								<th scope="col">동</th>
								<th scope="col">등록일시</th>
								<th scope="col">등록자</th>
								<th scope="col">변경일시</th>
								<th scope="col">변경자</th>
								<th scope="col"></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${dimDistrictList}" var="vo">
								<tr class="nonEdit">
									<td>
										<c:forEach items="${dimNationList}" var="nation">
											<c:if test="${nation.nationId eq vo.nationId}">
												${nation.nationNm}
											</c:if>
										</c:forEach>
									</td>
									<td>${vo.districtId}</td>
									<td>${vo.distLvl1}</td>
									<td>${vo.distLvl2}</td>
									<td>${vo.distLvl3}</td>
									<td>
										<fmt:formatDate value="${vo.rgtrDt}" pattern="yyyy-MM-dd HH:mm:ss" />
									</td>
									<td>${vo.rgtrId}</td>
									<td>
										<fmt:formatDate value="${vo.updtDt}" pattern="yyyy-MM-dd HH:mm:ss" />
									</td>
									<td>${vo.updtId}</td>
									<td>
										<a href="#" class="gridBtn btnEdit">수정</a>
										<a href="JavaScript:deleteDistrict(${vo.districtId})"
											class="gridBtn btnDelete">삭제</a>
									</td>
								<tr></tr>
								<tr style="display: none" class="editable">
									<td><select name="nationId${vo.districtId}" style="width:90%;">
											<c:forEach items="${dimNationList}" var="nation">
												<option <c:if test="${nation.nationId eq vo.nationId}">selected</c:if>
													value="${nation.nationId}">${nation.nationNm}</option>
											</c:forEach>
										</select></td>
									<td name="districtId${vo.districtId}">${vo.districtId}</td>
									<td><input type="text" class="inputArea" style="width: 90%;"
											name="distLvl1${vo.districtId}" value="${vo.distLvl1}" required></td>
									<td><input type="text" class="inputArea" style="width: 90%;"
											name="distLvl2${vo.districtId}" value="${vo.distLvl2}" required></td>
									<td><input type="text" class="inputArea" style="width: 90%;"
											name="distLvl3${vo.districtId}" value="${vo.distLvl3}" required></td>
									<td>
										<fmt:formatDate value="${vo.rgtrDt}" pattern="yyyy-MM-dd HH:mm:ss" />
									</td>
									<td>${vo.rgtrId}</td>
									<td>
										<fmt:formatDate value="${vo.updtDt}" pattern="yyyy-MM-dd HH:mm:ss" />
									</td>
									<td>${vo.updtId}</td>
									<td>
										<a href="JavaScript:updateDistrict(${vo.districtId})"
											class="gridBtn btnSave">저장</a>
										<a href="#" class="gridBtn btnCancel">취소</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<!-- Grid Area -->
				<div class="gridFooter" id="pagingButton">
					<div class="page_info">Showing ${(currentPage-1)*contentLimit+1} to
						${(currentPage-1)*contentLimit+contentLimit>totalContentCount?totalContentCount:(currentPage-1)*contentLimit+contentLimit}
						of ${totalContentCount} entries</div>
					<div>
						<!-- Paging -->
						<div class="paging">
							<c:if test="${currentPage > buttonPerSection+0}">
								<a onclick="pageClick(1)" class="board_prev"><img
										src="resources/images/ico_board_prev_end.png" alt="First" /></a>
								<a onclick="pageClick(${startButtonNo-1})" class="board_prev"><img
										src="resources/images/ico_board_prev.png" alt="Previous" /></a>
							</c:if>
							<c:forEach var="pageNo" begin="${startButtonNo}" end="${endButtonNo}" step="1">
								<a onclick="pageClick(${pageNo})">
									<c:if test="${currentPage == pageNo}">
										<strong>
									</c:if>
									${pageNo}
									<c:if test="${currentPage == pageNo}">
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

							<select id="contentLimit" class="select-select" onchange="pageClick(0)"
								data-placeholder="10">
								<option value="10" <c:if test="${contentLimit == 10}">selected="selected"</c:if>>10
								</option>
								<option value="20" <c:if test="${contentLimit == 20}">selected="selected"</c:if>>20
								</option>
								<option value="50" <c:if test="${contentLimit == 50}">selected="selected"</c:if>>50
								</option>
								<option value="100" <c:if test="${contentLimit == 100}">selected="selected"</c:if>>100
								</option>
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
	<div class="layer_wrap" style="width:500px;">
		<div class="layBox">
			<p class="btn_close"><a href="#none" class="closeLy"><img src="resources/images/ico_pop_close.png"
						title="close" alt="close" /></a></p>
			<h1>지역등록<span>스마트관광 빅데이터 플랫폼</span></h1>
			<div class="layerCon">
				<div class="pop_tableType1">
					<form method="post" id="insertForm">
						<table>
							<tr>
								<td>
									<p>국가</p>
									<select id="nationInsert" name="nationId" style="width:100%;">
										<option value="" disabled selected>-------선택하세요-------</option>
										<c:forEach items="${dimNationList}" var="nation">
											<option value="${nation.nationId}">${nation.nationNm}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<td>
									<p>시도</p>
									<input type="text" placeholder="시도" class="inputArea" name="distLvl1" required
										style="width:100%;">
								</td>
							</tr>
							<tr>
								<td>
									<p>군구</p>
									<input type="text" placeholder="군구" class="inputArea" name="distLvl2" required
										style="width:100%;">
								</td>
							</tr>
							<tr>
								<td>
									<p>동</p>
									<input type="text" placeholder="동" class="inputArea" name="distLvl3" required
										style="width:100%;">
								</td>
							</tr>
							<tr hidden="true">
								<td>
									<input name="rgtrId" value="test">
									<input name="updtId" value="test">
								<td>
							</tr>
						</table>
					</form>
				</div>
				<div class="pop_btnArea">
					<a href="JavaScript:insertDistrict()" class="btn btnType01">추가</a><a href="#none"
						class="btn btnType02 close">취소</a>
				</div>
			</div>
		</div>
	</div>
</div>
<!---- Layer Popup ---->
<script>
	/* 국가 선택시 시도 리스트 호출 */
	function selectNation(value) {
		var distLvl1 = $("#distLvl1Search option:selected").val();
		location = "/gjdm/selectDistLvl.do?nationId=" + value;
	};

	/* 시도 선택시 군구 리스트 호출 */
	function selectDistLvl1(value) {
		var nationId = $("#nationSearch option:selected").val();
		location = "/gjdm/selectDistLvl.do?nationId=" + nationId + "&distLvl1=" + value;
	};

	/* 조회 */
	function formSubmit() {
		$("#searchForm").submit();
	};

	/* 페이지 새로고침 시 GET parameter 초기화 */
	window.onkeydown = function (e) {
		var kcode = event.keyCode;
		if (kcode == 116 || kcode == 82 && e.ctrlKey) {
			history.replaceState({}, null, location.pathname);
		}
	};

	$(function () {
		/* 수정버튼, 취소버튼 클릭시 로우 토글 */
		$('.btnEdit').click(function () {
			$(this).parent().parent().css('display', 'none');
			$(this).parent().parent().next().next().css('display', 'table-row');
		});

		$('.btnCancel').click(function () {
			$(this).parent().parent().css('display', 'none');
			$(this).parent().parent().prev().prev().css('display', 'table-row');
		})
	})

	/* district row 수정 */
	function updateDistrict(districtId) {
		if (confirm("지역 ID '" + districtId + "' 를 수정하시겠습니까?")) {
			var nationId = $('select[name="nationId' + districtId + '"] option:selected').val();
			var districtId = $('td[name="districtId' + districtId + '"]').html();
			var distLvl1 = $('input[name="distLvl1' + districtId + '"]').val();
			var distLvl2 = $('input[name="distLvl2' + districtId + '"]').val();
			var distLvl3 = $('input[name="distLvl3' + districtId + '"]').val();
			$.ajax({
				method: 'POST',
				url: '/gjdm/updateDimDistrict.do',
				data: {
					nationId,
					districtId,
					distLvl1,
					distLvl2,
					distLvl3,
				},
				success: function () {
					history.replaceState({}, null, location.pathname);
					location.reload();
				}
			})
		};
	};

	/* district row 삭제 */
	function deleteDistrict(districtId) {
		if (confirm("지역 ID '" + districtId + "' 를 삭제하시겠습니까?")) {
			location = "deleteDimDistrict.do?districtId=" + districtId;
		};
	};

	/* district Insert Modal */
	$('#districtModal').click(function () {
		$('#layer_area').show();
	});

	/* district Insert */
	function insertDistrict() {
		var formData = $("#insertForm").serialize();
		$.ajax({
			url: '/gjdm/insertDimDistrict.do',
			type: 'post',
			data: formData,
			success: function () {
				console.log("success");
				location.reload();
				alert("등록되었습니다.");
			},
			error: function (e) {
				console.log(e);
			}
		})
	};

	/* Pagination 버튼 클릭 */
	function pageClick(pageNo) {
		//text to html
		const parser = new DOMParser();

		var contentLimit = $('#contentLimit option:selected').val();
		var currentPage = '${continentPage}';
		
		//contentLimit select 클릭시 1페이지로 이동
		if (pageNo == 0){
			pageNo = 1;
		}
		
		$.ajax({
			type: 'POST',
			url: '/gjdm/dimDistrictList.do',
			data: {
				'contentLimit': contentLimit,
				'currentPage': pageNo
			},
			dataType: 'html',
			success: function (data) {
				//text to html
				data = parser.parseFromString(data, 'text/html');

				//change table
				var resultTable = data.getElementById('resultTable').childNodes;
				$('#resultTable').empty();
				$('#resultTable').html(resultTable);

				//change paging button
				var pagingButton = data.getElementById('pagingButton'.childNodes);
				$('#pagingButton').empty();
				$('#pagingButton').html(pagingButton);
			},
			error: function (e) {
				console.log(e);
			}
		});
	}
</script>
<%@ include file="../footer.jsp"%>