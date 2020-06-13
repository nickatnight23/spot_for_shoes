class ReviewsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new
        if @shoe = Shoe.find_by_id(params[:shoe_id])
            @review = @shoe.reviews.build
          else
            @review = Review.new
          end
        end

    def create
       @review = current_user.reviews.build(review_params)
       if @review.save #checks for validation
        redirect_to review_path(@review)
       else
        render :new
    end
end

    def show
        @review = Review.find_by_id(params[:id])

    end

    def index
        #how to check if nested? And a valid ID
        if @shoe = Shoe.find_by_id(params[:shoe_id])
            #nested
            @reviews = @shoe.reviews
        else
        @reviews = Review.all
    end
end

    private

    def review_params
        params.require(:review).permit(:shoe_id,
         :content, :stars, :title)
    end
end

