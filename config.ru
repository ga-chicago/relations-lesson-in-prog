require 'sinatra/base'
require 'sinatra/activerecord'

require './models/WaiterModel'
require './models/MenuitemModel'

require './controllers/ApplicationController'
require './controllers/WaiterController'
require './controllers/MenuitemController'

map ('/') {
  run ApplicationController
}
map ('/waiters') {
  run WaiterController
}
map ('/menuitems') {
  run MenuitemController
}