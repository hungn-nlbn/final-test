class SessionsController < ApplicationController
	skip_before_action :authorize
  layout "session"
  def new
    @page_title = "ProductManager|Login"
  end

  def create
  	if user = User.authenticate(params[:name],params[:password])
      if user.role == 'Admin'
    		session[:user_id] = user.id
    		redirect_to admin_url
      else
            session[:user_id] = user.id
    		redirect_to '/'
      end
  	else
  		redirect_to login_url, :alert => "Invaild username/password"
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to '/', :notice => "Logged out"
  end
end
