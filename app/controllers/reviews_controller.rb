class ReviewsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new
        @review= Review.new
        # if @shoe = Shoe.find_by_id(params[:shoe_id])
        #     @review.build_shoe
        #   else
        #     @review = Review.new
        #   end
        end

    def create
    #    @review = current_user.reviews.build(review_params)
       @review = Review.new(review_params)
       @review.user_id = current_user.id
       @review.shoe_id = params[:shoe_id].to_i
       @shoe = Shoe.find_by_id(params[:shoe_id])
       if @review.save #checks for validation
        redirect_to shoe_path(@shoe)
       else
        render :new
    end
end

    def show
        # @review = Review.find_by_id(params[:id])

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

