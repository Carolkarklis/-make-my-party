$(function(){

  $(".tab").on("click", function(e){
    // Change active tab
    $('.tab').removeClass('active');
    $(this).toggleClass('active');
    // Hide all tab-content (use class="hidden")
    $('.tab-content').addClass('hidden');
    var target = $(this).data('target');

    // Show target tab-content (use class="hidden")
    $(target).removeClass('hidden');

  });

});
