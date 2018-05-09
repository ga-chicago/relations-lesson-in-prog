class WaiterController < ApplicationController

  get '/' do
    @waiters = Waiter.all
    @waiters.to_json
  end

  # get all the orders for a waiter
  # which waiter an order goes with
  get '/:id/orders' do
    waiter = Waiter.find_by id: params[:id]
    this_waiter_orders = waiter.orders
    {
      success: true,
      message: "Found #{this_waiter_orders.length} orders for #{waiter.name}",
      orders: this_waiter_orders
    }.to_json
  end
  # you could have also made an order controller and had it be like orders/:waiter_id
  # and that'd have been fine too if you had a good reason


  # you could also use this relation to find:
  # how many orders is __some waiter__ waiting on currently (open = true)
  # how many items were ordered by __some waiter's__ customers today
  # how many orders have been sent out (open = false) for __some waiter_

  # or you could maybe just a page about each waiter -- 
  # you'd still ahve to do the same query, but you might
  # choose to do it in a basic show route like this: 

  # you could use this relation or a similar one or a combination of both
  # to maybe make a waiter show route?
  # what info might be useful here?
  get '/:id' do
    w = waiter Waiter.find :id

    # you can include whatever you want
    # try to think of something else you could include that isn't thought of here
    # what to include will be dictated by client or project manager needs

    {
      success: true,
      page_title: "Info for #{w.name}",
      message: "Route for show page still under construction",
      orders: w.orders
    }.to_json

  end 


  # later: 
  # or get the waiters for a menu item

  # get the menu items for a waiter:
  get '/:id/menuitems' do
    w = Waiter.find params[:id]
    # binding.pry
    # "check yr terminal"
    {
      success: true,
      page_title: "Menu items for #{w.name}",
      items: w.menuitems
    }.to_json
  end

  # now you could answer, for example the question: how many omelettes is Samat waiting on?
  # what other questions could you answer?
  # might you send over tons of data to the front end and have them parse it?
  # or might you do a lot of the work, and have really specific routes, and lessen 
  # the data-crunching load on your front end developers?
  get '/:waiter_id/:menuitem_id' do
    w = Waiter.find params[:waiter_id]
    binding.pry
    w.menuitems.where(id: params[:menuitem_id])
    "check yr terminal"
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
    updated_waiter = @waiter.to_json
    {
      success: true,
      message: "Updated info for waiter no. #{@waiter.id}: #{@waiter.name}",
      updated_waiter: updated_waiter
    }.to_json
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