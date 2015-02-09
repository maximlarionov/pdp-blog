$(document).ready ->
  $createButton = $('.comment-button')
  $form = $('.comment-area')
  $createButton.on 'click', (e) ->
    e.preventDefault()
    $(this).parent().find($form).slideToggle()
