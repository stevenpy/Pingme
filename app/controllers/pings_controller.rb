class PingsController < ApplicationController
	before_action :set_ping, only: [:show, :edit, :update, :destroy]
	before_action :owned_post, only: [:edit, :update, :destroy]
	before_action :authenticate_user!

	def index
		@pings = Ping.all
	end

	def new
		@ping = current_user.pings.build
	end
	
	def create
		@ping = current_user.pings.build(ping_params)

		if @ping.save
			flash[:success] = "Your ping has been created!"
			redirect_to pings_path
		else
			flash.now[:alert] = "Your new ping couldn't be created!"
			render :new
		end
	end

	def show
	end

	def edit
	end

	def update
		if @ping.update(ping_params)
			flash[:success] = "Ping updated."
			redirect_to pings_path
		else
			flash.now[:alert] = "Update failed.  Please check the form."
			render :edit
		end
	end

	def destroy
		@ping.destroy
		redirect_to root_path
	end

	private

	def ping_params
		params.require(:ping).permit(:image, :caption)
	end

	def set_ping
    @ping = Ping.find(params[:id])
  end

  def owned_post  
  	unless current_user == @ping.user
    	flash[:alert] = "That ping doesn't belong to you!"
    	redirect_to root_path
  	end
	end 
end