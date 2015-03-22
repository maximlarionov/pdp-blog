class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: :index
  protect_from_forgery

  helper ApplicationHelper

  protected

  def devise_parameter_sanitizer
    if resource_class == User
      User::ParameterSanitizer.new(User, :user, params)
    else
      super
    end
  end

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end
end
