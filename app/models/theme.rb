class Theme < ApplicationRecord
  validates :title, presence: true
  belongs_to :user
  has_many :posts, dependent: :destroy
  has_one :summary, dependent: :destroy
end
