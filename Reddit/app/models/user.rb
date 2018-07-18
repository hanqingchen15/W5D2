class User < ApplicationRecord
  validates :username, :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :password, length: {minimum: 6, allow_nil: true}
  
  has_many :mod_subs,
    foreign_key: :moderator_id,
    class_name: :Sub
    
  has_many :posts,
    foreign_key: :author_id,
    class_name: :Post
  
  attr_reader :password
  after_initialize :ensure_session_token
  
  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
  
  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64
    self.save!
    self.session_token
  end
  
  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return user if user && user.valid_password?(password)
    nil
  end
  
  def valid_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end
  
  private
  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64
  end
end