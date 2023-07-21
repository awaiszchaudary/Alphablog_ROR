class ApplicationController < ActionController::Base
    include Pundit
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :authenticate_user!
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    private

        def user_not_authorized
            flash[:alert] = "User not authorized"
            redirect_to articles_path
        end

    
    protected

        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
        end


end
