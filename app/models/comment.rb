class Comment < ApplicationRecord
  validates :content, presence: true, length: { maximum: 200 }
  validates :username, presence: true, length: { maximum: 50 }
  belongs_to :user, optional: true
  belongs_to :post, optional: true
end
