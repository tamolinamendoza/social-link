require 'net/http'
require 'json'

def shorten_link(query)
  query = URI.encode(query).gsub("&", "%26")
  request = "https://api-ssl.bitly.com/v3/shorten?access_token=af29a966d67ee353579d6f41ab250f1cb8b52d09&longUrl=#{query}"
  uri = URI(request)
  response = Net::HTTP.get(uri)
  oldresponse = response
  response = JSON.parse(response)

  shortlink = response["data"]["url"]
  return shortlink
end
