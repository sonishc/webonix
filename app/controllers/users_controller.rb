class UsersController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update, :show, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user,     only: :destroy
  layout "show_user", except: [:new, :create] #, except: [:signup :rss] виключення

  def index
  end

  def show
    @user = User.find(params[:id])
    @users = User.paginate(:page => params[:page], :per_page => 5)
    @projects = @user.projects.paginate(page: params[:page], :per_page => 5)
  end


  def new
     @user = User.new
   end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Профіль оновлено"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def create
     @user = User.new(user_params)
     if @user.save
       sign_in @user
       flash[:success] = "Реєстрація в системі Webonix проведена успішно"
       redirect_to @user
    else
      render 'new'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Користувач видалений."
    redirect_to current_user
  end

    private
      def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
      end
      # Before filters

      def signed_in_user
        redirect_to signin_url, notice: "Будь ласка увійдіть в систему." unless signed_in?
      end

      def correct_user
        @user = User.find(params[:id])
        redirect_to(root_url) unless current_user?(@user)
      end

      def admin_user
        redirect_to(root_url) unless current_user.admin?
      end
end
