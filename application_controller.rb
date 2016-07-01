require 'bundler'
Bundler.require
require_relative "models/model.rb"

class MyApp < Sinatra::Base

  get '/' do
    erb :index, :layout => :base
  end

  get "/inputs" do
    erb :inputs, :layout => :base
  end

  get "/result" do
    @first_name = params[:first_name]
    @last_name = params[:last_name]
    @email = params[:email]
    @phone = params[:phone]
    @work = params[:work]
    @address = params[:address]
    @qr_code = shorten_link(request.base_url + request.fullpath)
    erb :result, :layout => :base
  end

end
