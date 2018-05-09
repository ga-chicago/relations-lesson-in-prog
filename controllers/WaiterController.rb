class WaiterController < ApplicationController

  get '/' do
    @waiters = Waiter.all
    @waiters.to_json
  end

  # get all the orders for a waiter
  get '/:id/orders' do

  end

  post '/' do

    payload_body = request.body.read
    payload = JSON.parse(payload_body).symbolize_keys

    p payload
    puts "-----------THIS WAS PAYLOAD"

    @waiter = Waiter.new
    @waiter.name = payload[:name]
    @waiter.save
    @waiter.to_json
  end

  put '/:id' do
    payload_body = request.body.read
    payload = JSON.parse(payload_body).symbolize_keys

    @waiter = Waiter.find params[:id]
    @waiter.name = payload[:name]
    @waiter.save
    @waiter.to_json
  end

  delete '/:id' do
    @waiter = Waiter.find params[:id]
    @waiter.destroy
    {
      success: true,
      message: "Waiter #{@waiter.name} deleted."
    }.to_json
  end

end 