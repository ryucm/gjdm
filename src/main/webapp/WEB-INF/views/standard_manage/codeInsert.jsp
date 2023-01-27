<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	
<script type="text/javascript">
	function fn_submit() {
		const regex = /^[A-Z0-9]*$/;
		if (document.frm.groupCode.value == "") {
			alert("코드 그룹을 입력해 주세요.")
			document.frm.groupCode.focus();
			return false
		} else if (!regex.test(document.frm.groupCode.value)) {
			alert("코드 그룹은 영어 대문자와 숫자만 입력 가능합니다.")
			return false
		}
		if (document.frm.groupName.value == "") {
			alert("코드 그룹명을 입력해 주세요.")
			document.frm.groupCode.focus();
			return false
		}
		if (document.frm.code.value == "") {
			alert("코드를 입력해 주세요.")
			document.frm.code.focus();
			return false
		}
		if (document.frm.codeValue.value == "") {
			alert("코드값를 입력해 주세요.")
			document.frm.code.focus();
			return false
		}
		if (document.frm.displayName.value == "") {
			document.frm.displayName.value = document.frm.codeValue.value
		}
		
		var formData = $(".insertForm").serialize()
		$.ajax({
            type: "POST",
            url: "/gjdm/insertCode.do",
            data: formData,
            success: function () {
           		alert("등록 완료")
           		window.opener.location.reload();
               	window.close();
            },
        	error: function(e) {
        		alert(e)
        	}    
		})
	}
</script>
<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid px-4">
			<h1 class="mt-4">코드등록</h1>
			<div class="card mb-4">
				<div class="card-body">
					<form name="frm" method="post" class="insertForm">
						<div>
							<label>코드 그룹</label>
							<input name="groupCode" type="text" id="groupCode" size="12">
						</div>
						<div>
							<label>코드 그룹명</label>
							<input name="groupName" type="text" id="groupName" size="12">
						</div>
						<div>
							<label>코드</label>
							<input name="code" type="text" id="code" size="12">
						</div>
						<div>
							<label>코드값</label>
							<input name="codeValue" type="text" id="codeValue" size="12">
						</div>
						<div>
							<label>출력값</label>
							<input name="displayName" type="text" id="displayName" size="12">
						</div>
						<div>
							<label>사용여부</label>
							<select name="useYN">
									<option value="Y">Y</option>
									<option value="N">N</option>
							</select>
						</div>
						<input type="hidden" name="rgtrId" value="test">
		                            	<input type="hidden" name="updtId" value="test">
						<div>
							<button type="submit" onclick="fn_submit(); return false;" class="codeBtn">생성</button>
							<button type="reset" class="codeBtn">취소</button>
						</div>
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

.insertForm>div {
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
	-webkit-appearance: none; /* 크롬 화살표 없애기 */
	-moz-appearance: none; /* 파이어폭스 화살표 없애기 */
	appearance: none; /* 화살표 없애기 */
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

.codeInput {
	width: 120px;
	padding: 3px;
	border-radius: 0;
	align-content: center;
}

.codeIdInput {
	width: 70px;
	text-align: center;
}

.codeBtn {
	box-shadow: inset 0px 1px 0px 0px #ffffff;
	background: linear-gradient(to bottom, #ededed 5%, #dfdfdf 100%);
	background-color: #ededed;
	border-radius: 6px;
	border: 1px solid #dcdcdc;
	display: inline-block;
	cursor: pointer;
	color: #777777;
	font-family: Arial;
	font-size: 13px;
	font-weight: bold;
	padding: 4px 15px;
	text-decoration: none;
	text-shadow: 0px 1px 0px #ffffff;
	margin: 1px;
}

.codeBtn:hover {
	background: linear-gradient(to bottom, #dfdfdf 5%, #ededed 100%);
	background-color: #dfdfdf;
	color: #777777;
}

.codeBtn:active {
	position: relative;
	top: 1px;
}
</style>
