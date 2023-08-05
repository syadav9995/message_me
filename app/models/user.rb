class User < ApplicationRecord
	validates :user_name, presence: true, uniqueness: true, length: { minimum: 3, maximum: 20}
	has_many :messages
	has_secure_password
end
