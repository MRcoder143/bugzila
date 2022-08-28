class Api::V1::ProjectsController < ApplicationController
  skip_before_action :verify_authenticity_token
# before_action :authenticate_request

  def index
    @projects = Project.all
    respond_to do |format|
      format.json {render json: @projects.to_json, status: :ok}
    end
  end

  def show
    @project = Project.find(params[:id])
    # render json: @project , status:200
    respond_to do |format|
      format.json {render json: @project.to_json, status: :ok}
    end
  end

  def create
    @project = Project.create(project_params)
    if @project.save
    respond_to do |format|
      format.json {render json: @project.to_json, status: :created}
      end
    else
      respond_to do |format|
        format.json {render json: {errors: @project.errors.full_messages} , status: :unprocessable_entity}
        end
    end
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      respond_to do |format|
        format.json {render json: @project.to_json , status: :ok}
      end
    else
      respond_to do |format|
        format.json {render json: {errors: @project.errors.full_messages} , status: :unprocessable_entity}
        end
    end
  end

  def destroy
    @project = Project.find(params[:id])
    if @project.destroy
      respond_to do |format|
        format.json {render json: @project.to_json,status: :ok}
      end
    else
      respond_to do |format|
        format.json {render json: {errors: @project.errors.full_messages} , status: :unprocessable_entity}
        end
    end
  end


  private
  # def project_params
  #   params.require(:project).permit(:title, :body, :user_id)
  # end

  def project_params
    params.require(:project).permit(:title, :user_id, :body, user_projects_attributes: [:id,:user_id,:_destroy])
  end

end
