module DeviseWhitelist
    # this gives us all the kinds of methods that are 
    # inside of the ActiveSupport::Concern module
    # concerns allow us to include before filters 
    extend ActiveSupport::Concern
    included do
        # :configure_permitted_parameters, just a random name
        # this runs whenever we are communicating with devise.
        before_action :configure_permitted_parameters, if: :devise_controller?
    end

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end

end