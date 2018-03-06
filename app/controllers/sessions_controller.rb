class SessionsController < ApplicationController
  
  def new
    render 'new.html.erb'
  end

  def create
    user = Unirest.post("http://localhost:3000/api/v1/sessions",
      parameters: {
      email: params[:email],
      password: params[:password]}
    ).body
    @id = user["id"]
    session[:user_id] = @id
    flash[:success] = "Successfully logged in!"
    redirect_to "/users/#{user["id"]}"
  end

end



