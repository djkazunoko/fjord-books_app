class MicropostsController < ApplicationController
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
  end

  private

    def micropost_params
      params.require(:micropost).permit(:content)
    end
end
