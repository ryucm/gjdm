<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../header.jsp"%>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <div class="districtDiv">
	                        <h1 class="mt-4">지역 관리</h1>
	                        <button type="button" class="districtBtn newDistrict" data-bs-toggle="modal" data-bs-target="#newId">새 지역 등록</button>
<!-- 							<div data-bs-toggle="modal" data-bs-target="#newId">등록</div> -->
	                        <!-- 모달시작 -->
	                        <div class="modal" tabindex="-1" id="newId">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" style="font-size: 2rem;">지역 등록</h5>
										</div>
										<div class="modal-body">
											<form method="post" id="insertForm">
												<div>
				                            		<label for="nationInsert">국가</label>
													<select name="nationId" id="nationInsert">
														<c:forEach items="${dimNationList}" var="nation">
															<option value="${nation.nationId}">${nation.nationNm}</option>
														</c:forEach>
													</select>
												</div>
												<div>
					                            	<label for="distLvl1">시도</label>
				                            		<input type="text" name="distLvl1" id="distLvl1" required>
					                            </div>
					                            <div>
					                            	<label for="distLvl2">군구</label>
				                            		<input type="text" name="distLvl2" id="distLvl2" required>
					                            </div>
												<div>
					                            	<label for="distLvl3">동</label>
				                            		<input type="text" name="distLvl3" id="distLvl3" required>
					                            </div>
					                            	<input type="hidden" name="rgtrId" value="test">
					                            	<input type="hidden" name="updtId" value="test">
											</form>
										</div>
										<div class="modal-footer">
											<div class="modal-footer-btn">
				                            	<button type="button" data-bs-dismiss="modal" id="modalbtn" class="districtBtn">취소</button>
				                            	<button type="button" data-bs-dismiss="modal" onclick="insertDistrict()" class="districtBtn">추가</button>
											</div>
										</div>
									</div>
								</div>
							</div>
							<script>
							function insertDistrict() {
                        		var formData = $("#insertForm").serialize();
                        		$.ajax({
                        			url: '/gjdm/insertDimDistrict.do',
                        			type: 'post',
                        			data: formData,
                        			success: function() {
                        				console.log("success");
                        				location.reload();
                        			},
                        			error: function(e) {
										console.log(e);
									}
                        		})
                        	}
							</script>
							<!-- 모달끝 -->
                        </div>
                        <script>
                        	function districtInsert() {
                        		var popupWidth = 800;
                                var popupHeight = 600;

                                var popupX = Math.round(window.screenX + (window.outerWidth / 2) - (popupWidth / 2));
                                var popupY = Math.round(window.screenY + (window.outerHeight / 2) - (popupHeight / 2));
                        		window.open("districtInsert.do", null, 'width=' + popupWidth + ',height=' + popupHeight + ',left='+ popupX + ', top='+ popupY);
                        	}
                        </script>
                        <div class="card mb-4">
                            <div class="card-body">
                            	<form action="/gjdm/dimDistrictList.do" method="post">
									<label for="nationSearch">국가</label>
									<select name="nationId" id="nationSearch" required  onchange="selectNation(value)">
										<option value="" disabled selected>--선택해주세요--</option>
										<c:forEach items="${dimNationList}" var="nation">
											<option value="${nation.nationId}" <c:if test="${nationId eq nation.nationId}">selected</c:if>>${nation.nationNm}</option>
										</c:forEach>
									</select>
									<script>
										function selectNation(value) {
											var distLvl1 = $("#distLvl1Search option:selected").val();
											location = "/gjdm/selectDistLvl.do?nationId=" + value;
										}
									</script>
									
	                            	<label for="distLvl1Search">시도</label>
	                            	<select name="distLvl1" id="distLvl1Search" onchange="selectDistLvl1(value)">
	                            		<option value="" disabled selected>--선택해주세요--</option>
										<c:forEach items="${distLvl1List}" var="distLvl1List">
											<c:if test="${distLvl1List.nationId eq nationId}">
												<option value="${distLvl1List.distLvl1}" <c:if test="${distLvl1 eq distLvl1List.distLvl1}">selected</c:if>>${distLvl1List.distLvl1}</option>
											</c:if>
										</c:forEach>
									</select>
									<script>
										function selectDistLvl1(value) {
											var nationId = $("#nationSearch option:selected").val();
											location = "/gjdm/selectDistLvl.do?nationId=" + nationId + "&distLvl1=" + value;
										}
									</script>
									
	                            	<label for="distLvl2Search">군구</label>
	                            	<select name="distLvl2" id="distLvl2Search">
	                            		<option value="" disabled selected>--선택해주세요--</option>
										<c:forEach items="${distLvl2List}" var="distLvl2List">
											<c:if test="${distLvl2List.distLvl1 eq distLvl1}">
												<option value="${distLvl2List.distLvl2}" <c:if test="${distLvl2 eq distLvl2List.distLvl2}">selected</c:if>>${distLvl2List.distLvl2}</option>
											</c:if>
										</c:forEach>
									</select>
	                            	<button type="submit" class="districtBtn">조회</button>
	                            	<button type="button" class="districtBtn" onclick="resetValues()">조회조건 초기화</button>
	                            	<script>
	                            		function resetValues() {
	                            			$("#nationSearch").val("");
	                            			$("#distLvl1Search").val("");
	                            			$("#distLvl2Search").val("");
	                            			location = "/gjdm/selectDistLvl.do";
	                            		}
	                            	</script>
                            	</form>
                            </div>
                        </div>
                        <div class="card mb-4 districtList">
                            <div class="card-body">
                                <table>
                                    <thead>
                                        <tr>
                                            <th>국가</th>
                                            <th>지역ID</th>
                                            <th>시도</th>
                                            <th>군구</th>
                                            <th>동</th>
                                            <th>등록일시</th>
                                            <th>등록자</th>
                                            <th>변경일시</th>
                                            <th>변경자</th>
                                            <th></th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${dimDistrictList}" var="vo">
                                         	<tr>
	                                        	<form action="/gjdm/updateDimDistrict.do" method="post">
	                                        		<td><select name="nationId" id="nationId${vo.districtId}" disabled>
														<c:forEach items="${dimNationList}" var="nation">

															<option <c:if test="${nation.nationId eq vo.nationId}">selected</c:if>

															value="${nation.nationId}">${nation.nationNm}</option>
														</c:forEach>
													</select></td>
	                                        		<td><input name="districtId" class="districtInput" value="${vo.districtId}" readonly></td>
	                                        		<td><input name="distLvl1" class="${vo.districtId} districtInput" value="${vo.distLvl1}" disabled required></td>
	                                        		<td><input name="distLvl2" class="${vo.districtId} districtInput" value="${vo.distLvl2}" disabled required></td>
	                                        		<td><input name="distLvl3" class="${vo.districtId} districtInput" value="${vo.distLvl3}" disabled required></td>
	                                        		<td><input value="<fmt:formatDate value="${vo.rgtrDt}" pattern="yyyy-MM-dd HH:mm:ss"/>" disabled></td>
	                                        		<td><input value="${vo.rgtrId}" class="districtIdInput" disabled/></td>
	                                        		<td><input value="<fmt:formatDate value="${vo.updtDt}" pattern="yyyy-MM-dd HH:mm:ss"/>" disabled></td>
	                                        		<td><input name="updtId" id="updtId${vo.districtId}" class="districtIdInput" value="${vo.updtId}" disabled></td>
	                                        		<td id="updateBtn${vo.districtId}"><input type="button" onClick="updateDistrict(${vo.districtId})" class="districtBtn" value="수정"></td>
	                                        		<td id="submitBtn${vo.districtId}" hidden><button type="submit" class="districtBtn">저장</button></td>
	                                        		<td><button type="button" onClick="deleteDistrict(${vo.districtId})" class="districtBtn">삭제</button></td>
	                                        	</form>
                                         	</tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                <script>
	                                window.onkeydown = function(e) {
	                                	var kcode = event.keyCode;
	                                	if(kcode == 116 || kcode == 82 && e.ctrlKey) {
	                                		history.replaceState({}, null, location.pathname);
	                                	}
	                                };
									function updateDistrict(districtId) {
										if(confirm("지역 ID '" + districtId + "' 를 수정하시겠습니까?")) {
											$("#nationId" + districtId).attr('disabled', false);
											$("." + districtId).attr('disabled', false);
											$("#updateBtn" + districtId).hide();
											$("#submitBtn" + districtId).attr('hidden', false);											
										}
									};
									function deleteDistrict(districtId) {
										if (confirm("지역 ID '" + districtId + "' 를 삭제하시겠습니까?")) {
											location = "deleteDimDistrict.do?districtId=" + districtId;
										};
									};
								</script>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            
<%@ include file="../footer.jsp"%>
