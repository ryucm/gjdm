<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<script>
/* 수정버튼, 취소버튼 클릭시 로우 토글 */
function modify(id){
	$('.nonEdit[name="'+id+'"]').css('display', 'none');
	$('.editable[name="'+id+'"]').css('display', 'table-row')
}

function cancel(id){
	if (confirm("변경된 내용이 저장되지 않습니다.\n그래도 취소하시겠습니까?")) {
		location.reload();
	}
}
  $(document).ready(function(){
	//navbar active
	if(window.location.href.includes('dim')) {
		$('.sub-btn').eq(1).addClass('on');
  		$('.sub-btn').eq(1).next('.sub-menu').show();
  		
  		if(window.location.href.includes('Calendar')) {
  			$('a[href*="Calendar"]').addClass('active');
  		}
  		if(window.location.href.includes('Code')) {
  			$('a[href*="Code"]').addClass('active');
  		}
  		if(window.location.href.includes('Nation')) {
  			$('a[href*="Nation"]').addClass('active');
  		}
  		if(window.location.href.includes('Dist')) {
  			$('a[href*="Dist"]').addClass('active');
  		}
	}
	if(window.location.href.includes('etl')) {
		$('.sub-btn').eq(2).addClass('on');
  		$('.sub-btn').eq(2).next('.sub-menu').show();
  		
  		if(window.location.href.includes('Batch')) {
  			$('a[href*="Batch"]').addClass('active');
  		}
	}
	
	
    //jquery for toggle sub menus
    $('.sub-btn').click(function(){
      $(this).toggleClass('on');
      $(this).next('.sub-menu').slideToggle();
      $(this).find('.dropdown').toggleClass('rotate');
      $('#scrollArea').slimscroll();
    });
  });
  </script>
  <script>
    var hamburger = document.querySelector(".hamburger");
	hamburger.addEventListener("click", function(){
 		document.querySelector("body").classList.toggle("active");
	})
  </script>

</body>
</html>