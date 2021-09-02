class UsersController < ApplicationController
  skip_before_action :require_login
  
  # GET /users
  def index
    users = User.all

    render json: users, include: [:followers, :followed, :posts]
  end

  # POST /users
  def create
    user = User.create(user_params)
    if user.valid?
        payload = {user_id: user.id}
        token = encode_token(payload)
        render json: {user: user, jwt: token}
    else
        render json: {errors: user.errors.full_messages}, status: :not_acceptable
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:username, :firstName, :lastName, :company, :bio, :email, :password_digest, :picture, :password)
    end
end
