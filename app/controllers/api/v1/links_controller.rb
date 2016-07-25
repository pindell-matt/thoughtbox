class Api::V1::LinksController < Api::ApiController
  respond_to :json, :html

  def update
    @link = Link.find(params[:id])
    @link.flip_status
    respond_with @link
  end

  def index
    respond_with Link.where(user_id: @current_user.id)
  end
end
