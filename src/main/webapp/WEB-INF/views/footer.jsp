<script type="text/javascript">
  $(document).ready(function(){
    //jquery for toggle sub menus
    $('.sub-btn').click(function(){
//       $(this).next('.sub-menu').slideToggle();
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