
class UsersController < ApplicationController
  
  def show
    @user =  User.find(params[:id])
    # debugger works with gem byebug. Es un poderoso método para localización de errores
    # puts y @user.attributes
    #   debugger

  end

  def new
    @user = User.new
  end
  
  # The user create action with a save and a redirect
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
      # next line works the same way that before line (redirect_to @user)
      # redirect_to user_url(@user)
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
  
end
