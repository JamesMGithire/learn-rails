require "base64"
require "excon"
require "json"

require_relative "./mpesa_time"
require_relative "./auth"


def mpesa_express(amount=1,phone)
    paybill=174379

    t=mpesa_time

    pass_key="bfb279f9aa9bdbcf158e97dd71a467cd2e0c893059b10f78e6b72ada1ed2c919"

    password=Base64.strict_encode64("#{paybill}#{pass_key}#{t}")

    data={
      "BusinessShortCode": paybill,
      "Password": password,
      "Timestamp": t,
      "TransactionType": "CustomerPayBillOnline",
      "Amount": amount,
      "PartyA": phone,
      "PartyB": paybill,
      "PhoneNumber": phone,
      "CallBackURL": "https://mydomain.com/path",
      "AccountReference": "CoversLTD",
      "TransactionDesc": "Payment of X" 
    }

    url="https://sandbox.safaricom.co.ke/mpesa/stkpush/v1/processrequest"






    data[:Password]=password

    # puts data

    token=access_token


    response=Excon.post(url,:body=>JSON.generate(data),headers:{'Content-Type': 'application/json','Authorization': "Bearer #{token}"})
    data=JSON.parse(response.body)
    return data
end


# puts response.status
# puts response.body

mpesa_express(1,254798450464)
