class ApplicationController < ActionController::Base
  protect_from_forgery
  
  rescue_from CanCan::AccessDenied do |exception|  
    flash[:error] = "Access denied!"  
    redirect_to root_path
  end
  
  helper_method :punti
  
  private
  
  def punti(current_user)
    if current_user
      @punti = Score.where(:user_id => current_user).sum('points')
      return @punti
    end
  end
   
end
