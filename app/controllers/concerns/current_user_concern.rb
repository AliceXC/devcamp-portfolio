module CurrentUserConcern
    extend ActiveSupport::Concern


    # before current user is only available to devise user
    # but we now want current user to be available even when no user is logged in
    def current_user
        # super: don't change anything, i just want the exact same behavior 
        # as in the method that we are overriding

        # what this line means is that if the user is logged in, super is true,
        # then call super treat everything normal, and ignore right hand side
        # if super == false, call right hand side

        # super comes from devise class
        # meanwhile the r.h.s comes from open struct class
        super || guest_user
    end

    def guest_user
        guest = GuestUser.new
        guest.name = "Guest User"
        guest.first_name = "Guest"
        guest.last_name = "User"
        guest.email = "guest@example.com"
        # this is how we return guest
        guest
    end
end