$(document).ready ->
  $editButton = $('.edit-button')

  $post = $('.post-main')
  $edit = $('.post-edit')

  $text = $('.post_text')

  $text.readmore({
    collapsedHeight: 210
  })

  $editButton.on 'click', (e) ->
    e.preventDefault()
    editToBack($(@))


  editToBack = (el) ->
    el.offsetParent().find($post).slideToggle()
    el.offsetParent().find($edit).slideToggle()
    el.text("Edit").toggleClass("secondary").toggleClass("success")

    if el.hasClass("success")
      el.text("Edit")
    else
      el.text("Back")
