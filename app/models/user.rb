class User < ApplicationRecord
    has_secure_password

    has_many :posts
    has_many :comments
    validates :name, presence: true, length: { maximum: 20 },uniqueness: true

end
