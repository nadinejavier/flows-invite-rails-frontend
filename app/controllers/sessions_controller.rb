class SessionsController < ApplicationController
  def new
    render 'new.html.erb'
  end

  def create
    response = Unirest.post(
      "http://localhost:3000/user_token",
      parameters: {
        auth: {
          email: params[:email],
          password: params[:password]
        }
      }
    )
    jwt = response.body["jwt"]
    Unirest.default_header("Authorization", "Bearer #{jwt}")
    users = Unirest.get("http://localhost:3000/api/v1/users").body
    users.each do |user|
       encrypted_password = BCrypt::Password.create(params[:password])
       if (user["email"] == params[:email])
         id = user["id"]
         flash[:success] = "Successfully logged in!"
         redirect_to "/users/#{id}"
       else
         flash[:danger] = "Something went wrong, try again!"
       end
    end
    # users.each do |user|
    #     if (user["email"] == params[:email]) && (user["password"] == params[:password])
    #       id = user["id"]
    #       puts id
    #       redirect_to "/users/#{id}"
    #     else
    #       flash[:danger] = "Invalid email or password"
    #     end
    # sessions[:user_id]
    # end
  end

  def destroy
    jwt = ""
    Unirest.clear_default_headers()
    puts "Logged out"
    flash[:info] = "Successfully Logged Out!"
    redirect_to "/"
  end

end



