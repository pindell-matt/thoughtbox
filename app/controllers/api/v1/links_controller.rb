class Api::V1::LinksController < Api::ApiController
  respond_to :json

  def update
    @link = Link.find(link_params[:id])
    respond_with @link.update_attributes({read: !@link.read})
  end

  def index
    respond_with Link.where(user_id: @current_user.id)
  end

  private
    def link_params
      params.permit('id')
    end
end
