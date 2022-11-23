class User < ApplicationRecord

  has_secure_password
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { in: 4..20 }
  before_save { email.downcase! }

  def authenticate_with_credentials(email, password)
    email = email.strip
    email = email.downcase
    user = this.find_by_email(email)
    if user && user.authenticate(password)
      return user
    else
      return nil
    end
  end 
end
