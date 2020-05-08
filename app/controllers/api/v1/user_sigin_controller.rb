class Api::V1::UserSiginController < ApplicationController
  def sigin

    user_sigin = User.where({:email => params[:email]}).first

    if user_sigin
      password_compare = BCrypt::Password.new(user_sigin.password)

      if password_compare = params[:password]
        
        exp = Time.now.to_i + 4 * 3600

        exp_payload = {user_id: user_sigin._id, category_name: user_sigin.category_name, exp: exp}

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
