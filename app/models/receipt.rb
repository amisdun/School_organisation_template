class Receipt
  include Mongoid::Document
  include Mongoid::Timestamps
  field :student_name, type: String
  field :amount_in_words, type: String
  field :amount_in_numbers, type: BigNumber
  field :index_number, type: String
  field :date, type: String
  field :signature, type: String

  embedded_in :account_category
end
