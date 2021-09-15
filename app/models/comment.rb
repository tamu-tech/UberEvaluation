class Comment < ApplicationRecord
  validates :content, presence: true, length: { maximum: 200 }
  belongs_to :user, optional: true
  belongs_to :post, optional: true
end
