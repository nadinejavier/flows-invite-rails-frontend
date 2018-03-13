class Invite
  attr_accessor :id, :user_id, :message, :recipient, :status, :token, :user

  def initialize(input_hash)
    @id = input_hash["id"]
    @user_id = input_hash["user_id"]
    @message = input_hash["message"]
    @recipient = input_hash["recipient"]
    @status = input_hash["status"]
    @token = input_hash["token"]
    @user = input_hash["user"]
 end



 def self.find_by(token)
  invite_hash = Unirest.get("http://localhost:3000/api/v1/invites/#{token}.json").body
  Invite.new(invite_hash)
end

 def self.all
  invites = []
  invites_array = Unirest.get("http://localhost:3000/api/v1/invites.json").body
  invites_array.each do |invites_array|
    invites << Invite.new(invites_array)
  end
 end
 
end