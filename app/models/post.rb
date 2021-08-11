class Post < ApplicationRecord
    validates :shopname, presence: true, length: { maximum: 20 }
    validates :shopaddress, presence: true, length: { maximum: 30 }
    validates :shopcontent, presence: true, length: { maximum: 300 }
end