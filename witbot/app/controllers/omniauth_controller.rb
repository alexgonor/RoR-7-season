class OmniauthController < ApplicationController
  def create
    session[:user_id] = user.id

    redirect_to new_user_message_path(user)
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end

  private

  def account
    Account.find_by(account_params)
  end

  def user
    if account
      account.user
    else
      User.find_or_create_by(user_params.slice(:email)) do |u|
        u.name = user_params[:name]
        u.remote_image_url = user_params[:remote_image_url]
        u.accounts_attributes = [account_params]
      end
    end
  end

  def account_params
    {
      provider: auth_hash[:provider],
      uid: auth_hash[:uid]
    }
  end

  def user_params
    {
      email: auth_hash[:info][:email],
      name: auth_hash[:info][:name],
      remote_image_url: auth_hash[:info][:image]
    }
  end
end
