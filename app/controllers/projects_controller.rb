class ProjectsController < ApplicationController
  before_filter :authenticate_admin!, except: [:index, :show]

  def new
    @category = Category.find(params[:category_id])
    @project = @category.projects.new
  end

  def create
    @category = Category.find(params[:category_id])
    @project = @category.projects.new(project_params)
    if @project.save
      flash[:notice] = "Project successfully added!"
      redirect_to category_path(@project.category)
    else
      render :new
    end
  end

  def show
    @category = Category.find(params[:category_id])
    @project = Project.find(params[:id])
  end

  def edit
    @category = Category.find(params[:category_id])
    @project = Project.find(params[:id])
  end

  def update
    @category = Category.find(params[:category_id])
    @project = Project.find(params[:id])
    if @project.update(project_params)
      flash[:notice] = "Project successfully edited!"
      redirect_to category_path(@project.category)
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:category_id])
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to category_path(@category)
    flash[:notice] = "Project successfully deleted!"
  end

  private
  def project_params
    params.require(:project).permit(:name, :description, :link)
  end

end
