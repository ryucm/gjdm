<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../header.jsp"%>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                    	<div class="etlbatchDiv">
                        	<h1 class="mt-4">ETL배치 관리</h1>
                        	<button type="button" onClick="etlbatchInsert()" class="etlbatchBtn newEtlBatch">새 ETL배치 등록</button>
                        </div>
                        <script>
                        	function etlbatchInsert() {
                        		var popupWidth = 800;
                                var popupHeight = 600;

                                var popupX = Math.round(window.screenX + (window.outerWidth / 2) - (popupWidth / 2));
                                var popupY = Math.round(window.screenY + (window.outerHeight / 2) - (popupHeight / 2));
                        		window.open("etlbatchInsert.do", null, 'width=' + popupWidth + ',height=' + popupHeight + ',left='+ popupX + ', top='+ popupY);
                        	}
                        </script>
                        <div class="card mb-4">
                        	<div class="card-body">                        
                            	<form action="/gjdm/etlBatchList.do" method="post">
									<label for="etlSearch">ETL 타입</label>
									<select name="etlType" id="etlSearch" required>
										<option value="" disabled selected>--선택해주세요--</option>
										<c:forEach items="${etlBatchList}" var="etlbatch">
											<option value="${etlbatch.etlId}"<c:if test="${etlId eq etlbatch.etlId}">selected</c:if>>${etlbatch.jobType}</option></option>
										</c:forEach>
									</select>
							<label> 프로그램명 <input type="text" name="etlName" value="${etlName}"></label>
							<button type="submit" class="etlbatchBtn">조회</button>
							</form>
						</div>
					</div>
					<div class="card mb-4 etlbatchList">
						<div class="card-body">		         
                        	<table class="table">                                	
                            	<thead>
                                	<tr>
                                        <th>ETL ID</th>
                                        <th>ETL타입</th>
                                        <th>프로그램명</th>
                                        <th>비고</th>
                                        <th>실행주기</th>
                                        <th>실행횟수</th>
                                        <th>파라메터</th>
                                        <th>소스시스템</th>
                                        <th>타겟시스템</th>
                                        <th>등록일시</th>
                                        <th>등록자</th>
                                        <th>변경일시</th>
                                        <th>변경자</th>
                                      </tr>
                                  </thead>
                                  <tbody>
                       			  	<c:forEach items="${etlBatchList}" var="vo">
                                    	<tr>
											﻿<form action="/gjdm/updateEtlBatch.do" method="post">
											<td><input name="etlId" class="etlInput" value="${vo.etlId}" readonly
												></td>
											<td><input name="jobType" class="${vo.etlId} etlInput"
												value="${vo.jobType}" disabled required></td>
											<td><input name="etlName" class="${vo.etlId} etlInput"
												value="${vo.etlName}" disabled required></td>
											<td><input name="etlDesc" class="${vo.etlId} etlInput"
												value="${vo.etlDesc}" disabled required></td>
											<td><input name="frqBase" class="${vo.etlId} etlInput"
												value="${vo.frqBase}" disabled required></td>
								 			<td><input name="frqNum" class="${vo.etlId} etlInput"
												value="${vo.frqNum}" disabled required></td>
											<td><input name="etlParam" class="${vo.etlId} etlInput"
												value="${vo.etlParam}" disabled required></td>
											<td><input name="srcSystem" class="${vo.etlId} etlInput"
												value="${vo.srcSystem}" disabled required></td>
											<td><input name="tgtSystem" class="${vo.etlId} etlInput"
												value="${vo.tgtSystem}" disabled required></td>
											<td><input value="<fmt:formatDate value="${vo.rgtrDt}" pattern="yyyy-MM-dd HH:mm:ss"/>" disabled></td>
	                                        <td><input value="${vo.rgtrId}" class="etlIdnput" disabled/></td>
	                                        <td><input value="<fmt:formatDate value="${vo.updtDt}" pattern="yyyy-MM-dd HH:mm:ss"/>" disabled></td>
	                                        <td><input name="updtId" id="updtId${vo.etlId}" class="etlIdnput" value="${vo.updtId}" disabled></td>
	                                        <td id="updateBtn${vo.etlId}"><input type="button" onClick="updateEtlBatch(${vo.etlId})" class="etlbatchBtn" value="수정"></td>
	                                        <td id="submitBtn${vo.etlId}" hidden><button type="submit" class="etlbatchBtn">저장</button></td>
	                                        <td><button type="button" onClick="deleteEtlBatch(${vo.etlId})" class="etlbatchBtn">삭제</button></td>
                       					</form>
                       				</tr>
                       			</c:forEach>
                       		</tbody>
                       	</table>
                       	<script>                       					
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
                     </div>
				</div>
			</main>
		</div>
		<style>
            	.etlbatchList > .card-body {
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
            		font-size: 12px;
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
				    -webkit-appearance:none; /* 크롬 화살표 없애기 */
				    -moz-appearance:none; /* 파이어폭스 화살표 없애기 */
				    appearance:none; /* 화살표 없애기 */
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
            	.etlbatchDiv {
            		display: flex;
				    justify-content: space-between;
				    align-items: flex-end;
            	}
             	.etlInput { 
              		width: 50px;
              		padding: 3px;
              		border-radius: 0;
              		align-content: center;
             	} 
             	.etlIdInput {
             		width: 70px;
             		text-align: center;
             	}
				.etlbatchBtn {
					box-shadow:inset 0px 1px 0px 0px #ffffff;
					background:linear-gradient(to bottom, #ededed 5%, #dfdfdf 100%);
					background-color:#ededed;
					border-radius:4px;
					border:1px solid #dcdcdc;
					display:inline-block;
					cursor:pointer;
					color:#777777;
					font-family:Arial;
					font-size:12px;
					font-weight:bold;
					padding:4px 15px;
					text-decoration:none;
					text-shadow:0px 1px 0px #ffffff;
					margin: 1px;
				}
				.newEtlBatch {
					margin: 10px 0;
/* 					float: right; */
				}
				.etlbatchBtn:hover {
					background:linear-gradient(to bottom, #dfdfdf 5%, #ededed 100%);
					background-color:#dfdfdf;
					color:#777777;
				}
				.etlbatchBtn:active {
					position:relative;
					top:1px;
				}
            </style>
<%@ include file="../footer.jsp"%>