require 'jwt'
require 'bcrypt'
module Api
    module V1
        class AdminSiginController < ApplicationController
            def create
                admin_sigin = Admin.where({:username => params[:username]}).first

                if admin_sigin

                    password_compare = BCrypt::Password.new(admin_sigin.password)

                    if password_compare == params[:password]

                        exp = Time.now.to_i + 4 * 3600

                        exp_payload = { user_id: admin_sigin._id, exp: exp}

                        token = JWT.encode exp_payload, Rails.application.secrets.secret_key_base, "HS256"

                       return render json: {res: "success", token: token}, status: :ok
                    else 

                       return render json: {res: "failed", msg: "Invalid credentials"}, status: :unprocessable_entity
                    end
                else
                    
                   return render json: {res: "failed", msg: "Invalid credentials"}, status: :unprocessable_entity
                end
            end
        end
    end
end
