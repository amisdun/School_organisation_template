class Admin
  include Mongoid::Document
  include Mongoid::Persistable
  include Mongoid::Timestamps
  field :username, type: String
  field :password, type: String
end
