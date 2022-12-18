require "base64"
require "excon"
require "json"

def access_token
    begin
      consumer_key="5yuVA94TgM5h7p7CqvTzJ28AtHDEBBx8"
      consumer_secret="om9X1Fuik7uQK6ZF"
      
      enc=Base64.strict_encode64("#{consumer_key}:#{consumer_secret}")

      url="https://sandbox.safaricom.co.ke/oauth/v1/generate?grant_type=client_credentials"

      response=Excon.get(url,:headers=>{"Authorization": "Basic #{enc}"})

      # puts response.status
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