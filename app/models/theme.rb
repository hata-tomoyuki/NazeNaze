class Theme < ApplicationRecord
  validates :title, presence: true
  belongs_to :user
  has_many :posts, dependent: :destroy
  has_many :summeries, dependent: :destroy
end
