require "base64"
require "excon"
require "json"

def access_token
    begin
      consumer_key="KHANz5lc8hSHZLLJWHd82UE9jMn65WdD"
      consumer_secret="VMp0VOUdsAzxrFoj"

      enc=Base64.strict_encode64("#{consumer_key}:#{consumer_secret}")

      # puts enc
      url="https://sandbox.safaricom.co.ke/oauth/v1/generate?grant_type=client_credentials"

    # Given wrong key and secret for encoding base64
      response=Excon.get(url,:headers=>{"Authorization": "Basic cFJZcjZ6anEwaThMMXp6d1FETUxwWkIzeVBDa2hNc2M6UmYyMkJmWm9nMHFRR2xWOQ=="})

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