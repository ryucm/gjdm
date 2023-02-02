<%@ page language="java" contentType="text/html; charset=utf-8"    
pageEncoding="utf-8"%>
<%@ include file="../header.jsp"%>
<script>
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
</script>
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
          <col width="20%" />
          <col width="20%" />
          <col width="20%" />
          <col width="20%" />
          <col />
          </colgroup>
          <tr>
          	<form name = "frm" action="/gjdm/dimCalendarList.do" method="post" id="searchForm">
          		<td>
          			<p>연도</p>
					<label for="yearSearch"><input type="text" name="keyword" value="${keyword}" style="margin-right:950px;" placeholder="연도4자리 입력"></label>
					<td>
						<div class="btnArea">
						<a href = "JavaScript:formSubmit()" class="btn btnType01" onclick="valid(); return false;">조회</a>
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
      <div class="table_type1">
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
						<td name="dateId">${vo.dateId}</td>
						<td><fmt:formatDate value="${vo.yyyymmdd}" pattern="yyyy-MM-dd"/></td>
						<td name="yyyyMm">${vo.yyyyMm}</td>
						<td name="hy">${vo.hy}</td>
						<td name="qt">${vo.qt}</td>
						<td name="mm">${vo.mm}</td>
						<td name="wk">${vo.wk}</td>
						<td name="dd">${vo.dd}</td>
						<td name="dayNM">${vo.dayNM}</td>
						<td name="cmmn2WK">${vo.cmmn2WK}</td>
						<td name="cmmn3MT">${vo.cmmn3MT}</td>
						<td><fmt:formatDate value="${vo.rgtrDt}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		                <td>${vo.rgtrId}</td>
		                <td><fmt:formatDate value="${vo.updtDt}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		                <td name="updtId">${vo.updtId}</td>
	                </td>    
	              </form>
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
<%@ include file="../footer.jsp"%>
