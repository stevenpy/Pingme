module Ping
  class Base < Grape::API
    mount Ping::V1::Pings
  end
end