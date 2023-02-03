<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../header.jsp"%>
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
	        <div><a id="nationModal" class="btn btn-create">새 지역 등록</a></div>
     	</div>
      <!-- Subtitle -->
      <!-- Grid Area -->
      <div id="resultTable" class="table_type1">
        <table summary="">
          <colgroup>
          <col width="8%" />
          <col width="15%" />
          <col width="15%" />
          <col width="4%" />
          <col width="5%" />
          <col width="4%" />
          <col width="4%" />
          <col width="8%" />
          <col width="8%" />
          <col width="8%" />
          <col width="8%" />
          <col width="12%" />
          <col />
          </colgroup>
          <thead
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
	        </tr>
	       </thead>
	       <tbody>
	       	<c:forEach items="${dimNationList}" var="vo">
	       		<tr class="nonEdit">
	       			<td>${vo.nationId}</td>
	        		<td>${vo.nationNm}</td>
	        		<td>${vo.nationNmEn}</td>
	        		<td>${vo.isoCd}</td>
	        		<td>${vo.iso3Cd}</td>
	        		<td>${vo.isoNo}</td>
	       			<td><c:forEach items="${continentList}" var="item">
		       				<c:if test="${item eq vo.continent}">
		       					${item}
		       				</c:if>
		       			</c:forEach>
		       		</td>
		       		<td><fmt:formatDate value="${vo.rgtrDt}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
               		<td>${vo.rgtrId}</td>
               		<td><fmt:formatDate value="${vo.updtDt}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
               		<td>${vo.updtId}</td>
               		<td>
               			<a href="#" class="gridBtn btnEdit">수정</a>
               			<a href="JavaScript:deleteDimNation(${vo.nationId})" class="gridBtn btnDelete">삭제</a>
               		</td>
               		<tr></tr>
               		<!-- 수정 버튼 클릭시 나오는 row -->
               		<tr style="display: none" class="editable">
               			<td name="nationId${vo.nationId}">${vo.nationId}</td>
               			<td><input type="text" class="inputArea" style="width: 90%;" name="nationNm${vo.nationId}" value="${vo.nationNm}" required></td>
               			<td><input type="text" class="inputArea" style="width: 90%;" name="nationNmEn${vo.nationId}" value="${vo.nationNmEn}" required></td>
               			<td><input type="text" class="inputArea" style="width: 90%;" name="isoCd${vo.nationId}" value="${vo.isoCd}"></td>
               			<td><input type="text" class="inputArea" style="width: 90%;" name="iso3Cd${vo.nationId}" value="${vo.iso3Cd}"></td>
               			<td><input type="text" class="inputArea" style="width: 90%;" name="isoNo${vo.nationId}" value="${vo.isoNo}"></td>
               			<td><select name="continent${vo.nationId}" style="width:90%;">
               					<c:forEach items="${continentList}" var="item">
                					<option
                						<c:if test="${item eq vo.continent}">selected="selected"</c:if>
                							value="${item}">${item}
                					</option>
                				</c:forEach>
               				</select>
               			</td>
               			<td><fmt:formatDate value="${vo.rgtrDt}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
               			<td>${vo.rgtrId}</td>
               			<td><fmt:formatDate value="${vo.updtDt}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
               			<td name="updtId${vo.nationId}">${vo.updtId}</td>
               			<td>
			              	<a href="JavaScript:updateDimNation(${vo.nationId})" class="gridBtn btnSave">저장</a>
			              	<a href="#" class="gridBtn btnCancel">취소</a>
			            </td>
               		</tr>
               	</c:forEach>
               </tbody>
              </table>
             </div>
	<!-- Grid Area -->
    <div class="gridFooter" id="pagingButton">
      <div class="page_info">Showing ${(currentPage-1)*contentLimit+1} to ${(currentPage-1)*contentLimit+contentLimit>totalContentCount?totalContentCount:(currentPage-1)*contentLimit+contentLimit} of ${totalContentCount} entries</div> 
      <div>
      <!-- Paging -->
        <div class="paging">
        	<c:if test="${currentPage > buttonPerSection+0}">
          		<a onclick="pageClick(1)" class="board_prev"><img src="resources/images/ico_board_prev_end.png" alt="First" /></a>
          		<a onclick="pageClick(${startButtonNo-1})" class="board_prev"><img src="resources/images/ico_board_prev.png" alt="Previous" /></a>
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
          		<a onclick="pageClick(${endButtonNo+1})" class="board_next"><img src="resources/images/ico_board_next.png" alt="Next" /></a>
          		<a onclick="pageClick(${totalButtonCount})" class="board_next"><img src="resources/images/ico_board_next_end.png" alt="Next End" /></a>
          	</c:if>
          	
          <select id="contentLimit" class="select-select" onchange="pageClick(0)" data-placeholder="10">
            <option value="10" <c:if test="${contentLimit == 10}">selected="selected"</c:if>>10</option>
            <option value="20" <c:if test="${contentLimit == 20}">selected="selected"</c:if>>20</option>
            <option value="50" <c:if test="${contentLimit == 50}">selected="selected"</c:if>>50</option>
            <option value="100" <c:if test="${contentLimit == 100}">selected="selected"</c:if>>100</option>
          </select>
        </div>
        <!-- Paging -->    
        </div>
        </div>
      </div>
    </article>
    </div>
    </main>
	<!----- Contents End ----->
  </div>
  <!---- Layer Popup ---->
<div id="layer_area" style="display: none;">
  <div class="layer_pop"></div>
  <div class="layer_wrap" style="width:500px;">
    <div class="layBox">
      <p class="btn_close"><a href="#none" class="closeLy"><img src="resources/images/ico_pop_close.png" title="close" alt="close" /></a></p>
      <h1>국가등록<span>스마트관광 빅데이터 플랫폼</span></h1>
      <div class="layerCon">
        <div class="pop_tableType1">
          <table>
          <form name="insertDimNation" method="post" class="insertForm">
            <tr>
              <td>
                <p>국가명(한글)</p>
               	<input type="text" name="nationNm" class="inputArea" style="width:100%;" required>
            </tr>
            <tr>
              <td>
                <p>국가명(영문)</p>
                <input type="text" name="nationNmEn" class="inputArea" style="width:100%;" required></td>
            </tr>
            <tr>
              <td>
                <p>대륙명</p>
                <select name="continent" id="continentInsert" style="width:100%;">
					<c:forEach items="${continentList}" var="item">
						<option value="${item}">${item}</option>
					</c:forEach>
				</select>
              </td>
            </tr>
            <tr>
              <td>
                <p>ISO코드</p>
                <input type="text" name="isoCd" class="inputArea" style="width:100%;">
               </td>
            </tr>
            <tr>
              <td>
                <p>ISO3코드</p>
                <input type="text" name="iso3Cd" class="inputArea" style="width:100%;">
               </td>
            </tr>
            <tr>
              <td>
                <p>ISO번호</p>
                <input type="text" name="isoNo" class="inputArea" style="width:100%;">
               </td>
            </tr>
            <!-- 페이징 관련 -->
            <input type="hidden" name="contentLimit" value="${contentLimit}">
            <input type="hidden" name="continentPage" value="${continentPage}">
            <input type="hidden" name="currentPage" value="${currentPage}">
            
            <!-- 차후 사용자 ID로 수정 -->
			<input type="hidden" name="rgtrId" value="관리자">
			<input type="hidden" name="updtId" value="관리자">
		  </form>
          </table>
        </div>
        <div class="pop_btnArea">
            <a onclick="insertData(insertDimNation); return false;" class="btn btnType01">추가</a>
            <a class="btn btnType02 closeLy">취소</a>
        </div>
      </div>
    </div>
  </div>
  <!---- Layer Popup ---->
  <script>
  
  	/* 수정버튼, 취소버튼 클릭시 로우 토글 */
  	$(document).ready(function() {
	    /* 수정버튼, 취소버튼 클릭시 로우 토글 */
    	$('.btnEdit').click(function() {
    		$(this).parent().parent().css('display', 'none');
    		$(this).parent().parent().next().next().css('display', 'table-row');
    	});
    	$('.btnCancel').click(function() {
    		if (confirm("변경된 내용이 저장되지 않습니다.\n그래도 취소하시겠습니까?")) {
    			$(this).parent().parent().css('display', 'none');
	    		$(this).parent().parent().prev().prev().css('display', 'table-row');
    		}
    	})
    })
    
    /* nation row 수정 */
    function updateDimNation(nationId){
  		var nationId = $('td[name="nationId' + nationId + '"]').html();
		var nationNm = $('input[name="nationNm' + nationId + '"]').val();
		var nationNmEn = $('input[name="nationNmEn' + nationId + '"]').val();
		var isoCd = $('input[name="isoCd' +nationId + '"]').val();
		var iso3Cd = $('input[name="iso3Cd' +nationId + '"]').val();
		var isoNo = $('input[name="isoNo' +nationId + '"]').val();
		var continent = $('select[name="continent' + nationId + '"] option:selected').val();
		var updtId = $('td[name="updtId' + nationId + '"]').html();
		
		/* 유효성 검사 */
		var checkNum = /^[0-9]*$/; //숫자 (ISO번호)
		var checkEngA = /^[A-Z]*$/; //영어 대문자 (국가명 영문, ISO코드, ISO3코드)
		var checkKor = /^[가-힣]*$/; //한글 (국가명 한글)
		
		if (!checkKor.test(nationNm) || nationNm == '' || nationNm == null){
			alert('국가명(한글)은 한글만 입력가능합니다.');
			return false;
		}
		if (!checkEngA.test(nationNmEn) || nationNmEn == '' || nationNmEn == null){
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
  		
  		if (confirm("국가 ID '" + nationId + "' 를 수정하시겠습니까?")) {	
  			$.ajax({
  				method: 'POST',
  				url: '/gjdm/updateDimNation.do',
  				data: {
  					nationId,
  					nationNm,
  					nationNmEn,
  					isoCd,
  					iso3Cd,
  					isoNo,
  					continent,
  					updtId
  				},
  				success: function() {
  					history.replaceState({}, null, location.pathname);
  					location.reload();
  				}
  			})
  			};
  	};
  	
  	/* nation row 삭제 */
	function deleteDimNation(nationId) {
		if (confirm("국가 ID '" + nationId + "' 를 삭제하시겠습니까?")) {
			location = "deleteDimNation.do?nationId=" + nationId;
		};
	};
  
  	/* 추가 버튼 클릭시 모달 show */
  	$('#nationModal').click(function(){
  		$('#layer_area').show();
  	});
  	
  	/* Insert 유효성 검사 */
	function insertData(formname){

		var checkNum = /^[0-9]*$/; //숫자 (ISO번호)
		var checkEngA = /^[A-Z]*$/; //영어 대문자 (국가명 영문, ISO코드, ISO3코드)
		var checkKor = /^[가-힣]*$/; //한글 (국가명 한글)
		
		var nationNm = formname.nationNm.value;
		var nationNmEn = formname.nationNmEn.value;
		var isoCd = formname.isoCd.value;
		var iso3Cd = formname.iso3Cd.value;
		var isoNo = formname.isoNo.value;
		
		
		if (!checkKor.test(nationNm) || nationNm == '' || nationNm == null){
			alert('국가명(한글)은 한글만 입력가능합니다.');
			return false;
		}
		if (!checkEngA.test(nationNmEn) || nationNmEn == '' || nationNmEn == null){
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
		
		var formData = $(".insertForm").serialize()
		
		$.ajax({
          type: "POST",
          url: "/gjdm/insertDimNation.do",
          data: formData,
          success: function () {
         		location.reload();
         		alert("등록되었습니다.");
          },
      	error: function(e) {
      		console.log(e);
      	}    
		})
	}
	
	/* Pagination 버튼 클릭 */
	function pageClick(pageNo){
		//text to html
		const parser = new DOMParser();
		
		var contentLimit = $('#contentLimit option:selected').val();
		var continentPage = '${continentPage}';
		
		//contentLimit select 클릭시 1페이지로 이동
		if (pageNo == 0){
			pageNo = 1;
		}
		
		$.ajax({
			type : 'POST',
			url : '/gjdm/dimNationList.do',
			data : {
				'contentLimit' : contentLimit,
				'continentPage' : continentPage,
				'currentPage' : pageNo
			},
			dataType : 'html',
			success : function(data){
				//text to html
				data = parser.parseFromString(data, 'text/html');
				
				//change table
				var resultTable = data.getElementById('resultTable').childNodes;
				$('#resultTable').empty();
				$('#resultTable').html(resultTable);
				
				//change paging button
				var pagingButton = data.getElementById('pagingButton').childNodes;
				$('#pagingButton').empty();
				$('#pagingButton').html(pagingButton);
			},
			error : function(e){
				console.log(e);
			}
		});
	}
  </script> 
<%@ include file="../footer.jsp"%>