class ApplicationController < ActionController::Base

  before_action :set_current_user

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end
  
  private


  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope == :user
      posts_path
    else
      posts_path
    end
  end
  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :user
      new_user_session_path
    #elsif resource_or_scope == :admin
      #new_admin_session_path
    else
      root_path
    end
  end



end
