require 'sinatra/base'
require 'sinatra/activerecord'

require './controllers/ApplicationController.rb'

map ('/') {
  run ApplicationController
}