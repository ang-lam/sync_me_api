class PostsController < ApplicationController
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
      render json: post, include: :user
      # render json: connection, status: :created, location: connection
    else
      render json: post.errors, status: :unprocessable_entity
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:user_id, :content)
    end
end
