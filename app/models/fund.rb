class Fund
  include Mongoid::Document
  field :description, :type => String
  field :amount, :type => Integer

  has_many :transactions
  belongs_to :user

  validates_presence_of :description
  validates_presence_of :amount
end
