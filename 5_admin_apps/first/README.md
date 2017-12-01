```
Add to gem file:
gem 'devise'
gem 'carrierwave'
gem 'rmagick'
gem 'will_paginate'
gem 'bootstrap-sass'
gem 'jquery-rails'

bundle install

rails generate devise:install

rails generate devise user

rails generate devise:views

To migration add columns:
t.boolean :admin, default: false
t.string :avatar

rails db:migrate

To apl_contr add:
before_action :configure_permitted_parameters, if: :devise_controller?

before_action :authenticate_user!

def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password,
      :password_confirmation, :remember_me, :avatar) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password,
      :password_confirmation, :current_password, :avatar) }
end

rails generate uploader Avatar

In avatar_uploader uncomment:
include CarrierWave::RMagick
storage :file
def store_dir
  "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
end
version :thumb do
  process resize_to_fit: [100, 100]
end

In appl.html.erb add:
<body>
  <% if user_signed_in? %>
    <%= link_to 'Profile', current_user %>
  <% else %>
    <%= link_to 'Login', new_user_session_path %>
  <% end %>

  <%= yield %>
</body>

To routes add:
root 'welcome#index'
namespace :admin do
  resources :users, only: [:index, :show, :update, :destroy]
end
resources :users, except: [:destroy, :index]

Empty welcome_controller.rb
class WelcomeController < ApplicationController
  def index
  end
end

In views do welcome/index.erb
<h1>Hello!</h1>

rails g controller users
In controller
before_action :current_user, only: %i[show edit update]

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :avatar)
  end

Do admin folder in controllers admin/users_controller.rb
In admin folder do users_controller.rb
class Admin::UsersController < Admin::ApplicationController
  before_action :find_user, except: :index

  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to admin_users_path
    else
      render :edit
    end
  end

  def destroy
    @users = User.paginate(page: params[:page], per_page: 5)
    @user.destroy

    redirect_to admin_users_path
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :avatar, :admin)
  end
end

In admin folder do application_controller.rb
class Admin::ApplicationController < ApplicationController
  http_basic_authenticate_with name: 'secret_name', password: 'secret_name'

  before_action :require_admin

  private

  def require_admin
    redirect_to root_path unless current_user.admin?
  end
end

In models/user.rb add
scope :only_admin, proc { where(admin: true) }

VIEWS

In layouts do admin/application.html.erb
<!DOCTYPE html>
<html>
  <head>
    <title>ExampleApp</title>
    <%= csrf_meta_tags %>

    <%= stylesheet_link_tag    'application', media: 'all', 'data-turbolinks-track': 'reload' %>
    <%= javascript_include_tag 'application', 'data-turbolinks-track': 'reload' %>
  </head>

  <body>
    <div class="container">
      <h1>Admin</h1>

      <%= yield %>
    </div>
  </body>
</html>

In views do admin/users/index.html.erb
<div class="row">
  <table class="table">
    <thead>
      <tr>
        <th>ID</th>
        <th>Email</th>
        <th>Admin</th>
        <th></th>
      </tr>
    </thead>
    <tbody>
      <% @users.each do |user| %>
        <tr id=<%= "user_#{user.id}" %>>
          <%= render user %>
        </tr>
      <% end %>
    </tbody>
  </table>
</div>

In views/admin/users do show.erb
<h1>Hi</h1>

In views/admin/users do _user.html.erb
<td><%= user.id %></td>
<td><%= user.email %></td>
<td>
  <% if user.admin? %>
    <%= link_to 'Make user', admin_user_path(user, user: { admin: false }), method: :patch, remote: true %>
  <% else %>
    <%= link_to 'Make admin', admin_user_path(user, user: { admin: true }), method: :patch, remote: true %>
  <% end %>
  <td><%= link_to 'Destroy', admin_user_path(user), method: :delete, remote: true  %></td>
  <td><%= user.avatar.present? ? image_tag(user.avatar_url(:thumb)) : 'No Avatar' %></td>
  <td><%= link_to 'Edit', edit_admin_user_path(user) %></td>
</td>

In views/admin/users do destroy.js.erb
$("#users").html('<%= escape_javascript(render @users) %>')

In devise/registrations/new.html.erb
<div>
    <%= f.label :avatar %>
    <%= f.file_field :avatar %>
</div>

In views/admin/users do update.js.erb
$("#user_<%= @user.id %>").html('<%= escape_javascript(render @user) %>')

In users do
edit.html.erb

index.html.erb

show.html.erb
<h1><%= @user.email %></h1>

In app/assets/stylesheets/application.css.sass (renamed)
@import "bootstrap-sprockets";
@import "bootstrap";

In app/assets/javascripts/application.js
//= require jquery3
//= require jquery_ujs
//= require rails-ujs
//= require turbolinks
//= require_tree .
```

