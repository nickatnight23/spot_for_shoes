class ShoesController < ApplicationController

    def new
        @shoe= Shoe.new
        @shoe.build_brand
    end

    def create
        @shoe = Shoe.new(shoe_params)
        @shoe.user_id = session[:user_id]
        if @shoe.save
        redirect_to shoe_path(@shoe)
        else
         render :new
    end
  end
    def index
        @shoes = Shoe.order_by_rating.includes(:brand)
    end

    def show
        @shoes = Shoe.find_by_id(params[:id])
    end
        
    private

    def shoe_params
        params.require(:shoe).permit(:shoe_type, :description, :brand_id, 
        brand_attributes:[:name])
    end
end
