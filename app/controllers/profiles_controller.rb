class ProfilesController < ApplicationController
  def show
    @pings = User.find_by(user_name: params[:user_name]).pings.order('created_at DESC')
  end
end
