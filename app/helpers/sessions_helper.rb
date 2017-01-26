module SessionsHelper


	def log_in(user)
		session[:user_id] = user.id
	end

	def current_user
		# if @current_user exists then use it, if its nil then lookup in db
		# ||= is the same as @current_user= @current_user || User.find_by(id: session[:user_id])
		@current_user ||= User.find_by(id: session[:user_id])
	end

	def logged_in?
    	!current_user.nil?
  	end
end
