# frozen_string_literal: true

class DashboardController < ApplicationController
  before_action :not_logged_in
  def show; end

  private

  def not_logged_in
    return unless current_user == (nil)

    redirect_to root_path
    flash[:error] = 'Must be logged in!'
  end
end
