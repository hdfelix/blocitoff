module LoginMacros

	def set_user_session(user)
		session[:user_id] = user.id
	end

	def sign_in(user)
		visit root_path
		click_link 'Sign in'
		fill_in 'Email', with: user.email
		fill_in 'Password', with: user.password
		click_button 'Sign in'
	end

	def log_in(user)
		post login_path, login: user.email, password: 'secret_password'
	end
end

