class User < ApplicationRecord
  #(1)
  attr_accessor :remember_token
  # este es un callback, que convierte el correo de usuario a minúsculas antes de salvarlo en la db 
  before_save {self.email = email.downcase}	
	# is a hash {presence: true, length: { maximum: 50 }}
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  
  # class << self
    # Returns the hash digest of the given string.
    def User.digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                    BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end
    
    # Returns a random token (Added on chapter 9).
    def User.new_token
      SecureRandom.urlsafe_base64
    end
  # end

  #(1) Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # Forgets a user (listing 9.11).
  def forget
    update_attribute(:remember_digest, nil)
  end

end


 