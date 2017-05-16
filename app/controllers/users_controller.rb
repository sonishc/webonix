class UsersController < ApplicationController
  layout "show_user", except: [:new, :create] #, except: [:signup :rss] виключення

  def show
    @user = User.find(params[:id])
  end

  def new
     @user = User.new
   end

  def create
     @user = User.new(user_params)
     if @user.save
       flash[:success] = "Реєстрація в системі Webonix проведена успішно"
       redirect_to @user
    else
      render 'new'
    end
  end
    private
      def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
      end
end
