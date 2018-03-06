class User
  attr_accessor :id, :email, :password_digest
  def initialize(input_hash)
    @id = input_hash["id"]
    @email = input_hash["email"]
    @password_digest = input_hash["password_digest"]
  end

 def self.find(id)
  user_hash = Unirest.get("http://localhost:3000/api/v1/users/#{id}.json").body
  User.new(user_hash)
 end

 def self.all
  users = []
  users_array = Unirest.get("http://localhost:3000/api/v1/invites.json").body
  users_array.each do |user|
    users << User.new(user)
  end
 end

end