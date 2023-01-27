require "base64"
require "excon"
require "json"

def access_token
    begin
      consumer_key="QXG84meTYW1PA4XnFJmWCOYf4qHZOJjo"
      consumer_secret="c5I1R3TwglBAcQeN"
      
      enc=Base64.strict_encode64("#{consumer_key}:#{consumer_secret}")

      url="https://sandbox.safaricom.co.ke/oauth/v1/generate?grant_type=client_credentials"
      puts enc
      response=Excon.get(url,:headers=>{
        "Authorization": "Basic #{enc}"})

      puts response.status
      # puts response.body
      data=JSON.parse(response.body)
      # p data
      # p response.body
      # p data["access_token"]
      return data["access_token"]
    rescue
      puts" error doing json parse"
      return nil
    end
end

# puts access_token