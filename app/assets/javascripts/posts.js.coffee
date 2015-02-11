$(document).ready ->
  $editButton = $('.edit-button')
  $backButton = $('.back-button')

  $post = $('.post-main')
  $edit = $('.post-edit')

  $text = $('.text')

  $text.readmore({
    blockCSS: 'position: relative; top: 20px;'
    collapsedHeight: 210
  })

  $editButton.on 'click', (e) ->
    e.preventDefault()
    $(@).offsetParent().find($post).slideToggle()
    $(@).offsetParent().find($edit).slideToggle()

  $backButton.on 'click', (e) ->
    e.preventDefault()
    $(@).offsetParent().find($post).slideToggle()
    $(@).offsetParent().find($edit).slideToggle()

