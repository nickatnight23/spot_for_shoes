class ReviewsController < ApplicationController

    def new
        @shoe = Shoe.find_by_id(params[:shoe_id])
        @review = @shoe.build_review

        # A review belongs_to a shoe
    end

    def index
    end
end
