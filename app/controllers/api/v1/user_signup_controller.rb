require 'jwt'
require 'bcrypt'
class Api::V1::UserSignupController < ApplicationController
  def create

    admin_token = request.headers['Authorization']

    admin_token = admin_token.split(' ').last

    if admin_token

      decoded_token = JWT.decode admin_token, Rails.application.secrets.secret_key_base, true , {algorithm: 'HS256'}

      admin = Admin.where({:_id => decoded_token[:user_id]).first

      if admin 

        user = User.where({:email => params[:email]}).first

        if user

          return render json: {res: "Email already exist"}, status: :unprocessable_entity
    
        else
          password_hash = BCrypt::Password.create(params[:password])
    
          new_user =  User.new({
                      :email => params[:email],
                      :password => password_hash,
                      :category_name => params[:category_name]
                    })
    
          if new_user.save

            return render json: {res: "created"}, status: :created
          end
    
        end
      else

        return render json: {res: "Unauthorized"}, status: :unauthorized
      end
    else

      return render json: {res: "provide user token in header"}, status: :unauthorized
    end

    
  end
end
