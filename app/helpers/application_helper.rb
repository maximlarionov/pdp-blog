module ApplicationHelper
  def error_show(model, field)
    errors = model.errors.to_hash
    errors[field] ? errors[field].join(', ') : ''
  end
end
