class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create 
      @user = User.new(user_params)
      if @user.save
          #do something
          flash[:success] = "Your account has been created successfully!"
          session[:user_id] = @user.id
          redirect_to events_path
      else
          render 'new'
      end       
  end

  
  private 
  
    def user_params
      params.required(:user).permit(:email, :password)
    end
end