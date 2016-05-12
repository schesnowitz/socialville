​app/views/users/index.html.erb​

<h2>Profiles</h2>
<div class="btn-group" role="group" aria-label="Default Button Groups">
<button type="button" class="btn btn-default">Everyone</button>
<button type="button" class="btn btn-default">Friends</button>
<button type="button" class="btn btn-default">Requests</button>
<button type="button" class="btn btn-default">Pending</button>
</div>
</div>

<div class="container">
<div class="row">
<%= render @users %>
</div>
</div>

​----------------------------------------------


app/views/users/_user.html.erb​




<%= link_to user_path(user.username) do %>
<%= image_tag @user.image.url(:micro), class: "img-circle" %>
                                        
<% end %>

<h3><%= user.username %></h3>
<p>Friendship Actions</p>

-------------------------------------

<li><%= link_to "Profiles", users_path if current_user %></li>


