class InvitesController < ApplicationController
  def index
    @invites = Invite.all
  end 

  def new
  end

  def create
      @invite = Unirest.post("http://localhost:3000/api/v1/invites",
      headers:{ 'Accept' => 'application/json' },
      parameters: {
      user_id: params[:id],
      message: params[:message],
      recipient: params[:recipient]}
    ).body
     @id = @invite["user_id"]
     redirect_to "/users/#{@id}"
  end

  def show
    @invite = Invite.find_by(params[:token])
  end
end
