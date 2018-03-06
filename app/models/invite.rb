class Invite
  attr_accessor :id, :sender_id, :message, :recipient, :status

  def initialize(input_hash)
    @id = input_hash["id"]
    @sender_id = input_hash["sender_id"]
    @message = input_hash["message"]
    @recipient = input_hash["recipient"]
    @status = input_hash["status"]
 end

 def self.find(id)
  invite_hash = Unirest.get("http://localhost:3000/api/v1/invites/#{id}.json").body
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