class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  helper_method :current_admin, :admin_signed_in?

  private

  def current_admin
    @current_admin ||= Administrator.find_by(id: session[:admin_id]) if session[:admin_id]
  end

  def admin_signed_in?
    current_admin.present?
  end

  def authenticate_admin!
    unless admin_signed_in?
      flash[:alert] = 'Bu sayfaya erişmek için giriş yapmalısınız!'
      redirect_to login_path
    end
  end
end
