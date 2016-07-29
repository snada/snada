class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user_session, :current_user

  def index
    @posts = Post.first(3)
  end

  protected

  rescue_from CanCan::AccessDenied do |exception|
    render_forbidden
  end

  def require_authentication
    render_forbidden unless current_user
  end

  def current_user_session
    return @current_user_session if @current_user_session
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if @current_user
    @current_user = current_user_session && current_user_session.user
  end

  def render_forbidden
    render(file: File.join(Rails.root, 'public/403.html'), status: :forbidden, layout: false)
  end

  def render_not_found
    render(file: File.join(Rails.root, 'public/404.html'), status: :not_found, layout: false)
  end
end
