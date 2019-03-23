$(document).on('turbolinks:load', function(){
  var $input = $('#search-form');
  $input.keyup( function() {
    $('.blog-post-thumb').show();
    if ($input.val().length >= 3){
      $('.post-title').filter(function(){
        return (!$(this).text().toLowerCase().includes($input.val().toLowerCase()));
      }).parent().parent().hide();
    }
  })
});