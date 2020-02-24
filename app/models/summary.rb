class Summary < ApplicationRecord
  validates :text, presence: true
  belongs_to :user
  belongs_to :theme
end
