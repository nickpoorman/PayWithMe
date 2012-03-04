class User
  include Mongoid::Document
  field :email, :type => String
  field :crypted_password, :type => String
  field :salt, :type => String

  authenticates_with_sorcery!

  attr_accessible :email, :password, :password_confirmation

  validates_length_of :password, :minimum => 3, :message => "password must be at least 5 characters long", :if => :password
  validates_confirmation_of :password, :message => "should match confirmation", :if => :password
  validates_presence_of :email
  validates_uniqueness_of :email

  def self.search(search)
    if !search.blank?
      User.where(:email => /#{search}/i)
    else
      []
    end
  end
end
