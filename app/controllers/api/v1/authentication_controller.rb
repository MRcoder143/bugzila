class Api::V1::AuthenticationController < Api::V1::ApplicationController
  # skip_before_action :authenticate_request
  #
  #
  # def login
  #   @user = User.find_by_email(params[:email])
  #   if @user
  #     token = jwt_encode(user_id: @user_id.id)
  #     render json: {token: token}, status: :ok
  #   else
  #     render json: {error: 'unauthorized'}, status: :unauthorized
  #   end
  # end
end
