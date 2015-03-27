$("#new_comment").on("ajax:success", (e, data, status, xhr) ->
  <% if comment.error.any? %>
    $("#new_comment").append "hello"
   ).on "ajax:error", (e, xhr, status, error) ->
    $("#new_comment").append "<p>ERROR</p>"
