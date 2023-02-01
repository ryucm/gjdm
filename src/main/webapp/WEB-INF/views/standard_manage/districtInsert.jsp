<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<title>스마트관광 빅데이터 플랫폼</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="title" content="스마트관광 빅데이터 플랫폼" />
<meta name="Author" content="스마트관광 빅데이터 플랫폼" />
<meta name="description" content="스마트관광 빅데이터 플랫폼" />
<meta name="keywords" content="스마트관광 빅데이터 플랫폼" />
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1"/>
<!-- layout css -->
<link rel="stylesheet" type="text/css" href="resources/css/styles.css">
<link rel="stylesheet" type="text/css" href="resources/css/select.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/jquery-ui.css" />
<!-- Main scripts -->
<script type="text/javascript" language="javascript" src="resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" language="javascript" src="resources/js/ui.js"></script>
</head>

<body>
<!---- Layer Popup ---->
<div id="layer_area" style="display:;">
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
            <a href="JavaScript:insertDistrict()" class="btn btnType01">추가</a><a href="JavaScript:closePopup()" class="btn btnType02">취소</a>
        </div>
      </div>
    </div>
  </div>
  <!---- Layer Popup ----> 
</body>
<script>
	/* district Insert */
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
	};
	
	/* 팝업창 닫기 */
	function closePopup() {
		window.close();
	}
</script>
</html>