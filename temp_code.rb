<% if params[:shoe_id]%>
        <%= f.hidden_field :shoe_id%>
    <%else%>
<div>
        <%=f.label :shoe_id, "Select a Shoe that exists"%>
        <%= f.collection_select :shoe_id, Shoe.all, :id,:shoe_type,
        include_blank: true %>
        <% f.submit%>

        