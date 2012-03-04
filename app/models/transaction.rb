class Transaction
  include Mongoid::Document
  field :paid, :type => Date

  belongs_to :fund
  belongs_to :user
end
