class User < ActiveRecord::Base
  has_many :locations

  attr_accessor :password
  before_save :encrypt_password

  validates_presence_of :password, :email
  validates_confirmation_of :password, :on => :create
  validates_uniqueness_of :email

  class << self
    def authenticate(name,password)
      user = find_by_name(name)
      if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
        user
      else
        nil 
      end
    end
  end

  private

    def encrypt_password
      if password.present?
        self.password_salt = BCrypt::Engine.generate_salt
        self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
      end
    end
end
# == Schema Information
#
# Table name: users
#
#  id            :integer(4)      not null, primary key
#  name          :string(255)
#  email         :string(255)
#  password_hash :string(255)
#  password_salt :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

