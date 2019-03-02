$(document).on('turbolinks:load', function(){
  var $input = $('#search-form');
  $input.keyup( function() {
    $('.post').show();
    if ($input.val().length >= 3){
      $('.post-title').filter(function(){
        return (!$(this).text().toLowerCase().includes($input.val().toLowerCase()));
      }).parent().parent().hide();
    }
  })
});