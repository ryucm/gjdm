<script type="text/javascript">
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
  		if(window.location.href.includes('District')) {
  			$('a[href*="District"]').addClass('active');
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