class PortfoliosController < ApplicationController
    before_action :set_portfolio_item, only: [:edit, :update, :show, :destroy]
    layout "portfolio"
    access all: [:show, :index, :angular, :ruby_on_rails], 
         user: {except: [:destroy, :new, :create, :update, :edit]}, 
         site_admin: :all
         
    def index
        @portfolio_items = Portfolio.all
        #calling the model inside of the controller 
        #and make it available for the view
    end

    def angular
        # @angular_portfolio_items is the instance variable that we are going to use in views
        @angular_portfolio_items = Portfolio.angular
    end

    def ruby_on_rails
        @ruby_on_rails_portfolio_items = Portfolio.ruby_on_rails_portfolio_items
    end

    def new
        @portfolio_item = Portfolio.new
        3.times { @portfolio_item.technologies.build}
    end

    def create
        # weird ? params.require(:portfolio_item or :portfolio) both worked?
        # updated only :portfolio works
        @portfolio_item = Portfolio.new(portfolio_params)

        respond_to do |format|
            if @portfolio_item.save
                format.html { redirect_to portfolios_path, notice: "your portfolio item is created."}
            else
                format.html { render :new}
            end
        end
    end

    def edit
    end

    def update
        respond_to do |format|
          if @portfolio_item.update(portfolio_params)
            format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully updated.' }
          else
            format.html { render :edit }
          end
        end
    end

    def show
    end

    def destroy
        # same action as in console
        # destroy/delete the record
        @portfolio_item.destroy 

        # redirect
        respond_to do |format|
            format.html { redirect_to portfolios_url, notice: 'Record was removed!'}
        end
    end

    private

    def set_portfolio_item
        #Portfolio performs the lookup database query
        @portfolio_item = Portfolio.find(params[:id])
    end

    def portfolio_params
        params.require(:portfolio).permit(:title,
                                        :subtitle,
                                        :body,
                                        technologies_attributes: [:name]
                                        )
    end
end
