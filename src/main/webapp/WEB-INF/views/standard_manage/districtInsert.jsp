<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">지역 등록</h1>
                        <div class="card mb-4">
                            <div class="card-body">
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
		                            	<label>
		                            		시도
		                            		<input type="text" name="distLvl1" required>
		                            	</label>
		                            </div>
		                            <div>
		                            	<label>
		                            		군구
		                            		<input type="text" name="distLvl2" required>
		                            	</label>
		                            </div>
									<div>
		                            	<label>
		                            		동
		                            		<input type="text" name="distLvl3" required>
		                            	</label>
		                            </div>
		                            	<input type="hidden" name="rgtrId" value="test">
		                            	<input type="hidden" name="updtId" value="test">
	                            	<button type="submit" onclick="insertDistrict()" class="districtBtn">추가</button>
	                            </form>
	                            <script>
	                            	function insertDistrict() {
	                            		var formData = $("#insertForm").serialize();
	                            		$.ajax({
	                            			url: '/gjdm/insertDimDistrict.do',
	                            			type: 'post',
	                            			data: formData,
	                            			success: function() {
	                            				console.log("success");
			                            	    window.opener.location.reload();
			                            	    window.close();
	                            			},
	                            			error: function(e) {
												console.log(e);
											}
	                            		})
	                            	}
	                            </script>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            <style>
            	#insertForm {
            		display: flex;
            		flex-direction: column;
				    align-items: center;
				    height: 50%;
				    justify-content: space-around;
            	}
            	#insertForm > div {
            		display: flex;
            		justify-content: space-between;
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
             	.districtInput { 
              		width: 120px;
              		padding: 3px;
              		border-radius: 0;
              		align-content: center;
             	} 
             	.districtIdInput {
             		width: 70px;
             		text-align: center;
             	}
				.districtBtn {
					box-shadow:inset 0px 1px 0px 0px #ffffff;
					background:linear-gradient(to bottom, #ededed 5%, #dfdfdf 100%);
					background-color:#ededed;
					border-radius:6px;
					border:1px solid #dcdcdc;
					display:inline-block;
					cursor:pointer;
					color:#777777;
					font-family:Arial;
					font-size:13px;
					font-weight:bold;
					padding:4px 15px;
					text-decoration:none;
					text-shadow:0px 1px 0px #ffffff;
					margin: 1px;
				}
				.districtBtn:hover {
					background:linear-gradient(to bottom, #dfdfdf 5%, #ededed 100%);
					background-color:#dfdfdf;
					color:#777777;
				}
				.districtBtn:active {
					position:relative;
					top:1px;
				}
            </style>
