$('#new_comment').on 'ajax:success', (e, data, status, xhr) ->
  <% if comment.errors.any? %>
    $(@).find('.form-inputs').append('<small class="error"><%= comment.errors[:message].shift %></small>') if $(@).has('.error')

    $(@).find('#comment_message').addClass('error')
  <% else %>
    location.reload()
  <% end %>
