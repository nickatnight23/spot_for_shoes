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