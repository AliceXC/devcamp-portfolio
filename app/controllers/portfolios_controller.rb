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

    def edit
         @portfolio_item = Portfolio.find(params[:id]) #note that params[] not params()
    end

    def update
        @portfolio_item = Portfolio.find(params[:id])
        respond_to do |format|
          if @portfolio_item.update(params.require(:portfolio).permit(:title, :subtitle, :body))
            format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully updated.' }
          else
            format.html { render :edit }
          end
        end
      end

end
