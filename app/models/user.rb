require 'bcrypt'

class User < ApplicationRecord
  include BCrypt
  has_one_attached :avatar

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
