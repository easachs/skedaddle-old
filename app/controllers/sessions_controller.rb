# frozen_string_literal: true

class SessionsController < ApplicationController
  def omniauth
    user = User.from_omniauth(request.env['omniauth.auth'])
    return unless user.valid?

    session[:user_id] = user.id
    redirect_to dashboard_url
  end

  def destroy
    session.clear
    redirect_to root_url
  end
end
