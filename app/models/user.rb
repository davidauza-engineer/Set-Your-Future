class User < ApplicationRecord
  before_save do
    email.downcase!
  end

  validates :username, length: { minimum: 2, maximum: 50 },
                       presence: true,
                       uniqueness: { case_sensitive: false }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  validates :email, format: { with: VALID_EMAIL_REGEX },
                    length: { minimum: 5, maximum: 50 },
                    presence: true,
                    uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true,
                       length: { minimum: 6, maximum: 72 }, on: :create
end
