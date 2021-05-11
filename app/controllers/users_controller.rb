class UsersController < ApplicationController
  def login
    redirect_to root_path if user_signed_in?
  end
end