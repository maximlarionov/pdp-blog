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
    e.preventDefault()
    alert('HI')
    # $.ajax
    #   dataType: "html"
    #   error: (jqXHR, textStatus, errorThrown) ->
    #     $form.append "AJAX Error: #{textStatus}"
    #   success: (data, textStatus, jqXHR) ->
    #     $form.append "Successful AJAX call: #{data}"




