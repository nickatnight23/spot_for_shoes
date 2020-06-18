class BrandsController < ApplicationController
    before_action :redirect_if_not_logged_in
    
    def index
        @brands = Brand.all
    end

    def destroy
        @brand = Brand.find(params[:id])
        @brand.destroy
        redirect_to brands_path(@brand), :notice => "Brand has been deleted"
end
