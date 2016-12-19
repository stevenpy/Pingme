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


	private

	def ping_params
		params.require(:ping).permit(:image, :caption)
	end
end
