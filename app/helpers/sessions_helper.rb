module SessionsHelper

  # To know who is the current user
  def current_user
    @current_user ||= User.find_by(id: session[:id])
  end

  # Checks if the user is the current user, boolean
  def current_user?(user)
    user == current_user
  end

  # To know if user is logged in or not
  def signed_in?
    !current_user.nil?
  end

  def signed_in_user
    unless signed_in?
      flash[:danger] = "Inicie sesión"
      redirect_to root_url
    end
  end

  def log_out
    session.delete(:id)
    current_user = nil
  end

end
