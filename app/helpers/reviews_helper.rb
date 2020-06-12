module ReviewsHelper
    def display_header(review)
        if params[:ice_cream_id]
            content_tag(:h1, "Add a Review for #{review.shoe.shoe_type} -  #{review.shoe.brand.name}")
        else
          content_tag(:h1, "Create a review")
        end
      end
    end

