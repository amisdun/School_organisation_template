class AdmissionCategory
  include Mongoid::Document
  include Mongoid::Persistable
  include Mongoid::Timestamps
  field :category_name, type: String

  embeds_many :AdmissionLetter
end
