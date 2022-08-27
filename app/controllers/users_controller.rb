class UsersController < ApplicationController


  def index
    @user = User.paginate(page: params[:page], per_page: 10)
    end
def show
  @user = User.find(params[:id])
end
    def new
      @user = User.new
    end
  def create
    @user = User.create(user_params)

    if @user.save
  redirect_to root_path
    else
  render :new, status: :unprocessable_entity
  end
  end
    def edit
@user = User.find(params[:id])
    end
    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
redirect_to users_path
      else
redirect_to edit_user_path
      end
    end
def destroy
  @user = User.find(params[:id])
  User.destroy(@user.id)
  redirect_to users_path
end

private
    def user_params
      params.require(:user).permit(:name,:email,:password,:usertype)

    end
end
