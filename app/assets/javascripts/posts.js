$(document).ready(function(){
  var $editButton = $('.edit-button');
  var $backButton = $('.back-button');
  var $post = $('.post-main');
  var $edit = $('.post-edit')

  $editButton.on('click', function(e) {
    e.preventDefault();
    $(this).offsetParent().find($post).slideToggle();
    $(this).offsetParent().find($edit).slideToggle();
  })

  $backButton.on('click', function(e) {
    e.preventDefault();
    $(this).offsetParent().find($post).slideToggle();
    $(this).offsetParent().find($edit).slideToggle();
  })
});
