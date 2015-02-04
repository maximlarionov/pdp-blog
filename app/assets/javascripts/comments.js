$(document).ready(function(){
  var $createButton = $('.comment-button');
  var $form = $('.comment-area');

  $createButton.on('click', function(e) {
    e.preventDefault();
    $(this).parent().find($form).slideToggle();
  })
});
