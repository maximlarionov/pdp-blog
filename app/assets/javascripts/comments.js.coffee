$(document).ready ->
  $commentButton = $('.comment-button')
  $form = $('.comment-area')
  $message = $('.message')
  $submit = $('.comment-submit')

  $message.readmore({
    collapsedHeight: 100
  })

  $commentButton.on 'click', (e) ->
    e.preventDefault()
    $(@).parent().find($form).slideToggle()

  $submit.on 'click', (e) ->




