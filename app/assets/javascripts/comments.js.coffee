$(document).ready ->
  $createButton = $('.comment-button')
  $form = $('.comment-area')
  $message = $('.message')

  $message.jTruncate({
    length: 120,
    minTrail: 0,
    moreText: "more",
    lessText: "less",
    ellipsisText: "...",
    moreAni: 300,
    lessAni: 300
  })

  $createButton.on 'click', (e) ->
    e.preventDefault()
    $(@).parent().find($form).slideToggle()

