class ApplicationController < ActionController::Base
  before_action :set_current_request_details
  before_action :authenticate

  private
    def authenticate
      if session_record = Session.find_by_id(cookies.signed[:session_token])
        Current.session = session_record
      end
    end

    def is_logged_in
      unless session = Session.find_by_id(cookies.signed[:session_token])
        store_location
        flash[:danger] = "Please log in."
        redirect_to sign_in_path
      end
    end

    # Redirects to stored location (or to the default).
    def redirect_back_or(default)
      redirect_to(session[:forwarding_url] || default)
      session.delete(:forwarding_url)
    end

    def store_location
      session[:forwarding_url] = request.original_url if request.get?
    end

    def set_current_request_details
      Current.user_agent = request.user_agent
      Current.ip_address = request.ip
    end
end
