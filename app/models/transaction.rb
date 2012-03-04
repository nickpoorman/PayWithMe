class Transaction
  include Mongoid::Document
  field :paid, :type => Date
  field :amount, :type => Integer

  belongs_to :fund
  belongs_to :user
end
