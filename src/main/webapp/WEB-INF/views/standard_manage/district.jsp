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
                <select id="nationSearch" name="nationId" required  onchange="selectNation(value)" style="width:100%;">
                  <option value="" disabled selected>-------선택하세요-------</option>
                  <c:forEach items="${dimNationList}" var="nation">
                    <option value="${nation.nationId}" <c:if test="${nationId eq nation.nationId}">selected</c:if>>${nation.nationNm}</option>
                  </c:forEach> 
              </select>
              </td>
              <td>
                <p>시도</p>
                <select id="distLvl1Search" name="distLvl1" onchange="selectDistLvl1(value)" style="width:100%;">
                  <option value="" disabled selected>-------선택하세요-------</option>
                  <c:forEach items="${distLvl1List}" var="distLvl1List">
                    <c:if test="${distLvl1List.nationId eq nationId}">
                      <option value="${distLvl1List.distLvl1}" <c:if test="${distLvl1 eq distLvl1List.distLvl1}">selected</c:if>>${distLvl1List.distLvl1}</option>
                    </c:if>
                  </c:forEach>
              </select>
              </td>
              <td>
              <p>군구선택</p>
                <select id="distLvl2Search" name="distLvl2" style="width:100%;">
                  <option value="" disabled selected>-------선택하세요-------</option>
                  <c:forEach items="${distLvl2List}" var="distLvl2List">
                    <c:if test="${distLvl2List.nationId eq nationId and distLvl2List.distLvl1 eq distLvl1}">
                      <option value="${distLvl2List.distLvl2}" <c:if test="${distLvl2 eq distLvl2List.distLvl2}">selected</c:if>>${distLvl2List.distLvl2}</option>
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
      <div class="table_type1">
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
                  <c:forEach items="${dimNationList}" var="nation">
                	<c:if test="${nation.nationId eq vo.nationId}">
              			<td>${nation.nationNm}</td>
                	</c:if>
                  </c:forEach>
	              <td>${vo.districtId}</td>
	              <td>${vo.distLvl1}</td>
	              <td>${vo.distLvl2}</td>
	              <td>${vo.distLvl3}</td>
	              <td><fmt:formatDate value="${vo.rgtrDt}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
	              <td>${vo.rgtrId}</td>
	              <td><fmt:formatDate value="${vo.updtDt}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
	              <td>${vo.updtId}</td>
	              <td>
	              	<a href="#" class="gridBtn btnEdit">수정</a>
	              	<a href="JavaScript:deleteDistrict(${vo.districtId})" class="gridBtn btnDelete">삭제</a>
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
	              <td><input type="text" class="inputArea" style="width: 90%;" name="distLvl1${vo.districtId}" value="${vo.distLvl1}" required></td>
	              <td><input type="text" class="inputArea" style="width: 90%;" name="distLvl2${vo.districtId}" value="${vo.distLvl2}" required></td>
	              <td><input type="text" class="inputArea" style="width: 90%;" name="distLvl3${vo.districtId}" value="${vo.distLvl3}" required></td>
	              <td><fmt:formatDate value="${vo.rgtrDt}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
	              <td>${vo.rgtrId}</td>
	              <td><fmt:formatDate value="${vo.updtDt}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
	              <td name="updtId${vo.districtId}">${vo.updtId}</td>
	              <td>
	              	<a href="JavaScript:updateDistrict(${vo.districtId})" class="gridBtn btnSave">저장</a>
	              	<a href="#" class="gridBtn btnCancel">취소</a>
	              </td>
	             </tr>
            </c:forEach>
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
  <!---- Layer Popup ---->
  <div id="layer_area" style="display: none;">
	  <div class="layer_pop"></div>
	  <div class="layer_wrap" style="width:500px;">
	    <div class="layBox">
	      <p class="btn_close"><a href="#none" class="closeLy"><img src="resources/images/ico_pop_close.png" title="close" alt="close" /></a></p>
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
		                </select></td>
		            </tr>
		            <tr>
		              <td>
		                <p>시도</p>
		                <input type="text" placeholder="시도" class="inputArea" name="distLvl1" required style="width:100%;"></td>
		            </tr>
		            <tr>
		              <td>
		                <p>군구</p>
		                <input type="text" placeholder="군구" class="inputArea" name="distLvl2" required style="width:100%;"></td>
		            </tr>
		            <tr>
		              <td>
		                <p>동</p>
		                <input type="text" placeholder="동" class="inputArea" name="distLvl3" required style="width:100%;"></td>
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
	            <a href="JavaScript:insertDistrict()" class="btn btnType01">추가</a><a href="#none" class="btn btnType02 close">취소</a>
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
    window.onkeydown = function(e) {
  	  var kcode = event.keyCode;
  	  if(kcode == 116 || kcode == 82 && e.ctrlKey) {
  		history.replaceState({}, null, location.pathname);
  	  }
    };
    
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
			success: function() {
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
	$('#districtModal').click(function(){
  		$('#layer_area').show();
  	});
	
	/* district Insert */
	function insertDistrict() {
		var formData = $("#insertForm").serialize();
		$.ajax({
			url: '/gjdm/insertDimDistrict.do',
			type: 'post',
			data: formData,
			success: function() {
				console.log("success");
				location.reload();
				alert("등록되었습니다.");
			},
			error: function(e) {
				console.log(e);
			}
		})
	};
  </script>
  <%@ include file="../footer.jsp"%>