class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	before_action :authorize
	include ApplicationHelper
  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.html { redirect_to root_url, notice: exception.message }
      format.js   { head :forbidden, content_type: 'text/html' }
    end
  end
	include SessionsHelper
protected

    def authorize
        @user = User.find_by_id(session[:user_id]) 
        if @user == nil
            redirect_to '/login', :notice => 'You must login first'
        end
    end
private
    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
     helper_method :current_user
end
