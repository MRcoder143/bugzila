class Api::V1::BugsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @bugs = Bug.all
    respond_to do |format|
      format.json { render json: @bugs.to_json, status: :ok }
    end
  end

  def show
    @bug = Bug.find(params[:id])
    respond_to do |format|
      format.json { render json: @bug.to_json, status: :ok }
    end
  end

  def create
    @bug = Bug.create(bug_params)
    if @bug.save
      respond_to do |format|
        format.json { render json: @bug.to_json, status: :created }
      end
    else
      respond_to do |format|
        format.json { render json: { errors: @bug.errors.full_messages }, status: :unprocessable_entity }
      end
    end
  end

  def update
    @bug = Bug.find(params[:id])
    if @bug.update(bug_params)
      respond_to do |format|
        format.json { render json: @bug.to_json, status: :ok }
      end
    else
      respond_to do |format|
        format.json { render json: { errors: @bug.errors.full_messages }, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @bug = Bug.find(params[:id])
    if @bug.destroy
      respond_to do |format|
        format.json { render json: @bug.to_json, status: :ok }
      end
    else
      respond_to do |format|
        format.json { render json: { errors: @bug.errors.full_messages }, status: :unprocessable_entity }
      end
    end
  end

  private

  def bug_params
    params.require(:bug).permit(:title, :deadline, :screenshot, :bugtype, :status, :project_id, :user_id, :resolver_id)
  end
end
