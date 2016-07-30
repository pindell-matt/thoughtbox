class LinksController < ApplicationController

  def index
    @link = current_user.links.new
    @links = current_user.links
  end

  def create
    @link = Link.new(link_params)
    @link.user_id = current_user.id
    if @link.save
      redirect_to links_path
    else
      flash.now[:error] = @link.errors[:url].first
      render :index
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    @link.update_attributes(link_params)
    redirect_to :links
  end

  private

    def link_params
      params.require(:link).permit(:title, :url)
    end

end
