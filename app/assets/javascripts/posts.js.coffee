$(document).ready ->
  $editButton = $('.edit-button')
  $backButton = $('.back-button')

  $post = $('.post-main')
  $edit = $('.post-edit')

  $text = $('.text')

  $text.jTruncate({
    length: 200,
    minTrail: 0,
    moreText: "more",
    lessText: "less",
    ellipsisText: "...",
    moreAni: 300,
    lessAni: 300
  })

  $editButton.on 'click', (e) ->
    e.preventDefault()
    $(@).offsetParent().find($post).slideToggle()
    $(@).offsetParent().find($edit).slideToggle()

  $backButton.on 'click', (e) ->
    e.preventDefault()
    $(@).offsetParent().find($post).slideToggle()
    $(@).offsetParent().find($edit).slideToggle()

