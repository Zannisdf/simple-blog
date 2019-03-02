$(document).on('turbolinks:load', function(){
  $('.modal').on('shown.bs.modal', function(){
    var $input = $('#comment_content'),
        $ticker = $('#charCount'),
        $btn = $('#submitComment');
    if($input.length > 0){
      $input.keyup(function(){
        $ticker.text($input.val().length + '/160')
        $ticker.removeClass('text-danger');
        $btn.prop('disabled', false);
        if($input.val().length > 160){
          $btn.prop('disabled', true);
          $ticker.addClass('text-danger');
        }
      })
    }
  })
})
