class User < ApplicationRecord
<<<<<<< HEAD
  attr_accessor :remember_token
  before_save { self.email = email.downcase }
=======
>>>>>>> d810a459bf60867128d482325070112554ad159a
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
<<<<<<< HEAD
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  # Returns the hash digest of the given string.
  def User.digest(string)
=======
                    uniqueness: true
  has_secure_password
  validates :password, presence: true, length: { minimum: 8 }
	def User.digest(string)
>>>>>>> d810a459bf60867128d482325070112554ad159a
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

<<<<<<< HEAD
  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
def forget
    update_attribute(:remember_digest, nil)
  end
end
=======
end

>>>>>>> d810a459bf60867128d482325070112554ad159a
