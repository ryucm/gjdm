//Tab
$(function () {

    $(".sub-menu").hide();
    //$(".sub-menu:first").show();

    $("sub-btn").click(function () {
        $("sub-btn").addClass("on");
        $(this).addClass("active");
        $(this).addClass("on");
        $(".sub-menu").hide();
        var activeTab = $(this).attr("rel");
        $("#" + activeTab).fadeIn();
    });
});
  
  
 //Tab
$(function () {

    $(".tab_content").hide();
    $(".tab_content:first").show();

    $("ul.tab02 li").click(function () {
        $("ul.tab02 li").removeClass("on").css({ "color":"#96989a","font-weight": "300"});
        $(this).addClass("active").css({"color": "darkred","font-weight": "bolder"});
        $(this).addClass("on").css({"color": "#000","font-weight": "500"});
        $(".tab_content").hide()
        var activeTab = $(this).attr("rel");
        $("#" + activeTab).fadeIn()
    });
});
   
   
 //Tab
  $(document).ready(function() {

			//When page loads...
			$(".tab_content").hide(); //Hide all content
			$("ul.tab03 li:first").addClass("active").show(); //Activate first tab
			$(".tab_content:first").show(); //Show first tab content

			//On Click Event
			$("ul.tab03 li").click(function() {

				$("ul.tab03 li").removeClass("active"); //Remove any "active" class
				$(this).addClass("active"); //Add "active" class to selected tab
				$(".tab_content").hide(); //Hide all tab content

				var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
				$(activeTab).fadeIn(); //Fade in the active ID content
				return false;
			});

  }); 
   
    
 
  $(function () {
	// Logout
		$('.logout').click(function() {
			$('.logoutBox').fadeIn();
		});
		$('.logoutBox').click(function() {
			$('.logoutBox').fadeOut();
		});
	});


//loading
$(document).ready(function(e) {
    $(window).resize(function(){
	  $('.loading').css({
		position:'absolute',
		left: ($(window).width() - $('.loading').outerWidth())/2,
		top: ($(window).height() - $('.loading').outerHeight())/2-10
	  });
	}).resize();
});


//Error
$(document).ready(function(e) {
    $(window).resize(function(){
	  $('.errorArea').css({
		position:'absolute',
		left: ($(window).width() - $('.errorArea').outerWidth())/2,
		top: ($(window).height() - $('.errorArea').outerHeight())/2-10
	  });
	}).resize();
});


//layer popup

 $(function () {
	 // Layer Popup Close
	 $('.closeLy').click(function() {
		 $('#layer_area').fadeOut();
	 });
	 $('.close').click(function() {
		 $('#layer_area').fadeOut();
	 });
	
});


$(document).ready(function(e) {
    $(window).resize(function(){
	  $('.layer_wrap').css({
		position:'absolute',
		left: ($(window).width() - $('.layer_wrap').outerWidth())/2,
		top: ($(window).height() - $('.layer_wrap').outerHeight())/5
	  });
	}).resize();
});


jQuery(function($){
	window.prettyPrint && prettyPrint();
	$('.wrapper').scrollbar();
});

