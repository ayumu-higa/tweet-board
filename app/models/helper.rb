class Helper < ApplicationRecord
  validates :content, presence: true, length: { maximum: 255}
  validates :status, presence: true, length: {maximum: 15}
  belongs_to :user
end
