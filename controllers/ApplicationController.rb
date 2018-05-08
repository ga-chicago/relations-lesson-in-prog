class ApplicationController < Sinatra::Base

  require 'bundler'
  Bundler.require()

  get '/' do
    {
      success: false,
      message: "Please consult the API documentation"
    }.to_json
  end

  not_found do
    halt 404
  end

end