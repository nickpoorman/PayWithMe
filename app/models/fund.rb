class Fund
  include Mongoid::Document
  field :description, :type => String
  field :amount, :type => Integer
  field :number_of_people, :type => Float

  has_many :transactions
  belongs_to :user

  validates_presence_of :description
  validates_presence_of :amount

  def single_amount
    (amount / number_of_people).to_s
  end
end
