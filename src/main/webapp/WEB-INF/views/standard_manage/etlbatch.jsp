<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../header.jsp"%>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">ETL배치관리</h1>
                        <div class="card mb-4">
                        <div class="card-header">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i> ETL 조회
                            </div>
                            <form action="etlBatchList.do" method="post">
							<label for="etlSearch">ETL 타입</label>
									<select name="etlType" id="etlSearch">
										<c:forEach items="${etlBatchList}" var="etlbatch">
											<option value="${etlbatch.etlId}">${etlbatch.jobType}</option>
										</c:forEach>
									</select>
							<label> 프로그램명 <input type="text" name="etlName" value="${etlName}"></label>
							<button type="submit">조회</button>
							</form>
							
							
							<form action="/gjdm/insertEtlBatch.do" method="post">
	                            	<label>
	                            		ETL ID
	                            		<input type="text" name="etlId" required size="5">
	                            	</label>						
									<label> ETL 타입 <input type="text" name="jobType" value="${jobType}" size="5"></label>
									<label> 프로그램명 <input type="text" name="etlName" value="${etlName}" size="5"></label>
	                            	<label> 비고 <input type="text" name="etlDesc" value="${etlDesc}" size="5"></label>
	                            	<label> 실행주기 <input type="text" name="frqBase" value="${frqBase}" size="5"></label>
	                            	<label> 실행횟수 <input type="text" name="frqNum" value="${frqNum}" size="5"></label>
	                            	<label> 파라메터 <input type="text" name="etlParam" value="${etlParam}" size="5"></label>
	                            	<label> 소스시스템 <input type="text" name="srcSystem" value="${srcSystem}" size="5"></label>
	                            	<label> 타겟시스템 <input type="text" name="tgtSystem" value="${tgtSystem}" size="5"></label>
	                            	<input type="hidden" name="rgtr_id" value="test">
	                            	<input type="hidden" name="updt_id" value="test">
	                            	<button type="submit">추가</button>
	                            </form>
                            </div>
                            <div class="card-haeder">
                                   <i class="fas fa-table me-1"></i> ETL 배치관리   
                            </div>            
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
											﻿<form action="updateEtlBatch.do" method="post">
											<td><input name="etlId" class="etlInput" value="${vo.etlId}" readonly
												></td>
											<td><input name="jobType" class="${vo.etlId} etlInput"
												value="${vo.jobType}" readonly></td>
											<td><input name="etlName" class="${vo.etlId} etlInput"
												value="${vo.etlName}" readonly></td>
											<td><input name="etlDesc" class="${vo.etlId} etlInput"
												value="${vo.etlDesc}" readonly></td>
											<td><input name="frqBase" class="${vo.etlId} etlInput"
												value="${vo.frqBase}" readonly></td>
								 			<td><input name="frqNum" class="${vo.etlId} etlInput"
												value="${vo.frqNum}" readonly></td>
											<td><input name="etlParam" class="${vo.etlId} etlInput"
												value="${vo.etlParam}" readonly></td>
											<td><input name="srcSystem" class="${vo.etlId} etlInput"
												value="${vo.srcSystem}" readonly></td>
											<td><input name="tgtSystem" class="${vo.etlId} etlInput"
												value="${vo.tgtSystem}" readonly></td>
											<td><input value="<fmt:formatDate value="${vo.rgtrDt}" pattern="yyyy-MM-dd HH:mm:ss"/>" readonly></td>
	                                        <td><input value="${vo.rgtrId}" class="etlInput" readonly/></td>
	                                        <td><input value="<fmt:formatDate value="${vo.updtDt}" pattern="yyyy-MM-dd HH:mm:ss"/>" readonly></td>
	                                        <td><input name="updtId" id="updtId${vo.etlId}" class="etlInput" value="${vo.updtId}" readonly></td>
	                                        <td id="updateBtn${vo.etlId}"><input type="button" onClick="updateEtlBatch${vo.etlId}()" value="수정"></td>
	                                        <td id="submitBtn${vo.etlId}" hidden><button type="submit" onClick="updateEtlBatch${vo.etlId}()">수정</button></td>
	                                        <td><a href="deleteEtlBatch.do?etlId=${vo.etlId}">삭제</a></td>
                       						<script>
                       						function updateEtlBatch${vo.etlId}() {
												$("#etlId${vo.etlId}").attr('disabled', false);
												$(".${vo.etlId}").attr('readonly', false)
																	  .css("border", "1px solid");
												$("#updateBtn${vo.etlId}").hide();
												$("#submitBtn${vo.etlId}").attr('hidden', false);
											};
												$(function(){
													if($("input").is("[readonly]")) {													
														$("input[readonly]").css("border", "none");
													}
														$(":focus-visible").css("outline", "red !important");
													$(".etlInput").css("width", "100px");
												})
											</script>
                       					</c:forEach>				
                                    </tbody>
                                </table> 
                                </div>
		</div>
	</main>
</div>
<%@ include file="../footer.jsp"%>