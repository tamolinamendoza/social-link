require 'bundler'
Bundler.require
require_relative "models/model.rb"

class MyApp < Sinatra::Base

  get '/' do
    erb :index, :layout => :base
  end

  get "/themes" do
    erb :themes, :layout => :base
  end

  get "/inputs_blue" do
    erb :inputs_blue, :layout => :base
  end

  get "/inputs_red" do
    erb :inputs_red, :layout => :base
  end

  get "/inputs_black" do
    erb :inputs_black, :layout => :base
  end

  get "/inputs_brown" do
    erb :inputs_brown, :layout => :base
  end

  get "/result_blue" do
    @first_name = params[:first_name]
    @last_name = params[:last_name]
    @email = params[:email]
    @phone = params[:phone]
    @work = params[:work]
    @address = params[:address]
    @qr_code = shorten_link(request.base_url + request.fullpath)
    erb :result_blue, :layout => :base
  end

  get "/result_red" do
    @first_name = params[:first_name]
    @last_name = params[:last_name]
    @email = params[:email]
    @phone = params[:phone]
    @work = params[:work]
    @address = params[:address]
    @qr_code = shorten_link(request.base_url + request.fullpath)
    erb :result_red, :layout => :base
  end

  get "/result_black" do
    @first_name = params[:first_name]
    @last_name = params[:last_name]
    @email = params[:email]
    @phone = params[:phone]
    @work = params[:work]
    @address = params[:address]
    @qr_code = shorten_link(request.base_url + request.fullpath)
    erb :result_black, :layout => :base
  end

  get "/result_brown" do
    @first_name = params[:first_name]
    @last_name = params[:last_name]
    @email = params[:email]
    @phone = params[:phone]
    @work = params[:work]
    @address = params[:address]
    @qr_code = shorten_link(request.base_url + request.fullpath)
    erb :result_brown, :layout => :base
  end

  post "/send_message" do
    @client = Twilio::REST::Client.new('ACed3ed813257f8acedfce46a695216257','cb1dd832eda91ea39319fe6827f1650b')
    @client.messages.create(
      from: '+14342605034', # this is the Flatiron School's Twilio number
      to: params[:phonenumber],
      body: "#{params[:name]} has sent you a business card. Click here to view: #{params[:qrcode]}"
    )
  end
end
