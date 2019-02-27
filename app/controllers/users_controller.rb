# frozen_string_literal: true

# This class has the function of displaying the name of the account
# and the date and time the account reserved
class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @time_frames = TimeFrame.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if params[:type] == 'financial_planner'
      @user.build_financial_planner(@user_id)
    elsif params[:type] == 'client'
      @user.build_client(@user_id)
    end
    if @user.save
      log_in @user
      redirect_to @user, flash: { success: 'Welcome!' }
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email,
                                 :password, :password_confirmation)
  end
end
