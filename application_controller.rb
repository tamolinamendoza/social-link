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

  post "/send_message" do
    @client = Twilio::REST::Client.new('ACed3ed813257f8acedfce46a695216257','cb1dd832eda91ea39319fe6827f1650b')
    @client.messages.create(
      from: '+14342605034', # this is the Flatiron School's Twilio number
      to: params[:phonenumber],
      body: "#{params[:name]} has sent you a business card. Click here to view: #{params[:qrcode]}"
    )
  end
end
