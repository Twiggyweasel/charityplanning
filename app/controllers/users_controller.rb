class UsersController < ApplicationController
  
  def new
    @user = User.new
    @user.build_profile
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
      params.required(:user).permit(:email, :password, :profile_id,  profile_attributes: [:id, :first_name, :last_name])
    end
end