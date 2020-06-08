class ShoesController < ApplicationController

    def new
        @shoe= Shoe.new
        @shoe.build_brand
    end

    def create
    end
        
    private

    def shoe_params
        params.require(:shoe).permit(:type, :description, :brand_id, 
        brand_attributes:[:name])
    end
end
