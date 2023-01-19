<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../header.jsp"%>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">지역관리</h1>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                지역 관리
                            </div>
                            <div class="card-body">
                            	<form action="/gjdm/dimDistrictList.do" method="post">
									<label for="nationSearch">국가</label>
									<select name="nationId" id="nationSearch">
										<c:forEach items="${dimNationList}" var="nation">
											<option value="${nation.nation_id}">${nation.nation_nm}</option>
										</c:forEach>
									</select>
	                            	<label>
	                            		시도
	                            		<input type="text" name="distLvl1" value="${distLvl1}">
	                            	</label>
	                            	<label>
	                            		군구
	                            		<input type="text" name="distLvl2" value="${distLvl2}">
	                            	</label>
	                            	<button type="submit">조회</button>
                            	</form>
                            	<form action="/gjdm/insertDimDistrict.do" method="post">
                            		<label for="nationInsert">국가</label>
									<select name="nationId" id="nationInsert">
										<c:forEach items="${dimNationList}" var="nation">
											<option value="${nation.nation_id}">${nation.nation_nm}</option>
										</c:forEach>
									</select>
	                            	<label>
	                            		시도
	                            		<input type="text" name="distLvl1" required>
	                            	</label>
	                            	<label>
	                            		군구
	                            		<input type="text" name="distLvl2" required>
	                            	</label>
	                            	<label>
	                            		동
	                            		<input type="text" name="distLvl3" required>
	                            	</label>
	                            	<input type="hidden" name="rgtr_id" value="test">
	                            	<input type="hidden" name="updt_id" value="test">
	                            	<button type="submit">추가</button>
	                            </form>
                            </div>
                            <div class="card-body">
                                <table>
                                    <thead>
                                        <tr>
                                            <th>지역ID</th>
                                            <th>국가ID</th>
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
	                                        		<td><input name="districtId" value="${vo.districtId}" readonly></td>
	                                        		<td><select name="nationId" id="nationId${vo.nationId}" disabled>
														<c:forEach items="${dimNationList}" var="nation">
															<option <c:if test="${nation.nation_id eq vo.nationId}">selected="selected"</c:if>
															value="${nation.nation_id}">${nation.nation_nm}</option>
														</c:forEach>
													</select></td>
	                                        		<td><input name="distLvl1" class="${vo.districtId}" value="${vo.distLvl1}" readonly></td>
	                                        		<td><input name="distLvl2" class="${vo.districtId}" value="${vo.distLvl2}" readonly></td>
	                                        		<td><input name="distLvl3" class="${vo.districtId}" value="${vo.distLvl3}" readonly></td>
	                                        		<td><input value="<fmt:formatDate value="${vo.rgtrDt}" pattern="yyyy-MM-dd HH:mm:ss"/>" readonly></td>
	                                        		<td><input value="${vo.rgtrId}" readonly/></td>
	                                        		<td><input value="<fmt:formatDate value="${vo.updtDt}" pattern="yyyy-MM-dd HH:mm:ss"/>" readonly></td>
	                                        		<td><input name="updtId" id="updtId${vo.districtId}" value="${vo.updtId}" readonly></td>
	                                        		<td id="updateBtn${vo.districtId}"><input type="button" onClick="updateDistrict${vo.districtId}()" value="수정"></td>
	                                        		<td id="submitBtn${vo.districtId}" hidden><button type="submit" onClick="updateDistrict${vo.districtId}()">수정</button></td>
	                                        		<td><a href="/gjdm/deleteDimDistrict.do?districtId=${vo.districtId}">삭제</a></td>
	                                        	</form>
                                        	</tr>
                                        	<script>
												function updateDistrict${vo.districtId}() {
													$("#nationId${vo.nationId}").attr('disabled', false);
													$(".${vo.districtId}").attr('readonly', false);
													$("#updateBtn${vo.districtId}").hide();
													$("#submitBtn${vo.districtId}").attr('hidden', false);
												};
											</script>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
<%@ include file="../footer.jsp"%>
