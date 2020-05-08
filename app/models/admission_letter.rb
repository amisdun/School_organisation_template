class AdmissionLetter
  include Mongoid::Document
  include Mongoid::Persistable
  include Mongoid::Persistable
  include Mongoid::Timestamps
  field :student_name, type: String
  field :email, type: String
  field :phone_number, type: BigNumber
  field :student_address, type: String
  field :program_name, type: String

  embedded_in :AdmissionCategory
end
