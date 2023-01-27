class MpesaController < ApplicationController
    def create
        mpesa_express(1,params[:phone])
        render json: {message: "hit"}
    end
end
