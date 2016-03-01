module UsersHelper

# To know who is the current user
  def current_user
    @current_user ||= User.find_by(id: session[:id])
  end

  # Checks if the user is the current user, boolean
  def current_user?(user)
    user == current_user
  end

end
