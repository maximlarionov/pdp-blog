$(document).ready ->
  $editButton = $('.edit-button')
  $backButton = $('.back-button')

  $post = $('.post-main')
  $edit = $('.post-edit')

  $editButton.on 'click', (e) ->
    e.preventDefault()
    $(this).offsetParent().find($post).slideToggle()
    $(this).offsetParent().find($edit).slideToggle()

  $backButton.on 'click', (e) ->
    e.preventDefault()
    $(this).offsetParent().find($post).slideToggle()
    $(this).offsetParent().find($edit).slideToggle()

