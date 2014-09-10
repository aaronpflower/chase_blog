module SessionsHelper

	def sign_in(admin)
    remember_token = Admin.new_remember_token # create new token
    cookies.permanent[:remember_token] = remember_token # place raw token in the browser cookies
    admin.update_attribute(:remember_token, Admin.digest(remember_token)) # save the hashed token to the database
    # update_attribute updates a single attribute while bypassing validations 
    self.current_admin = admin # set the current admin equal to the given admin
  end

  def signed_in?
  	!current_admin.nil?
  end

  def current_admin=(admin)
  	@current_admin = admin
  end

  def current_admin
    remember_token = Admin.digest(cookies[:remember_token])
    @current_admin ||= Admin.find_by(remember_token: remember_token)
  end

  def sign_out
    cookies.delete(:remember_token)
    self.current_admin = nil
  end
end
