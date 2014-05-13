class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all
    logger.debug "Here is current_user.class: " + current_user.class.to_s
    logger.debug current_user.class
  end

  def show
    @user = User.find(params[:id])
  end

end
