class UsersController < ApplicationController
  # before_action :authenticate_user!, only: [:show]
  def index
    @users = User.all
  end

  def new
  end

  def create
    @new_user = Unirest.post("http://localhost:3000/api/v1/users",
      headers:{ 'Accept' => 'application/json' },
      parameters: {
      email: params[:email],
      password: params[:password]}
    ).body
    @id = @new_user["id"]
    redirect_to "/users/#{@id}"

  end

  def show
     @user = User.find(params[:id])    
  end

end
