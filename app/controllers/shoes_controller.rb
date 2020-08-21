class ShoesController < ApplicationController
    before_action :set_shoe, only:[:show, :edit, :update]
    before_action :redirect_if_not_logged_in


    def new
        @shoe= Shoe.new
        @shoe.build_brand
    end

    def create
        @shoe = Shoe.new(shoe_params)
        @shoe.user_id = session[:user_id]
       if @shoe.save #this is where validations happen
         redirect_to shoe_path(@shoe)
       else
         @shoe.build_brand
         render :new
       end
     end
     
    def index
      # binding.pry
        @shoes = Shoe.order_by_rating.includes(:brand)
    end

    def show
      @shoe = Shoe.find(params[:id])
    end

    def edit
      @shoe = Shoe.find(params[:id])
    end

    def update
      @shoe = Shoe.find(params[:id])
        if @shoe.update(shoe_params)
            redirect_to shoe_path(@shoe)
          else
            render :edit
          end
        end

          def destroy
            @shoe = Shoe.find(params[:id])
            if current_user == @shoe.user
            @shoe.destroy
          end
            redirect_to new_shoe_path(@shoe), :notice => "Shoe has been deleted"
          end
        end

        
    private

    def shoe_params
        params.require(:shoe).permit(:shoe_type, :description, :brand_id, 
        brand_attributes:[:name])
    end

    def set_shoe
        @shoe = Shoe.find_by(params[:id])
        redirect_to shoe_path if !@shoe
     end
   
  

