<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	<%-- 유효성 검사 --%>
	function checkData(formname){
		
		/* var continent = ${continent}; */
		
		var checkNum = /^[0-9]*$/; //숫자 (ISO번호)
		var checkEngA = /^[A-Z]*$/; //영어 대문자 (국가명 영문, ISO코드, ISO3코드)
		var checkKor = /^[가-힣]*$/; //한글 (국가명 한글)
		
		var nationNm = formname.nationNm.value;
		var nationNmEn = formname.nationNmEn.value;
		var isoCd = formname.isoCd.value;
		var iso3Cd = formname.iso3Cd.value;
		var isoNo = formname.isoNo.value;
		
		
		if (!checkKor.test(nationNm)){
			alert('국가명(한글)은 한글만 입력가능합니다.');
			return false;
		}
		if (!checkEngA.test(nationNmEn)){
			alert('국가명(영문)은 영문(대문자)만 입력가능합니다.');
			return false;
		}
		if (!checkEngA.test(isoCd)){
			alert('ISO코드는 영문(대문자)만 입력가능합니다.');
			return false;
		}
		if (!checkEngA.test(iso3Cd)){
			alert('ISO3코드는 영문(대문자)만 입력가능합니다.');
			return false;
		}
		if (!checkNum.test(isoNo)){
			alert('ISO번호는 숫자만 입력가능합니다.');
			return false;
		}
		
		var formData = $(".insertForm").serialize();
        $.ajax({
           url: 'insertDimNation.do',
           type: 'POST',
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

<c:set var="continentList" value="${fn:split('아시아,유럽,오세아니아,북아메리카,남아메리카,아프리카',',')}"/>    
<div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">국가등록</h1>
                        <div class="card mb-4">
                            <div class="card-body">
                            	<form name="insertDimNation" method="post" class="insertForm">
									<div>
		                            	<label>
		                            		국가명(한글)
		                            		<input type="text" name="nationNm" required>
		                            	</label>
		                            </div>
		                            <div>
		                            	<label>
		                            		국가명(영문)
		                            		<input type="text" name="nationNmEn" required>
		                            	</label>
		                            </div>
									<div>
	                            		<label for="continentInsert">대륙명</label>
										<select name="continent" id="continentInsert">
											<c:forEach items="${continentList}" var="item">
												<option value="${item}">${item}</option>
											</c:forEach>
										</select>
									</div>
									<div>
		                            	<label>
		                            		ISO코드
		                            		<input type="text" name="isoCd">
		                            	</label>
		                            </div>
		                            <div>
		                            	<label>
		                            		ISO3코드
		                            		<input type="text" name="iso3Cd">
		                            	</label>
		                            </div>
		                            <div>
		                            	<label>
		                            		ISO번호
		                            		<input type="text" name="isoNo">
		                            	</label>
		                            </div>
		                            	<!-- 차후 사용자 ID로 수정 -->
										<input type="hidden" name="rgtrId" value="관리자">
										<input type="hidden" name="updtId" value="관리자">
										
<%-- 										<!-- 페이징 관련 -->
										<input type="hidden" name="continentPage" value="${continentPage}"> --%>
	                            	<button type="submit" onclick="checkData(insertDimNation); return false;" class="nationBtn">추가</button>
	                            	<button type="reset" class="nationBtn">취소</button>
	                            </form>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            <style>
            	.insertForm {
            		display: flex;
            		flex-direction: column;
				    align-items: center;
				    height: 50%;
				    justify-content: space-around;
            	}
            	.insertForm > div {
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
             	.nationInput { 
              		width: 120px;
              		padding: 3px;
              		border-radius: 0;
              		align-content: center;
             	} 
             	.nationIdInput {
             		width: 70px;
             		text-align: center;
             	}
				.nationBtn {
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
				.nationBtn:hover {
					background:linear-gradient(to bottom, #dfdfdf 5%, #ededed 100%);
					background-color:#dfdfdf;
					color:#777777;
				}
				.nationBtn:active {
					position:relative;
					top:1px;
				}
            </style>
    