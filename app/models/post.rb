class Post < ApplicationRecord
  validates :text, presence: true
  belongs_to :theme
  belongs_to :user
  has_one :important, dependent: :destroy
end
