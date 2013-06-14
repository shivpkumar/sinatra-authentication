class User < ActiveRecord::Base
  validates_uniqueness_of :name, :email
  validates_presence_of :name, :email, :password_hash

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end
  
  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(params)
    user = self.find_by_email(params[:email])
    user && (user.password == params[:password]) ? user : false
  end
end
