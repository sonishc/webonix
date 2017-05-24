class ProjectsController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update, :show, :create, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user,     only: [:destroy, :new, :create]
  layout "show_new_project"#, except: [:signup :rss] виключення

  def show
    @project = current_user.projects.build if signed_in?
    @user = User.find(params[:id])
    @users = User.paginate(:page => params[:page], :per_page => 12)
    @projects = @user.projects.paginate(page: params[:page], :per_page => 5)
  end

  def new
    @user = User.new
    @project = Project.new
    @project = current_user.projects.build if signed_in?
    end

  def create
    #@project = current_user.owned_projects.build(project_params) for to do
    @project = Project.new(project_params)
    if @project.save
      flash[:success] = "Проект створено"
      redirect_to current_user
    else
      render 'static_pages/home'
  end
end

  def destroy
    @user = User.find(params[:user_id])
    #@project = Project.find(params[:id]).destroy
    @project = Project.find(params[:id]).destroy
    flash[:success] = "Проект користувача видалений."

      respond_to do |format|
        format.html { redirect_to current_user }
        format.xml  { head :ok }
  end
end

  private
    def project_params
      params.require(:project).permit(:name, :description, :dead_line, :user_id)
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
    # Before filters

    def signed_in_user
      redirect_to signin_url, notice: "Будь ласка увійдіть в систему." unless signed_in?
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@project)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
