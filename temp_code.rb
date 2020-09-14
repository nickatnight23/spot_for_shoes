<% if params[:shoe_id]%>
        <%= f.hidden_field :shoe_id%>
    <%else%>
<div>
        <%=f.label :shoe_id, "Select a Shoe that exists"%>
        <%= f.collection_select :shoe_id, Shoe.all, :id,:shoe_type,
        include_blank: true %>
        <% f.submit%>

        #how to check if nested? And a valid ID
        if @shoe = Shoe.find_by_id(params[:shoe_id])
            #nested
            @reviews = @shoe.reviews
        else
        @reviews = Review.all
        
<%#= link_to 'Edit', edit_shoe_review_path(@shoe, rw)%>

# scope :order_by_rating, -> { inner_join(:reviews).group(:id).
#   order('avg(stars)desc')}

# def destroy
    #   binding.pry
    #     @review = Shoe.find(params[:id])
    #     if current_user == @shoe.user
    #     @shoe.destroy
    #     end
    #     redirect_to new_shoe_path(@shoe), :notice => "Shoe has been deleted"
    #   end
    # end

    def destroy
        @review = Review.find(params[:id])
        @shoe = @review.shoe
        if current_user == @review.user
          @review.destroy
        end
          redirect_to shoe_reviews_path(@shoe), :notice => "Review has been deleted"
        end
      end