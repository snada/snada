class Post < ActiveRecord::Base
  include FriendlyId
  friendly_id :title, use: [:slugged]

  validates :title, presence: true
  validates :description, presence: true
  validates :body, presence: true
end
