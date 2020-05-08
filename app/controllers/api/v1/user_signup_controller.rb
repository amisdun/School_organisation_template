class Api::V1::UserSignupController < ApplicationController
  def create
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
  end
end
