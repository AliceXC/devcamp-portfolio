class PortfoliosController < ApplicationController
    def index
        @portfolio_items = Portfolio.all
        #calling the model inside of the controller and make it available for the view
    end
end
