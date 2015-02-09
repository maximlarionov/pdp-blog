$(document).ready ->
  $editButton = $('.edit-button')
  $backButton = $('.back-button')

  $post = $('.post-main')
  $edit = $('.post-edit')

  $text = $('.text')

  $text.shorten(
    showChars: '300',
    moreText: 'read more'
  )

  $editButton.on 'click', (e) ->
    e.preventDefault()
    $(@).offsetParent().find($post).slideToggle()
    $(@).offsetParent().find($edit).slideToggle()

  $backButton.on 'click', (e) ->
    e.preventDefault()
    $(@).offsetParent().find($post).slideToggle()
    $(@).offsetParent().find($edit).slideToggle()

