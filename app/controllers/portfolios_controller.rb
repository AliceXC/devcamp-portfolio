class PortfoliosController < ApplicationController
    def index
        @portfolio_items = Portfolio.all
        #calling the model inside of the controller 
        #and make it available for the view
    end

    def new
        @portfolio_item = Portfolio.new
    end

    def create
        # weird ? params.require(:portfolio_item or :portfolio) both worked?
        # updated only :portfolio works
        @portfolio_item = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body))

        respond_to do |format|
            if @portfolio_item.save
                format.html { redirect_to portfolios_path, notice: "your portfolio item is created."}
            else
                format.html { render :new}
            end
        end
    end

end
