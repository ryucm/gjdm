<%@ page language="java" contentType="text/html; charset=utf-8"    
pageEncoding="utf-8"%>
<%@ include file="../header.jsp"%>
<script>
function fn_submit() {
	const regex = /^[0-9]*$/;
	if(!regex.test(document.frm.keyword.value)){
		alert("정확한 연도의 형태로 입력해주세요.")
		document.frm.keyword.focus();
		return false
	}
		document.frm.submit();
}
</script>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">달력 관리</h1>
                        <div class="card mb-4">
                            <div class="card-body">
                            	<form name ="frm" action="/gjdm/dimCalendarList.do" method="post">
								<label for="yearSearch"> 연도 <input type="text" name="keyword" value="${keyword}"></label>
									<button type="submit" onclick="fn_submit(); return false;" class="calendarbtn">조회</button>
								</form>
							</div>
						</div>
						<div class="card mb-4 calendarList">
                            <div class="card-body">          
                                <table>                                	
                                    <thead>
                                        <tr>
                                        	<th>날짜ID</th>
                                        	<th>연월일</th>
                                            <th>연월</th>
                                            <th>반기</th>
                                            <th>분기</th>
                                            <th>월</th>
                                            <th>주차</th>
                                            <th>일</th>
                                            <th>요일명</th>
                                            <th>생성일자</th>
                                            <th>생성자</th>
                                            <th>변경일자</th>
                                            <th>변경자</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                       					<c:forEach items="${dimCalendarList}" var="vo">
                                    	<tr>
											﻿<form action="/gjdm/dimCalendarList.do" method="post">
											<td><input name="dateId" class="calendarInput" value="${vo.dateId}" readonly></td>
											<td><input name="yyyymmdd" class="${vo.dateId} calendarInput"
												value="<fmt:formatDate value="${vo.yyyymmdd}" pattern="yyyy-MM-dd"/>" disabled required></td>
											<td><input name="yyyyMm" class="${vo.dateId} calendarInput"
												value="${vo.yyyyMm}" disabled required></td>
											<td><input name="hy" class="${vo.dateId} calendarInput"
												value="${vo.hy}" disabled required></td>
											<td><input name="qt" class="${vo.dateId} calendarInput"
												value="${vo.qt}" disabled required></td>
											<td><input name="mm" class="${vo.dateId} calendarInput"
												value="${vo.mm}" disabled required></td>
											<td><input name="wk" class="${vo.dateId} calendarInput"
												value="${vo.wk}" disabled required></td>
											<td><input name="dd" class="${vo.dateId} calendarInput"
												value="${vo.dd}" disabled required></td>
											<td style="text-align:right"><input name="dayNM" class="${vo.dateId} calendarInput"
												value="${vo.dayNM}" disabled required></td>
											<td style="text-align:center"><input
												value="<fmt:formatDate value="${vo.rgtrDt}" pattern="yyyy-MM-dd HH:mm:ss"/>"
												disabled></td>
											<td style="text-align:right"><input value="${vo.rgtrId}" class="calendarInput" disabled/></td>
											<td style="text-align:center"><input value="<fmt:formatDate value="${vo.updtDt}" pattern="yyyy-MM-dd HH:mm:ss"/>" disabled></td>
	                                        <td style="text-align:right"><input name="updtId" id="updtId${vo.dateId}" class="calendarInput" value="${vo.updtId}" disabled></td>
	                                       </form>
	                                      </tr>
                       					</c:forEach>				
                                    </tbody>
                                </table>
                              </div>
                            </div>
                         </div>            
                	</main>
                <style>
            	.calendarList > .card-body {
            		margin: 0;
            		padding: 5;
            	}
            	table {
            		font-size : 11px;
            		width : 100%;
            		margin: 0;
            		
            	}
            	thead {
            		border-bottom: 3px solid black;
            		height: 40px;
            	}
            	th {
            		text-align: center;
            		padding: -10;
            	}
            	td {
            		text-align: left;
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
            	
             	.calendarInput { 
              		width: 120px;
              		padding: 3px;
              		border-radius: 0;
              		align-content: center;
             	} 
             	.calendarInput {
             		width: 70px;
             		text-align: center;
             	}
				.calendarbtn {
					box-shadow:inset 0px 1px 0px 0px #ffffff;
					background:linear-gradient(to bottom, #ededed 5%, #dfdfdf 100%);
					background-color:#ededed;
					border-radius:6px;
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
				.calendarbtn:hover {
					background:linear-gradient(to bottom, #dfdfdf 5%, #ededed 100%);
					background-color:#dfdfdf;
					color:#777777;
				}
				.calendarbtn:active {
					position:relative;
					top:1px;
				}
            </style>
<%@ include file="../footer.jsp"%>
