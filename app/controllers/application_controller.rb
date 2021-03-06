class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
    rescue_from CanCan::AccessDenied do |exception|
      flash[:danger] = "Security Issue -- You are not Authorized Fool!"
    redirect_to root_url
  end
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def configure_permitted_parameters
  devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, 
                                                          :password, 
                                                          :password_confirmation, 
                                                          :username,
                                                          :image,
                                                          :age,
                                                          :gender,
                                                          :location,
                                                          :bio,
                                                          :alt_email
                                                          ) 
                                                          }
  devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, 
                                                          :password, 
                                                          :password_confirmation, 
                                                          :current_password, 
                                                          :username,
                                                          :image,
                                                          :cover,
                                                          :age,
                                                          :gender,
                                                          :location,
                                                          :bio,
                                                          :alt_email,
                                                          :youtube_permission,
                                                          :facebook_permission,
                                                          :email_permission,
                                                          :twitter_permission,
                                                          :birthday_permission, 
                                                          :facebook,
                                                          :twitter,
                                                          :youtube
                                                          ) 
                                                          }  
  end
end
