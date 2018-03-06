require 'json'
class UsersController < ApplicationController
  def new
  end

  def create
    new_user = Unirest.post("http://localhost:3000/api/v1/users",
      headers:{ 'Accept' => 'application/json' },
      parameters: {
      email: params[:email],
      password: params[:password]}
    ).body

    user = User.new(new_user)
    # puts user
    # if new_user["version"].to_i == 1
    #   session[:user_id] = user.id
    #   flash[:success] = 'Successfully created account!'
    #   redirect_to '/'
    # else
    #   flash[:warning] = 'Invalid email or password!'
    #   redirect_to '/'
    # end
    redirect_to user
  end

  def show
    user = User.find(params[:id])
    @user_data = Unirest.get("http://localhost:3000/api/v1/users/#{user.id}").body
    
      # headers:{'id' => @user.id },
    # if @user.id != current_user.id
    #   flash[:warning] = 'Access denied.'
    #   redirect_to '/login'
    # else
    #   render 'show'
    # end
  end

end
