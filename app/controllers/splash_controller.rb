# app/controllers/splash_controller.rb

class SplashController < ApplicationController
  before_action :redirect_based_on_authentication

  def index; end

  private

  def redirect_based_on_authentication
    return unless user_signed_in?

    redirect_to categories_path
  end
end
