class MicropostsController < ApplicationController
  before_action :correct_user, only: :destroy

  def index
    @microposts = Micropost.all
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      redirect_to user_path(current_user)
    else
      @microposts = Micropost.all
      render 'microposts/index'
    end
  end

  def destroy
    @micropost.destroy
    redirect_to request.referrer || root_url
  end

  private

    def micropost_params
      params.require(:micropost).permit(:content)
    end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end
end
