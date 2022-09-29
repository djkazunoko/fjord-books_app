class Report < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable

  validates :user_id, presence: true
  validates :title, presence: true
  validates :content, presence: true
end
