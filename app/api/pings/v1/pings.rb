module Ping
  module V1
    class Pings < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api

      helpers do

        def filtered_params
          ActionController::Parameters.new(params).permit(:quantity)
        end
      end

      resource :pings do

        desc "Return list of pings"
        get do
          Ping.all
        end

        desc "Return a ping"
        params do
          requires :reference, type: String, desc: "Ping reference"
        end
        get ':reference' do
          Ping.find_by_reference(params[:reference])
        end

        desc "Updates ping quantity"
        params do
          requires :id, type: Integer, desc: "Ping id"
          optional :quantity, type: Integer, desc: "Ping quantity"
        end
        put ':id' do
          ping = Ping.find(params[:id])
          ping.update(filtered_params)

          present ping
        end

        desc "Delete ping"
        params do
          requires :id, type: Integer, desc: "Ping id"
        end
        delete ':id' do
          ping = Ping.find(params[:id])
          ping.destroy
        end
      end
    end
  end
end