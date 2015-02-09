$(document).ready ->
  $createButton = $('.comment-button')
  $form = $('.comment-area')
  $message = $('.message')

  $message.shorten({
    showChars: '100',
    moreText: 'more',
    lessText: 'less'
  })

  $createButton.on 'click', (e) ->
    e.preventDefault()
    $(@).parent().find($form).slideToggle()

