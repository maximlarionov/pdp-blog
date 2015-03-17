$(document).ready ->
  $createButton = $('.comment-button')
  $form = $('.comment-area')
  $message = $('.message')

  $message.readmore({
    collapsedHeight: 100
  })

  $createButton.on 'click', (e) ->
    e.preventDefault()
    $(@).parent().find($form).slideToggle()

