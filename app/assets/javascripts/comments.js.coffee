$(document).ready ->
  $createButton = $('.comment-button')
  $form = $('.comment-area')
  $message = $('.message')

  $message.shorten({
    moreText: 'more',
    lessText: 'less'
})

  $createButton.on 'click', (e) ->
    e.preventDefault()
    $(@).parent().find($form).slideToggle()
