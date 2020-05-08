require 'jwt'

class Api::V1::AdmissionLetterController < ApplicationController
  def index
    user_token = request.headers['Authorization']

    user_token = user_token.split(' ').last

    if user_token

      decoded_token = JWT.decode user_token, Rails.application.secrets.secret_key_base, true , {algorithm: 'HS256'}

      admision_template = AdmissionCategory.where({:category_name => decoded_token[:category_name]}).first

      if admision_template

        template = AdmissionCategory.all

        return render json: {data: template}, status: :ok

      else

        return render json: {res: "failed"}, status: :unauthorized
      end

    else
      return render json: {res: "failed", "Unauthorized Access"}, status: :unathorized
    end
  end

  def create

    user_token = request.headers['Authorization']

    user_token = user_token.split(' ').last

    if user_token

      decoded_token = JWT.decode user_token, Rails.application.secrets.secret_key_base, true , {algorithm: 'HS256'}

      admission_template = AdmissionCategory.where({:category_name => decoded_token[:category_name]}).first

      if admision_template

        new_admission_template = AdmissionCategory.AdmissionLetter.build({
          :email => params[:email],
          :student_name => params[:student_name],
          :phone_number => params[:phone_number],
          :student_address => params[:student_address],
          :program_name =. params[:program_name]
        })

        if new_admission_template.save
          return render json: {res: "created"}, status: :created
        end

      else

        return render json: {res: "failed", msg: "Unauthorized"}, status: :unathorized
      end
  end

  def show

    show_single_admission = AdmissionCategory.AdmissionLetter.find(params[:id])

    return render json: {res: "found"}, status: :ok
    
  end

  def update

    update_admission_letter = AdmissionCategory.AdmissionLetter.find(params[:id])

    if update_admission_letter.update_attributes({
                                  :email => params[:email],
                                  :student_name => params[:student_name],
                                  :phone_number => params[:phone_number],
                                  :student_address => params[:student_address],
                                  :program_name =. params[:program_name]
                                })
        return render json: {res: "updated"}, status: :ok

  end

  def destroy

    delete_admission_template = AdmissionCategory.AdmissionLetter.find(params[:id])

    delete_admission_template.destroy

    return render json: {res: "deleted"}, status: :ok

  end
end
