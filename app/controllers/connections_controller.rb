class ConnectionsController < ApplicationController
  skip_before_action :require_login, only: [:index, :create, :delete]

  # GET /connections
  def index
    connections = Connection.all
 
    render json: connections
  end

  # POST /connections
  def create
    connection = Connection.new(connection_params)
    followed_user = User.find_by(id: connection.followed_id)

    if connection.save
      render json: {connection: connection, user: followed_user, message: 'You have successfully followed!'}
      # render json: connection, status: :created, location: connection
    else
      render json: connection.errors, status: :unprocessable_entity
    end
  end

  # DELETE /delete_connection
  def delete
    connection = Connection.find_by(followed_id: connection_params[:followed_id], follower_id: connection_params[:follower_id])
    connection.destroy
    render json: {unfollowed_id: connection_params[:followed_id], message: 'You have successfully unfollowed!'}
  end

  private
    # Only allow a list of trusted parameters through.
    def connection_params
      params.require(:connection).permit(:followed_id, :follower_id)
    end
end
