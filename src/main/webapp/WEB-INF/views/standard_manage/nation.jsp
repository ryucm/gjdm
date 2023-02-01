<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../header.jsp"%>

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
		
		return true;
	}

	<%-- 삭제 버튼 --%>
	function deleteDimNation(nationId){
		if (confirm("정말 삭제하시겠습니까?")){
			location = "deleteDimNation.do?nationId="+nationId
						+"&continentPage=${continentPage}";
		}
	}
	
	<%--팝업창--%>
	function nationInsert() {
		var popupWidth = 800;
        var popupHeight = 600;

        var popupX = Math.round(window.screenX + (window.outerWidth / 2) - (popupWidth / 2));
        var popupY = Math.round(window.screenY + (window.outerHeight / 2) - (popupHeight / 2));
		window.open("nationInsert.do", null, 'width=' + popupWidth + ',height=' + popupHeight + ',left='+ popupX + ', top='+ popupY);
	}
</script>

<c:set var="continentList" value="${fn:split('아시아,유럽,오세아니아,북아메리카,남아메리카,아프리카',',')}"/>

<div class="col-2">
  	<header>    
      <div class="top_navbar">
        <div class="hamburger">
            <a href="#">
                menu
            </a>
        </div>
      </div>
      <div class="title">국가관리</div>
    </header>
    <!----- Contents Start ----->
    <main class="content">
    <article>
      <div class="contentArea">
      <!-- Search -->
       <div class="searchTable1 mB15">
        <table>
          <colgroup>
          <col width="10%" />
          <col width="10%" />
          <col width="10%" />
          <col width="10%" />
          <col width="10%" />
          <col width="10%" />
          <col width="10%" />
          <col width="10%" />
          <col width="10%" />
          <col width="10%" />
          </colgroup>
          <tr>
          	<form method="post" action="dimNationList.do">
          	<td>
	          	<p>대륙</p>
		          	<select name="continentPage" id="continentSearch" style="width:100%">
		           		<option value="">전체</option>
		           		<c:forEach items="${continentList}" var="item">
		           			<option 
		           				<c:if test="${continentPage eq item}">selected="selected"</c:if>
		           				value="${item}">${item}
		           			</option>
		           		</c:forEach>
		           	</select>
		    </td>
		    <td>
		    	<div class="btnArea">  	
	           		<button type="submit" class="btn btnType01">조회</button>
	           	</div>
           	</td>
           	</form>
          </tr>
         </table>
        </div>
		<!-- search -->
        <!-- Subtitle -->
        <div class="subtitle">
	        <h3>검색결과</h3>
	        <div><a href="nationInsert()" class="btn btn-create">새 지역 등록</a></div>
     	</div>
      <!-- Subtitle -->
      <div class="table_type1">
        <table summary="">
          <colgroup>
          <col width="8%" />
          <col width="15%" />
          <col width="15%" />
          <col width="4%" />
          <col width="4%" />
          <col width="4%" />
          <col width="4%" />
          <col width="8%" />
          <col width="8%" />
          <col width="8%" />
          <col width="8%" />
          <col width="8%" />
          <col />
          </colgroup>
          <thead>
            <tr>
                <th scope="col">국가ID</th>
                <th scope="col">국가명(한글)</th>
                <th scope="col">국가명(영문)</th>
                <th scope="col">ISO코드</th>
                <th scope="col">ISO3코드</th>
                <th scope="col">ISO번호</th>
                <th scope="col">대륙명(한글)</th>
                <th scope="col">등록일시</th>
                <th scope="col">등록자</th>
                <th scope="col">변경일시</th>
                <th scope="col">변경자</th>
                <th scope="col"></th>
               	<th scope="col"></th>
	        </tr>
	       <tbody>
	       	<c:forEach items="${dimNationList}" var="vo" varStatus="status">
	       		<form name="updateDimNation${vo.nationId}" action="updateDimNation.do" method="post" onsubmit="return checkData(updateDimNation${vo.nationId})">
	        	<tr>
                    <td><input name="nationId" value="${vo.nationId}" class="nationInput" readonly></td>
                    <td><input name="nationNm" maxlength="33" value="${vo.nationNm}" class="${vo.nationId} nationInput" disabled required></td>
                    <td><input name="nationNmEn" maxlength="100" value="${vo.nationNmEn}" class="${vo.nationId} nationInput" disabled required></td>
                    <td><input name="isoCd" maxlength="10" value="${vo.isoCd}" class="${vo.nationId} nationInput" disabled></td>
                    <td><input name="iso3Cd" maxlength="10" value="${vo.iso3Cd}" class="${vo.nationId} nationInput" disabled></td>
                    <td><input name="isoNo" maxlength="10" value="${vo.isoNo}" class="${vo.nationId} nationInput" disabled></td>
                         			
               		<td><select name="continent" id="nationId${vo.nationId}" disabled>
               				<c:forEach items="${continentList}" var="item">
                				<option
                					<c:if test="${item eq vo.continent}">selected="selected"</c:if>
                					value="${item}">${item}
                				</option>
                			</c:forEach>
               			</select>
               		</td>

               		<td><input name="rgtrDt" value="<fmt:formatDate value="${vo.rgtrDt}" pattern="yyyy-MM-dd HH:mm:ss"/>" disabled></td>
               		<td><input name="rgtrId" value="${vo.rgtrId}" class="nationIdInput" disabled></td>
               		<td><input name="rgtrDt" value="<fmt:formatDate value="${vo.updtDt}" pattern="yyyy-MM-dd HH:mm:ss"/>" disabled></td>
               		<td><input name="updtIdOrg" value="${vo.updtId}" class="nationIdInput" disabled>
                  		<!-- 차후 사용자 ID로 수정 -->
						<input type="hidden" name="updtId" value="관리자">
						<!-- 페이징 관련 -->
						<input type="hidden" name="continentPage" value="${continentPage}">
                    </td>
               		<td id="updateBtn${vo.nationId}">
               			<button type="button" onClick="location.href='javascript:updateDimNation(${vo.nationId})'" class="nationBtn">
               				수정
               			</button>
               		</td>
               		<td id="submitBtn${vo.nationId}" hidden>
               			<button type="submit" class="nationBtn">
               				저장
               			</button>
               		</td>
              		</form>
              			<td>
               			<button onclick="deleteDimNation(${vo.nationId})" class="nationBtn">
               				삭제
               			</button>
               		</td>
                 </tr>
	         </c:forEach>
		        <script>
	                <%-- 수정 버튼 --%>
					function updateDimNation(nationId) {
						if(confirm("국가ID '" + nationId + "'를 수정하시겠습니까?")){
							$("#nationId" + nationId).attr('disabled', false);
							$("." + nationId).attr('disabled', false);
							$("#updateBtn" + nationId).hide();
							$("#submitBtn" + nationId).attr('hidden', false);
						}
					};
				</script>
             </tbody>
		</table>
	</div>
	
	<!-- Grid Area -->
    <div class="gridFooter">
      <div class="page_info">Showing 1 to 5 of 150 entries</div> 
      <div>
      <!-- Paging -->
        <div class="paging">
          <a href="#" class="board_prev"><img src="resources/images/ico_board_prev_end.png" alt="First" /></a>
          <a href="#" class="board_prev"><img src="resources/images/ico_board_prev.png" alt="Previous" /></a>
          <strong>1</strong> <a href="#">2</a> <a href="#">3</a> <a href="#">4</a>
          <a href="#">5</a>
          <a class="board_next" href="#"><img src="resources/images/ico_board_next.png" alt="Next" /></a>
          <a class="board_next" href="#"><img src="resources/images/ico_board_next_end.png" alt="Next End" /></a>
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
    </article>
    </div>
    </main>
	<!----- Contents End ----->
  </div>
            <style>
            	.nationList > .card-body {
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
            	.nationDiv {
            		display: flex;
				    justify-content: space-between;
				    align-items: flex-end;
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
				.newNation {
					margin: 10px 0;
/* 					float: right; */
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
<%@ include file="../footer.jsp"%>