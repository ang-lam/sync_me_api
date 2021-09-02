class UsersController < ApplicationController
  skip_before_action :require_login
  before_action :set_user, only: [:show, :update, :destroy]
  
  # GET /users
  def index
    users = User.all

    render json: users, include: [:followers, :followed, :posts]
  end

  # GET /users/1
  def show
    render json: @user
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

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:username, :firstName, :lastName, :company, :bio, :email, :password_digest, :picture, :password)
    end
end
