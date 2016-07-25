class LinksController < ApplicationController

  def index
    @link = Link.new
    @links = Link.where(user_id: @current_user.id)
  end

  def create
    @link = Link.new(link_params)
    @link.user_id = @current_user.id
    if @link.save
      redirect_to links_path
    else
      render :index
    end
  end

  private

    def link_params
      params.require(:link).permit(:title, :url)
    end

end
