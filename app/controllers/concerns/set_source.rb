module SetSource
    extend ActiveSupport::Concern

    included do
        before_action :set_source
    end

    def set_source
        # set this only if params[:q] exists
        session[:source] = params[:q] if params[:q]
    end
end