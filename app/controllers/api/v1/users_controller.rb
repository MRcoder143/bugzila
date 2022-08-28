class Api::V1::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  # before_action :authenticate_request

  def index
    @users = User.all
    respond_to do |format|
      format.json { render json: @users.to_json, status: :ok }
    end
  end

  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.json { render json: @user.to_json, status: :ok }
    end
  end

  def create
    @user = User.create(user_params)
    if @user.save
      respond_to do |format|
        format.json { render json: @user.to_json, status: :created }
      end
    else
      respond_to do |format|
        format.json { render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity }
      end
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      respond_to do |format|
        format.json { render json: @user.to_json, status: :ok}
      end
    else
      respond_to do |format|
        format.json { render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      respond_to do |format|
        format.json { render json: @user.to_json, status: :ok}
      end
    else
      respond_to do |format|
        format.json { render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :usertype)
  end
end
