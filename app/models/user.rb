class User < ActiveRecord::Base
  has_secure_password
  
  before_save { self.email = email.downcase }
  before_create :create_remember_token

  validates :username, presence: true, 
                       length: { maximum: 20 },
                       uniqueness: { case_sensitive: false }  
  validates :email, presence: true,
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
            uniqueness: { case_sensitive: false }
  validates :password, presence: true,
            length: { minimum: 6 }
  validates :height_feet, numericality: { greater_than: 2, less_than: 8 }
  validates :height_inches, numericality: { greater_than_or_equal_to: 0,
                                            less_than: 12 }
  validates :weight, numericality: { greater_than: 50,
                                            less_than: 800 }

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
