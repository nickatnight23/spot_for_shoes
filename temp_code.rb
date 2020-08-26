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

<%# <%= form_for(@shoe) do |f|%>
<div>
<%= f.label :shoe_type%>
<%= f.text_field :shoe_type%>
</div>
<div>
<%= f.label :description%>
<%= f.text_field :description%>
</div>

<p>Select a Brand that Exists</p>
<div>
    <%= f.collection_select :brand_id, Brand.all, :id, :name%>
<div>
OR

<p>Create a New Brand:</p>
<div>
    <%=f.fields_for :brand do |b|%>
    <%=b.label :name%>
     <%=b.text_field :name%>

    <%end%>
</div>

<%= f.submit :submit %>
<%end%>



 %>


 <%= form_for(@shoe) do |f|%>
    <div>
    <%= f.label :shoe_type%>
    <%= f.text_field :shoe_type%>
    </div>
    <div>
    <%= f.label :description%>
    <%= f.text_field :description%>
    </div>
    
    <p>Select a Brand that Exists</p>
    <div>
        <%= f.collection_select :brand_id, Brand.all, :id, :name%>
    <div>
    OR
    
    <p>Create a New Brand:</p>
    <div>
        <%=f.fields_for :brand do |b|%>
        <%=b.label :name%>
         <%=b.text_field :name%>
    
        <%end%>
    </div>
    
    <%= f.submit :submit %>
    <%end%>
    
    
    
