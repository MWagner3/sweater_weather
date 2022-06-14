class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  has_secure_password

  after_create :gen_api_key

    def gen_api_key
        self.api_key = SecureRandom.hex(50)
        self.save
    end
end
