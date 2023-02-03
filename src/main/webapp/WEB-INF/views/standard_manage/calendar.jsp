<%@ page language="java" contentType="text/html; charset=utf-8"    
pageEncoding="utf-8"%>
<%@ include file="../header.jsp"%>
<!-- <script>
function valid() {
	const regex = /^[0-9]*$/;
	if(!regex.test(document.frm.keyword.value)){
		alert("정확한 연도의 형태로 입력해주세요.")
		document.frm.keyword.focus();
		return false
	}
		document.frm.submit();
}
function formSubmit() {
	  $("#searchForm").submit();
  };
</script> -->
<c:set var="yearList" value="${fn:split('2021,2022,2023,2024,2025',',')}"/>

<div class="col-2">
	<header>    
      <div class="top_navbar">
        <div class="hamburger">
           <a href="#">
               menu
           </a>
     	</div>
     </div>
  	 <div class="title">달력 관리</div>
    </header>
	<!----- Contents Start ----->
    <main class="content">
    <article>
      <div class="contentArea">
      <!-- Search -->
      <div class="searchTable1 mB15">
        <table>
          <colgroup>
          <col width="50%" />
          <col width="50%" />
          <col width="50%" />
          <col width="50%" />
          </colgroup>
          <tr>
          	<form action="/gjdm/dimCalendarList.do" method="post">
          		<td>
          			<p>연도</p>
					<select name="yearPage" id="yearSearch" style="width:15%">
		           		<option value="">전체</option>
		           		<c:forEach items="${yearList}" var="item">
		           			<option 
		           				<c:if test="${yearPage eq item}">selected="selected"</c:if>
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
	  <!-- Search --> 
      <!-- Subtitle -->
      <div class="subtitle">
        <h3>검색결과</h3>
      </div>
	<!-- Subtitle -->
      <!-- Grid Area -->
      <div id="resultTable" class="table_type1">
        <table summary="">
          <colgroup>
          <col width="7%" />
          <col width="7%" />
          <col width="7%" />
          <col width="4%" />
          <col width="4%" />
          <col width="4%" />
          <col width="4%" />
          <col width="4%" />
          <col width="4%" />
          <col width="7%" />
          <col width="7%" />
          <col width="11%" />
          <col width="7%" />
          <col width="11%" />
          <col width="7%" />
          <col />
          </colgroup>
          <thead>
            <tr>
				<th scope="col">날짜ID</th>
                <th scope="col">연월일</th>
				<th scope="col">연월</th>
				<th scope="col">반기</th>
				<th scope="col">분기</th>
				<th scope="col">월</th>
				<th scope="col">주차</th>
				<th scope="col">일</th>
				<th scope="col">요일명</th>
				<th scope="col">2주전 동요일</th>
				<th scope="col">분기 동요일</th>
				<th scope="col">생성일자</th>
				<th scope="col">생성자</th>
				<th scope="col">변경일자</th>
				<th scope="col">변경자</th>
			</tr>
		</thead>
		<tbody>
        	<c:forEach items="${dimCalendarList}" var="vo">
            	<tr>
					﻿<form action="/gjdm/dimCalendarList.do" method="post">
						<td>${vo.dateId}</td>
						<td><fmt:formatDate value="${vo.yyyymmdd}" pattern="yyyy-MM-dd"/></td>
						<td>${vo.yyyyMm}</td>
						<td>${vo.hy}</td>
						<td>${vo.qt}</td>
						<td>${vo.mm}</td>
						<td>${vo.wk}</td>
						<td>${vo.dd}</td>
						<td>${vo.dayNM}</td>
						<td>${vo.cmmn2WK}</td>
						<td>${vo.cmmn3MT}</td>
						<td><fmt:formatDate value="${vo.rgtrDt}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		                <td>${vo.rgtrId}</td>
		                <td><fmt:formatDate value="${vo.updtDt}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		                <td name="updtId">${vo.updtId}</td>
		                <!-- 페이징 관련 -->
						<%-- <input type="hidden" name="yearPage" value="${yearPage}"> --%>
	                </td>    
	              </form>
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
		    		<c:if test="${currentPage != pageNo}">
                            <a onclick="pageClick(${pageNo})">
                            ${pageNo}
                            </a>
                            </c:if>
                            <c:if test="${currentPage == pageNo}">
                            <strong>${pageNo}</strong>
                            </c:if>
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


  
  
  
  
  
  <script>
  /* Pagination 버튼 클릭 */
	function pageClick(pageNo){
		//text to html
		const parser = new DOMParser();
		
		var contentLimit = $('#contentLimit option:selected').val();
		var yearPage = '${yearPage}';
		
		//contentLimit select 클릭시 1페이지로 이동
		if (pageNo == 0){
			pageNo = 1;
		}
		
		$.ajax({
			type : 'POST',
			url : '/gjdm/dimCalendarList.do',
			data : {
				'contentLimit' : contentLimit,
				'yearPage' : yearPage,
				'currentPage' : pageNo
			},
			dataType : 'html',
			success : function(data){
				//text to html
				data = parser.parseFromString(data, 'text/html');
				
				//change table
				var resultTable = data.getElementById('resultTable');
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
