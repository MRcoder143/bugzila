class BugsController < ApplicationController



  def index
    @bugs =Bug.paginate(page: params[:page], per_page: 10)
  end


  def show
    @bug = Bug.find(params[:id])
  end


  def new
    @bug = Bug.new
    @projects = Project.all

  end

  def live_search_data


    if params[:search].present?
      @projects = Project.where("title LIKE ?", "%" + params[:search] + "%")
      render json: @projects.map{|p| p.serializable_hash(only: [:id, :title]) }
    else
      render json: []
    end


  end

  def create
    @bug = Bug.create(bug_params)

    if @bug.save

      redirect_to @bug

    else

      redirect_to new_bugs_path

    end
  end


  def edit
    @bug = Bug.find(params[:id])
    @projects = Project.all
  end


  def update
    @bug = Bug.find(params[:id])
    if @bug.update(bug_params)
      redirect_to bugs_path
    else
      redirect_to edit_bug_path
    end
  end


  def destroy
    @bug = Bug.find(params[:id])
    Bug.destroy(@bug.id)
    redirect_to bugs_path
  end



  private
  def bug_params
    params.require(:bug).permit(:title,:deadline,:screenshot,:bugtype,:status,:project_id,:user_id,:resolver_id )

  end


end
