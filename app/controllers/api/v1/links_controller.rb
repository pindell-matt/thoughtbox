class Api::V1::LinksController < Api::ApiController
  respond_to :json, :html

  def update
    @link = Link.find(params[:id])
    @link.flip_status
    respond_with @link
  end

  def index
    if current_user
      respond_with current_user.links
    else
      respond_with []
    end
    # @links = current_user.links
    # respond_with @links
    # respond_with current_user.links
    # respond_with Link.where(user_id: current_user.id)
  end
end
