module ApplicationHelper
    def login_helper
        # current_user is a method provided by Devise gem
        if current_user.is_a?(User) 
            link_to 'Logout', destroy_user_session_path, method: :delete 
        else 
            (link_to 'Sign up', new_user_registration_path) + 
            "<br>".html_safe +
            (link_to 'Login', new_user_session_path)
        end 
    end
end

