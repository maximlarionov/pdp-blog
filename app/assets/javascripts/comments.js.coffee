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

  # $submit.on 'click', (e) ->
  #   $.ajax
  #     dataType: "html"
  #     error: (jqXHR, textStatus, errorThrown) ->
  #       $form.append "AJAX Error: #{textStatus}"
  #     success: (data, textStatus, jqXHR) ->
  #       $form.append "Successful AJAX call: #{data}"



    # $('#new_comment').on 'ajax:success', (e, data, status, xhr) ->
      # <% if comment.errors.any? %>
      #   $(@).find('.form-inputs').append('<small class="error"><%= comment.errors[:message].shift %></small>') if $(@).has('.error')

      #   $(@).find('#comment_message').addClass('error')
      # <% else %>
      #   location.reload()
      # <% end %>




