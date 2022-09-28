# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.with_attached_avatar.order(:id).page(params[:page])
    @micropost = current_user.microposts.build
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.order(:id).page(params[:page])
  end
end
