class MpesaController < ApplicationController
    def create
        mpesa_express(1,254798450464)
        render json: {message: "hit"}
    end
end
