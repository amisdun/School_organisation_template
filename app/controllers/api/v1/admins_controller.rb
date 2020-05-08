require 'bcrypt'
module Api
    module V1
        class AdminsController < ApplicationController
            def create

                admin = Admin.where({:username => params[:username]}).first
                
                if admin
                    
                  return  render json: {res: "exist", msg: "Username already in use", data: admin}, status: :unprocessable_entity
                else 

                    password_hash = BCrypt::Password.create(params[:password])

                    new_admin = Admin.new({
                        :username => params[:username],
                        :password => password_hash
                    })

                    if new_admin.save

                       return render json: {res: "created"}, status: :created
                    end
                end

            end
        end
    end
end
