# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.with_attached_avatar.order(:id).page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def followings
    @title = t('views.follow.show_follow.followings')
    @user  = User.find(params[:id])
    @users = @user.followings.order(:id)
    render 'friendships'
  end

  def followers
    @title = t('views.follow.show_follow.followers')
    @user  = User.find(params[:id])
    @users = @user.followers.order(:id)
    render 'friendships'
  end
end
