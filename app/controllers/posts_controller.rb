class PostsController < ApplicationController
    before_action :set_post, only: [:show, :update, :destroy]
  skip_before_action :require_login, only: [:index, :create, :destroy]

  # GET /posts
  def index
    posts = Post.all
 
    render json: posts, include: :user
  end

  # POST /posts
  def create
    post = Post.new(post_params)

    if post.save
      render json: post
      # render json: connection, status: :created, location: connection
    else
      render json: post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /posts/:id
  def destroy
    @post.destroy
    render json: {message: 'You have successfully deleted your post!'}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:user_id, :content)
    end
end
