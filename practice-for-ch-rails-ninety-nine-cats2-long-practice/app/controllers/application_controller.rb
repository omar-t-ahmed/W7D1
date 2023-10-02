class ApplicationController < ActionController::Base
    helper_method :current_user

    def current_user
        @current_user ||= find_by(session_token: session[:session_token])
    end

    def logged_in?
        !!current_user
    end

    def log_out!
        current_user.reset_session_token! if logged_in?
        session[:session_token] = nil
        @current_user = nil
    end
end