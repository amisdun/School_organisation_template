require 'jwt'
class Api::V1::ReceiptController < ApplicationController
  def index
    user_token = request.headers['Authorization']

    user_token = user_token.split(' ').last

    if user_token

      decoded_token = JWT.decode user_token, Rails.application.secrets.secret_key_base, true , {algorithm: 'HS256'}

      admision_template = AccountCategory.where({:category_name => decoded_token[:category_name]}).first

      if admision_template

        template = AccountCategory.all

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

      receipt_template = AccountCategory.where({:category_name => decoded_token[:category_name]}).first

      if receipt_template

        new_receipt_template = AccountCategory.Receipt.build({
          :student_name => params[:student_name],
          :amount_in_words => params[:amount_in_words],
          :amount_in_numbers => params[:amount_in_words],
          :index_number => params[:index_number],
          :date => params[:date]
        })

        if new_receipt_template.save
          return render json: {res: "created"}, status: :created
        end

      else

        return render json: {res: "failed", msg: "Unauthorized"}, status: :unathorized
      end
  end

  def show

    show_single_receipt = AccountCategory.Receipt.find(params[:id])

    return render json: {res: "found"}, status: :ok
    
  end

  def update

    update_receipt = AccountCategory.Receipt.find(params[:id])

    if update_receipt.update_attributes({
                              :student_name => params[:student_name],
                              :amount_in_words => params[:amount_in_words],
                              :amount_in_numbers => params[:amount_in_words],
                              :index_number => params[:index_number],
                              :date => params[:date]
                                })
        return render json: {res: "updated"}, status: :ok

  end

  def destroy

    delete_receipt_template = AccountCategory.Receipt.find(params[:id])

    delete_receipt_template.destroy

    return render json: {res: "deleted"}, status: :ok

  end
end
