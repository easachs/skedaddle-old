# frozen_string_literal: true

class DashboardController < ApplicationController
  before_action :not_logged_in
  skip_before_action :not_logged_in, only: [:index]

  def index
    redirect_to dashboard_path if current_user
    @user_count = User.count
    @itin_count = Itinerary.count
  end

  def show; end

  def about_us; end

  def contact; end

  private

  def not_logged_in
    return unless current_user == (nil)

    redirect_to root_path
    flash[:error] = 'Must be logged in!'
  end
end
