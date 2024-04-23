class User < ApplicationRecord
    has_many :posts
    validates :name, presence: { message: "Name can't be null" }
    validates :email, presence: { message: "Email can't be null" }, uniqueness: { message: "Email already in use" }, format: { with: URI::MailTo::EMAIL_REGEXP, message: "Invalid email format" }
    validates :password, presence: { message: "Password can't be null" }, length: { minimum: 6, message: "Password must be longer than 6 characters." }
  end
  