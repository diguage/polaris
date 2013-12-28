class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  # 为首个用户赋予admin角色
  def  after_sign_in_path_for(resource)
    if resource.is_a?(User)
      if User.count == 1
        resource.add_role 'admin'
      end
      resource
    end
    root_path
  end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << [:nickname, :email]
    end
end
