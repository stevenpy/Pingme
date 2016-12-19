class PingsController < ApplicationController
	def index
		@pings = Ping.all
	end

	def new
		@ping = Ping.new
	end
	
	def create
		@ping = Ping.create(ping_params)
		redirect_to pings_path
	end

	def show
		@ping = Ping.find(params[:id])
	end

	def edit
		@ping = Ping.find(params[:id])
	end

	def update
		@ping = Ping.find(params[:id])
		@ping.update(ping_params)
		redirect_to(ping_path(@ping))
	end

	private

	def ping_params
		params.require(:ping).permit(:image, :caption)
	end
end
