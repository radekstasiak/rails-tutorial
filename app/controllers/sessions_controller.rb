class SessionsController < ApplicationController
  def new
    if logged_in?
      user =  @current_user
      redirect_to user

    else
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
    flash.now[:success] = "You were sucessfully logged out"
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  		log_in user
  		redirect_to user
  	else
  		flash.now[:danger] = 'Invalid email/password combination'
  		render 'new'
  	end
  end
end
