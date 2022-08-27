class ProjectsController < ApplicationController
  load_and_authorize_resource

  def new
    @project = Project.new
    @all_users = User.all

    @project.user_projects.build

    #@project.user_projects.build.build_user
  end
  def create


    #  @user_id = session[:user_id]
    @project = Project.create(project_params)
    #UserProject.create(user_id:@user_id,project:@project)
    if @project.save
      redirect_to projects_path
    else
      redirect_to new_project_path
    end
  end

  def edit
    @project = Project.find(params[:id])

    @all_users = User.all

    @project.user_projects.build

  end
  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)

      redirect_to projects_path
    else
      redirect_to edit_project_path
    end
  end

  def show
    @project = Project.find(params[:id])


    #  @user_projects = UserProject.find(6)
  end

  def index

    @projects = Project.paginate(page: params[:page], per_page: 10)
  end

  def destroy


    @project = Project.find(params[:id] )
    @project.destroy

    redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit(:title, :user_id, :body, user_projects_attributes: [:id,:user_id,:_destroy])
  end

end
